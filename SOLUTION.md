# Solution

## Overview

A web-only Flutter demo of a single-merchant grocery flow: catalog → cart →
checkout (with a delivery slot) → timed sign-in → order → order history. It runs
with no backend: an offline demo GraphQL "server" keeps its data in the browser
(Hive / IndexedDB), and a real server can be used instead with
`--dart-define=GRAPHQL_ENDPOINT=…`.

## Architecture

```
lib/
  app/         route names, GetPages, AuthGuard, Nav (all navigation rules)
  controller/  GetX controllers, one per page/flow
  services/    StorageService (Hive), GraphQLService, CartService
  database/    .graphql operations + generated code, scalars, offline DemoLink
  models/      DeliverySlot, OrderStatus, Product
  views/       pages/ and reusable modules/ (incl. responsive.dart)
```

**Startup (`main.dart`):** open Hive → restore sign-in state → create the GraphQL
client (demo link or HTTP) → `runApp`. `UrlReplaceObserver` is registered before
`runApp` so typed URLs go through the app's own navigation rules.

**Example flow, "place order":** Checkout page → `CheckoutController` → one
`placeOrder` mutation (items, total, slot, payment hold) → demo DB saves the order
under the cart's ID and starts a new cart → `Nav` opens `/order/N` with only home
behind it → `OrderController` polls when the next status change is due.

## Key decisions

### State management & navigation: GetX

- **Decision:** GetX controllers, named routes (`app_pages.dart`) and a single `Nav`
  helper that decides where every link goes.
- **Why:** Get is a well maintained Statemanagement tool while allowing more time to be used on UX and UI
- **Navigation rules:** the stack can only take a few shapes, so back never piles up
  pages: Cart and Orders always sit directly on home; an order opened from the list
  goes back to the list; a just-placed order goes back to home; sign-in removes
  itself when done. A page opened with nothing behind it (link, reload) goes home.
- **URL edits replace the page** (`UrlReplaceObserver`) instead of stacking a new one.
- **Gotchas hit along the way:**
  - `Get.parameters` only holds the *latest* route's params, so checkout lost its
    cart ID once sign-in opened on top (the Place order button vanished).
    Controllers now capture their `:id` once on open.
  - `Get.put` won't replace an existing controller, so editing `/order/2` →
    `/order/1` still showed order 2. Order/checkout controllers are now tagged by
    their URL ID.
- **Alternatives:** Riverpod creates bloat,which leads to anomalous behavior and dificulty debugging, although it is more stable as a dependancy. 
- Bloc is used for large app's with many sub features as you might expect in a multi layered app with multiple sub accounts possible in one eco system and inherently cumbersome and time expensive to maintain for small to medium apps.

### Data layer: GraphQL + codegen

- **Decision:** one `schema.graphql`, `.graphql` operation files, `graphql_codegen`
  for typed Dart, and an offline `DemoLink` (300 ms fake latency) as the default.
- **Why demo mode:** there is no backend yet; without it every request failed with
  `Failed to fetch` against `localhost:4000`. A real server just needs the same
  operations and CORS for the dev origin.
- **Lenient scalars (`scalars.dart`):** generated parsers expect exact JSON types, so
  IDs sent as numbers, `amountInCents` as `1250.0`/`"1250"`, and epoch or
  timezone-less dates crashed or shifted. Custom `ID`/`Int`/`ISODateTime` converters
  accept these; nonsense values still throw a clear `FormatException`.
- **Naming:** files snake_case, GraphQL fields camelCase (`fetchOrder`,
  `amountInCents`, `lastUpdated`). A real backend must use the same names.
- **Trade-off:** dates without a timezone are assumed UTC.

### Persistence: Hive (IndexedDB)

- **What is stored:** current cart quantities, last cart ID, chosen delivery slot per
  order, sign-in flag, the GraphQL cache, and the whole demo DB (orders survive a
  reload).
- **Reset:** DevTools → Application → Storage → Clear site data.

### Authentication (demo)

- **Decision:** sign-in is a boolean plus a 3 s timer, not real auth.
- Required to place an order and to see `/orders` and `/order/:id` (`AuthGuard`
  redirects to sign-in with `?next=` and continues to the requested page).
- At checkout, **Sign in & place order** signs in and places the order in one go.
- The app-bar account button reflects the state (outlined icon vs. icon with green
  check and a My orders / Sign out menu); the orders icon only shows when signed in.
- **Changed later:** first not persisted (a reload signed you out); now saved in Hive
  so a reload keeps you signed in.

### Cart & order IDs

- Each cart has its own ID that becomes the order ID: `/cart/3` → `/checkout/3` →
  `/order/3`; placing the order starts `/cart/4`.
- Opening an old cart/checkout shows "not your current cart" with **View order #N**;
  the top-right cart button is the only way to the current cart.

### Checkout, payment & order status

- **Delivery slots:** three fixed one-hour slots (19:00–20:00, 20:00–21:00,
  21:00–22:00). Place order is disabled until one is picked.
- **Payment:** placing the order puts a *hold* on the payment; the demo DB captures it
  5 s later and the order shows **Paid**.
- **Status:** Awaiting payment → Confirmed (payment captured) → Out for delivery
  (slot start) → Delivered (slot end). `nextStatusChange` works out when the next
  change is due and the page refreshes itself then (retrying every 2 s if late).
- **Trade-off:** fixed slots, no real payment provider; status is computed by the
  (demo) server rather than pushed.

### Web specifics

- **Responsive layout** (`views/modules/responsive.dart`), width-based only:

  | | Mobile < 600 | Tablet < 1024 | Desktop |
  |---|---|---|---|
  | Gutter | 16 | 24 | 32 |
  | Content max width | full | 720 | 1120 |
  | Catalog columns | 1 (list) | 2 | 3 |

  Height is not used.
- **Clean URLs:** `usePathUrlStrategy()` (`/orders`, not `/#/orders`). Hosting needs
  an `index.html` fallback for reloads/deep links (see README).
- **Slow local load:** mostly debug mode (DDC, unminified, source maps), the CanvasKit
  download, and the debugger connection. `flutter run --release` or
  `flutter build web` shows the real load time.

## Trade-offs & limitations

| Area | Trade-off made | Impact |
| ---- | -------------- | ------ |
| Auth | Timed boolean, stored in Hive | No real identity or security |
| Backend | Offline demo DB in the browser by default | Data is per browser; no sync |
| Persistence | Delivery slot / DB kept locally | Clearing site data loses orders |
| Checkout | Three fixed slots, simulated payment hold/capture | Not a real schedule or PSP |
| Status | Client refreshes when a change is due | No push updates |
| Layout | Width breakpoints only | Height not considered |
| Hosting | Path URLs | Server needs `index.html` fallback |
| Testing | Manual verification during build; tests left for last | Suite is currently out of date and fails to compile |
| UI | Flow/UX done first | Visual polish still pending |

## Testing

- **Approach:** while building, the flow was verified manually in the browser and
  `flutter analyze` kept clean; tests were deliberately left for the end.
- **Existing tests (`test/`):** navigation, checkout slots, GraphQL queries against a
  mocked client, demo link, lenient scalars.
- **Status:** out of date after the later changes (cart IDs, payment, `Nav`,
  controllers) and currently fail to compile.
- **Run:** `flutter test`.

## Future improvements

- Update the test suite to the current flow.
- Visual design pass on the UI.

## AI usage

Built with Claude Code across three sessions on 2026-11-13. I wrote the
requirements and checked each step by hand in the browser; Claude
implemented them, explained causes when bugs came up, and kept the README up to
date.

### Prompt log

Typos kept as written. Interruptions omitted.

**Session 1: boilerplate**

1. this is a wip flutter web app. your task is the following
   1) finish the boiler plate of the app
   2) check the camel case etc is as expcted
   3) create the boiler plates or scaleton of the controllers for the 'get' package
   4) this is a web only repo for demostration(keep this in mind)
   5) use the Main folder commets (the pages) to enbale the navigation.
   6) Sign-in is only a timed page and you can add the timed schdular as for redirect. I'll add that right after.
   7) run the graphql to test
   8) install any depedencies we require(hive)
2. we have seen a few issues with the Data types as we open carts/orders please fix
3. *(pasted error)* `OperationException(linkException: ServerException(... Failed to fetch, uri=http://localhost:4000/graphql ...)`
4. On checkout you need to add a Time slots, say 19:00 - 20:00 and up to 3 , can be fixed
5. go again did not see updates so was expetecing crash

**Session 2: flow and UX**

6. the home page needs to be improved,
   1) the Merchants near me needs to be removed(we have one merchant)
   2) the cart needs to be a button possible cloud with numbers on current cart
   3) the catalog needs tobe able to add and remove items from cart
7. keep the merchants plural near me. and continue form their on
8. let's continue with work first.
   1) the payment part needs to have a 'hold' and after 5 seconds of placing the order referesh and in db and indicate 'paid'
   2) Use the viewport size to adjust the sized we use. Mobile vs Desktop etc dynamically
9. we will do tests last as they take time.I'll manully verfiy on myside
10. a few issues
    1) the url cart/1 and order/1 etc needs to keep tracks of orders
    2) we need a orders(with) history of orders page
    3) we need with each order a status of orders
    4) when selecting the time slot the icons calsh as when you slect the other does not go away
11. the next cart button logic needs removing, we will use the button right top only.
    after the order is confirmed/awaiting payment and the user clicks back they should be navigated to the root.
    from their they may select orders again.
    the sign-in should be a simple boolean and timer for demo purposes
12. sign-in is required to place order.
    a simple timed sign-in is okay
    when you visit your orders and click back from orders you need to logically go back offall named to root etc. it should not stack for a cohernece flow app wide
13. after signin im again on http://localhost:51840/#/checkout/1
14. place order button is missing
15. the icon on the page to indcate signed in or not needs to be correct, for exmple if I'm not signed in I should not be able to see my orders
16. when I manually update the url to be http://localhost:52058/#/order/1 form /2 the page needs to fetch the /2 and load order 2 in this case etc
17. I can make URL edits replace the current page instead if you'd like. -> Please do
18. in README.md tell the user how to run locally
19. where do we do the dynamic viewport height width?
20. next question why does flutter web take solon got load on my local?

**Session 3: polish and docs**

21. in this flutter web app demo. If I refresh the webpage I should not be logged out please fix
22. the tests are out dated , we can circle back
23. how to re move the '#' in the url flutter uses?
24. add the above to readme
25. • A SOLUTION.md describing the design and trade-offs you made. please create sceleton for me to fill in
26. use my claude history to fill in where aplicable

# flutter_webview_cart

Web-only Flutter demo of a catalog → cart → checkout → order flow for a single
merchant (GetX, GraphQL, Hive).

## Run locally

### Prerequisites

- Flutter SDK (stable channel) with Dart `^3.14` (`flutter --version`)
- Google Chrome (the app is web-only)

Check your setup with `flutter doctor`; only the **Chrome** line needs to be green.

### Steps

```sh
git clone <this repo>
cd flutter_webview_cart
flutter pub get                 # install dependencies
flutter run -d chrome           # build and open the app in Chrome
```

That's all: with no server configured the app runs in **demo mode**, against a
built-in offline GraphQL backend (`lib/database/demo_link.dart`) that stores its
data in the browser (Hive / IndexedDB). No backend, database or API keys needed.

While `flutter run` is active: `r` hot-reloads, `R` hot-restarts, `q` quits.

To serve on a fixed port (handy for bookmarking URLs such as `/#/orders`):

```sh
flutter run -d web-server --web-port 8080   # then open http://localhost:8080
```

### Try the flow

1. **Home** — add items with **Add** / **+** / **−**; the cart badge (top right) shows the count.
2. **Cart** (badge) → **Checkout** → pick a delivery slot.
3. **Sign in & place order** — the demo sign-in is a 3-second timer, then the order is placed.
4. **Order** page — status starts at *Awaiting payment* (payment on hold) and turns
   *Confirmed* / *Paid* after ~5 s; later *Out for delivery* and *Delivered* follow the slot times.
5. **My orders** (receipt icon or account menu, signed-in only) lists order history.

Sign-in is saved in Hive, so a page reload keeps you signed in; use **Sign out** to end it.

### Reset the demo data

Orders, the cart and the cart-id counter live in the browser's IndexedDB. To start
fresh: Chrome DevTools → **Application** → **Storage** → **Clear site data**, then reload.

## Using a real GraphQL server

```sh
flutter run -d chrome --dart-define=GRAPHQL_ENDPOINT=http://localhost:4000/graphql
```

The server must implement `lib/database/schema.graphql` (queries `fetchOrder`,
`fetchOrders`, … and the `placeOrder` mutation) and allow CORS from the Flutter dev
origin, or the browser reports `Failed to fetch`.

## Development

```sh
dart run build_runner build     # regenerate *.graphql.dart after editing any .graphql file
flutter analyze
flutter test
flutter build web               # production build in build/web/
```

## Layout

```
lib/
  main.dart                 init Hive + GraphQL services, URL observer, GetMaterialApp
  app/app_routes.dart       route names (Routes.orderPath('42') …)
  app/app_pages.dart        GetPage list + controller bindings (tagged per :id)
  app/nav.dart              all navigation (Nav.*), back-stack rules, URL edits
  app/auth_guard.dart       signed-in-only routes -> timed sign-in
  services/                 GraphQLService, StorageService (Hive), CartService
  controller/               GetX controllers (one per data-backed page)
  models/                   Product catalog, DeliverySlot, OrderStatus helpers
  database/schema.graphql   single schema; queries/ holds operations
  database/demo_link.dart   offline demo backend (persisted in Hive)
  views/pages/              one *_page.dart per route
  views/modules/            reusable widgets (responsive helpers, chips, buttons)
```

Routes: `/` (catalog), `/cart/:id`, `/checkout/:id`, `/orders`*, `/order/:id`*,
`/sign_in`, `/geo_merchants`, `/details/:id` — *requires sign-in.

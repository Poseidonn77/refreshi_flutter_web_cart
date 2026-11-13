# flutter_webview_cart

Web-only Flutter demo of a cart → checkout → order flow (GetX, GraphQL, Hive).

## Run

```sh
flutter pub get
dart run build_runner build          # regenerate *.graphql.dart after editing .graphql files
flutter run -d chrome --dart-define=GRAPHQL_ENDPOINT=http://localhost:4000/graphql
flutter test
```

## Layout

```
lib/
  main.dart                 init Hive + GraphQL services, GetMaterialApp
  app/app_routes.dart       route names (Routes.cartPath('42') …)
  app/app_pages.dart        GetPage list + controller bindings
  services/                 GraphQLService, StorageService (Hive / IndexedDB)
  controller/               GetX controllers (one per data-backed page)
  database/schema.graphql   single schema; queries/ holds operations
  views/pages/              one *_page.dart per route
  views/modules/            reusable widgets
```

Routes: `/`, `/geo_merchants`, `/details/:id`, `/cart/:id`, `/checkout/:id`, `/order/:id`, `/sign_in`.
Sign-in is a timed placeholder (`SignInController.redirectDelay`) that redirects to `?next=` or `/geo_merchants`.

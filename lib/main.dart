import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:material_ui/material_ui.dart'
    show DefaultMaterialLocalizations, Theme;

import 'app/app_pages.dart';
import 'app/app_theme.dart';
import 'app/nav.dart';
import 'controller/sign_in_controller.dart';
import 'services/cart_service.dart';
import 'services/graphql_service.dart';
import 'services/storage_service.dart';

Future<void> main() async {
  // Clean URLs (/orders) instead of the default hash URLs (/#/orders).
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // Before runApp, so it handles browser URL edits ahead of the default
  // handler: an edited URL replaces the current page instead of stacking.
  WidgetsBinding.instance.addObserver(UrlReplaceObserver());
  final storage = await Get.putAsync(
    () => StorageService().init(),
    permanent: true,
  );
  SignInController.restore(storage);
  await Get.putAsync(() => GraphQLService().init(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cart for Lovable Food',
      debugShowCheckedModeBanner: false,
      // GetMaterialApp's `theme` is the framework's ThemeData type, which
      // `material_ui` widgets don't read, so apply our theme here instead.
      builder: (context, child) => Theme(
        data: MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? AppTheme.dark
            : AppTheme.light,
        child: child!,
      ),
      // GetMaterialApp wraps the framework's MaterialApp, which only provides
      // the framework's localizations. Widgets from `material_ui` look up their
      // own MaterialLocalizations type, so register its delegate too.
      localizationsDelegates: const [DefaultMaterialLocalizations.delegate],
      initialBinding: BindingsBuilder.put(() => CartService(), permanent: true),
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
    );
  }
}

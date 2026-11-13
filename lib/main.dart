import 'package:flutter/material.dart';
import 'package:flutter_webview_cart/Landing.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cart for Lovable Food',
      initialRoute: '/',
      // Define all URL routes here
      getPages: [
        GetPage(name: '/', page: () => const Landing()),
        // GetPage(name: '/geo_merchants', page: () => const GeoMerchants()),
        // GetPage(name: '/cart/:id', page: () => const Cart()),
        // GetPage(name: '/detais/:id', page: () => const Details()),
        // GetPage(name: '/sign_in', page: () => const SignIn()),
        // // Dynamic URL parameter (:id)
        // GetPage(name: '/order/:id', page: () => const Orders()),
      ],
    );
  }
}

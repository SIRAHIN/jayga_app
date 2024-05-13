import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayga_app/routes/routes_name.dart';
import 'package:jayga_app/routes/routes_screen.dart';

void main() =>   runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JAYGA APP',
      initialRoute: RoutesName.homeScreen,
      getPages: routes,
    );
  }
}
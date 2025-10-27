import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task/views/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      builder: (context, child) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        return child!;
      },
      home: Dashboard(),
    );
  }
}

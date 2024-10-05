import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promilo_task_3_10/modules/youtube/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YouTube Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}

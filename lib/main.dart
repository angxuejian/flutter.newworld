import 'package:flutter/material.dart';
import 'package:flutter_newworld/pages/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      initialRoute: Pages.home,  // 设置初始路由
      routes: Pages.all,  // 引入 routes 配置
    );
  }
}
import 'package:cconvert/config/themes.dart';
import 'package:cconvert/provider/app_provider.dart';
import 'package:cconvert/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool mode = Provider.of<AppProvider>(context).isDark;
    return MaterialApp(
      title: 'Currencies Converting',
      debugShowCheckedModeBanner: false,
      theme: mode == false ? getLight() : getDark(),
      home: const Home(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled17/home.dart';
import 'package:untitled17/honor.dart';
import 'package:untitled17/in.dart';
import 'package:untitled17/red.dart';
import 'package:untitled17/signup.dart';
import 'package:untitled17/sumsong.dart';
import 'package:untitled17/tecno.dart';
import 'package:untitled17/vivo.dart';
import 'package:untitled17/vivot.dart';
import 'package:untitled17/cart.dart';
import 'package:untitled17/cartcontroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignUp(),
      routes: {
        "vivot":(context) => Vivot(),
        "red":(context) => Red(),
        "in":(context) => In(),
        "vivo":(context) => Vivo(),
        "honor":(context) => honor(),
        "sum":(context) => Sum(),
        "tecno":(context) => Tec(),
      },

      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


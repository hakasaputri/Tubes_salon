import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tubes_provis/Pages/LoginRegister/LoginForm.dart';
import 'package:tubes_provis/Pages/LoginRegister/SignupForm.dart';
import 'package:tubes_provis/Pages/LoginRegister/Logo.dart';
import 'package:tubes_provis/Pages/Help/HelpForm.dart';
import 'package:tubes_provis/utils.dart';
import 'package:tubes_provis/Pages/LoginRegister/Get_started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tubes Provis',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Pink,
          scaffoldBackgroundColor: Colors.white,
        ),

        initialRoute: "/",
        routes: {
          '/sign_up' : (contex) => SignupForm(),
          '/login' : (contex) => LoginForm(),
          '/get_started' : (contex) => Get_started(),
          '/' : (contex) => Logo(),
          '/help' : (contex) => HelpForm(),
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm()
    );
  }
}

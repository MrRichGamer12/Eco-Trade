import 'package:dio/dio.dart';
import 'package:ecotrade/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:ecotrade/pages/login_page.dart';
import 'package:ecotrade/pages/home_page.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:snippet_coder_utils/list_helper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';



void main() {
  var dio = Dio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Eco-Trade';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: LoginPage(),
      ),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (context) => LoginPage(),
        '/RegisterPage': (context) => RegisterPage(),
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}

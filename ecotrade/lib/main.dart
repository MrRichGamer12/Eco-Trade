import 'package:ecotrade/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:ecotrade/pages/login_page.dart';
import 'package:ecotrade/pages/acount_page.dart';
import 'package:ecotrade/pages/home_page.dart';
import 'package:ecotrade/pages/chat_page.dart';
 
void main() {
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
        '/AcountPage': (context) => AcountPage(),
        '/ChatPage': (context) => ChatPage(),
      },
    );
  }
}

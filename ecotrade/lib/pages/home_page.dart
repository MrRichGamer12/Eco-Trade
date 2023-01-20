import 'dart:convert';

import 'package:ecotrade/pages/Product_Model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import "package:flutter/services.dart" as rootBundle;

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;
  const CustomDivider({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class _HomePageState extends State<HomePage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("##0a0a0a"),
        body: ProgressHUD(
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: _HomeUI(context),
        ),
      ),
    );
  }

  Widget _HomeUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Eco-Trade',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.35,
              child:Center(
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.grey,
                    child:
                        Image.asset("/images/product_image0.jpg",width: 150),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child:Row(children:[Text("Frasco de vidro",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)])
                   ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child:Row(children:[Text("Um frasco de vidro que eu quero trocar.",style:TextStyle(fontWeight: FontWeight.normal,fontSize: 20),)])
                   ),
                  SizedBox(height: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.grey,
                    child:
                        Image.asset("/images/product_image1.jpg",width: 150),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child:Row(children:[Text("Caixa de Sapatos",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)])
                   ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child:Row(children:[Text("Uma caixa de sapatos que não preciso.",style:TextStyle(fontWeight: FontWeight.normal,fontSize: 20),)])
                   ),
                  SizedBox(height: 40,),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    color: Colors.grey,
                    child:
                        Image.asset("/images/product_image2.jpg",width: 150),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child:Row(children:[Text("Saco de Proteina",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)])
                   ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                    child:Row(children:[Text("Um saco de Proteina que já acabei.",style:TextStyle(fontWeight: FontWeight.normal,fontSize: 20),)])
                   ),
                ],
              ))),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 84, 84, 84),
                    Color.fromARGB(255, 84, 84, 84)
                  ]),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Column(
                        children: [
                          Image(image: AssetImage('images/Home_active.png')),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "Inicio",
                                    style: const TextStyle(
                                      color: Colors.green,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context, "/HomePage");
                                      }),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      children: [
                        Image.asset("images/Chat.png"),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Chat",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, "/ChatPage");
                                    }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      children: [
                        Image.asset("images/Acount.png"),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Conta",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, "/AcountPage");
                                    }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

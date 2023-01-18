import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class ChatPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#FFFFFF"),
        body: ProgressHUD(
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: _ChatUI(context),
        ),
      ),
    );
  }}
  Widget _ChatUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color:Colors.black)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white]),
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Conversas',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width -10,
            height: MediaQuery.of(context).size.height / 8,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Mensagens',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                ),
              ],
            ),

          ),
          Container(
            width: MediaQuery.of(context).size.width -10,
            height: MediaQuery.of(context).size.height /8*5,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Nenhuma mensagem recebida',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                )
              ],
            ),

          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(255, 37, 36, 36), Color.fromARGB(255, 37, 36, 36)]),
                    ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: Column(  
                    children: [
                      Image(image: AssetImage('images/Home.png')),
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
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/HomePage");
                          }),
                  ],
                ),
              ),
                    ],)
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: Column(
                    children: [
                      Image.asset("images/Chat_active.png"),
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
                          color: Colors.green,
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
                  ),),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
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
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/AcountPage");
                          }),
                  ],
                ),
              ),
                    ],
                  ),)
                ],
              ),
            ]),
          ),
        ],
      ),
      );
    }
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class AcountPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AcountPageState createState() => _AcountPageState();
}

class _AcountPageState extends State<AcountPage> {
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
          child: _AcountUI(context),
        ),
      ),
    );
  }
}

Widget _AcountUI(BuildContext context) {
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
                colors: [Colors.white, Colors.white]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Olá Ricardo',
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 7,
          child:Center(
            child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.5,
          height: MediaQuery.of(context).size.height / 8,
                decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.green, Colors.green,]),
                    ),
              child:RichText(
                 text: TextSpan(
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          children: <TextSpan>[
                          TextSpan(
                  text:'Criar um novo anúncio',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                      recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, "/CreateProductPage");
                                    }
                ),] ,
              ),
          )),],
          ),
        ),),
        Padding( padding: const EdgeInsets.only(top:25),
        child: Container(
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.height / 8 * 5,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color:Colors.black)),),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Os Meus Anúncios',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Nenhum anúncio criado',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Anúncios Guardados',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Nenhum anúncio guardado',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),),
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
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
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, "/HomePage");
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
                      Image.asset("images/Acount_active.png"),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 14.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Conta",
                                style: const TextStyle(
                                  color: Colors.green,
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
                  ),
                )
              ],
            ),
          ]),
        ),],
      )
    );
}

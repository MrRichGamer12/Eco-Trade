import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class AcountPage extends StatefulWidget {
  const AcountPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AcountPageState createState() => _AcountPageState();
}

class _AcountPageState extends State<AcountPage> {
  String image="/images/Acount.png";
  bool isAPIcallProcess = false;
  Future tiraFoto() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      print(image);
      setState(() => this.image ="/images/Imagem_Perfil.jpg");
    } on PlatformException catch (e) {
      print("Falha a Tirar a Fotografia");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: HexColor("#FFFFFF"),
            body: ProgressHUD(
                inAsyncCall: isAPIcallProcess,
                opacity: 0.3,
                key: UniqueKey(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 6+53,
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.white, Colors.white]),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          Spacer(),
                          Image.asset(
                            image,
                            width: 52,
                            height: 52,
                            fit: BoxFit.cover,
                          ),
                          ElevatedButton(
                              onPressed: () => tiraFoto(),
                              child: Text("Tira a tua foto")),
                              const SizedBox(
                              width: 65,
                              height: 24,
                            ),
                            Center(
                                child: ElevatedButton(
                                    onPressed: () => tiraFoto(),
                                    child: Text("Crie um Produto")))
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.5-18,
                     child: Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 10,
                        height:
                            MediaQuery.of(context).size.height / 10 * 4 + 19,
                        decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.black)),
                        ),
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.center,
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
                            Container(
                              height: 50,
                              decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Column(
                                      children: [
                                        Image(
                                            image:
                                                AssetImage('images/Home.png')),
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
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              "/HomePage");
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
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            "/ChatPage");
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
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            "/AcountPage");
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
                ))));
  }
}

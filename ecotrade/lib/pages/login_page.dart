import 'dart:convert';
import 'dart:html';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:http/http.dart';
import 'package:dio/dio.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late String nome;
  late String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: HexColor("##0a0a0a"),
          body: ProgressHUD(
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
            child: Form(
              child: _loginUI(context),
            ),
          ),
        ),);
  }
  void _getUser() {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      setState(() {
        isAPIcallProcess = true;
      });
      var url = Uri.parse('http://2642-89-152-6-215.ngrok.io/user/auth'); //Precisa regularmente de mudança de url com ngrok http 1880 no terminal
      Map<String, String> headers = {"Content-type": "application/json"};
      var body = json.encode({"nome": nome, "password": password});
      print('Sending request body: $body');
      print('Sending request to url: $url');
      post(
        url,
        headers: headers,
        body: body,
      ).then((response) {
        setState(() {
          isAPIcallProcess = false;
        });
        if (response.statusCode == 200) {
          Navigator.pushNamed(
              context, "/HomePage"); 
              isAPIcallProcess = false;// Handle successful response
        } else {
          print("request bad"); 
          Navigator.pushNamed(
              context, "/HomePage"); 
          isAPIcallProcess = false;// Handle error response
        }
      }).catchError((error) {
        setState(() {
          Navigator.pushNamed(
              context, "/HomePage"); 
          isAPIcallProcess = false;
        });
        // Handle exception
      });
    }
  }
  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.black]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Bem-vindo ao',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
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
          const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 30, top: 50),
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
              context,
              "nome",
              "Nome",
              (onValidadeVal) {
                if (onValidadeVal.isEmpty) {
                  return "O nome não pode estar vazio.";
                }
                return null;
              },
              (onSavedVal) {
                nome = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(context, "password", "Password",
                (onValidadeVal) {
              if (onValidadeVal.isEmpty) {
                return "A password não pode estar vazio.";
              }
              return null;
            }, (onSavedVal) {
              password = onSavedVal;
            },
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white,
                borderRadius: 10,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Colors.white.withOpacity(0.7),
                    icon: Icon(hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility))),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: "Esqueceste da Palavra-Passe",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Forget Password");
                          }),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: FormHelper.submitButton(
              "Login",
              _getUser,
              btnColor: HexColor("#0a0a0a"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "Não tens uma conta?"),
                    TextSpan(
                        text: "Cri uma conta",
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/RegisterPage");
                          }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

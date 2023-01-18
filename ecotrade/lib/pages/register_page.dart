import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:http/http.dart';

// ignore: use_key_in_widget_constructors
class RegisterPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? nome;
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
        child: Form(
          key: globalFormKey,
          child: _registerUI(context),
        ),
      ),
    ));
  }

  void _postUser() {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();
      setState(() {
        isAPIcallProcess = true;
      });
      var url = Uri.parse('http://2642-89-152-6-215.ngrok.io/user/register'); //Precisa regularmente de mudança de url com ngrok http 1880 no terminal
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

  Widget _registerUI(BuildContext context) {
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
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Align(
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
                const Align(
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
                'Registar',
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
                  return "Nome can\'t be empty.";
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
                return "Password can\'t be empty.";
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
          const SizedBox(height: 20),
          Center(
            child: FormHelper.submitButton(
              "Registar",
              () {
                
                _postUser();
              },
              btnColor: HexColor("#0a0a0a"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
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
                    const TextSpan(text: "Já tens uma conta?"),
                    TextSpan(
                        text: "Faz Login",
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/LoginPage");
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

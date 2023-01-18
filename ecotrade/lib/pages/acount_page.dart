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
  }}
  Widget _AcountUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: []),
    );}
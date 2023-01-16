import 'package:flutter/material.dart';

class MongoDBInsert extends StatefulWidget {
  const MongoDBInsert({Key? key}) : super(key: key);

  @override
  State<MongoDBInsert> createState() => _MongoDBInsertState();
}

class _MongoDBInsertState extends State<MongoDBInsert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            'Insert Data',
            style: TextStyle(fontSize: 22),
          )
        ],
      )),
    );
  }
}

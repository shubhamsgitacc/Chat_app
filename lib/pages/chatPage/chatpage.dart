// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  String name;
  int id;
  ChatPage({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
        ),
      ),
    );
  }
}

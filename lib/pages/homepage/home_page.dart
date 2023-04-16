// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_app/pages/homepage/widgets/chat_listview.dart';
import 'package:chat_app/pages/homepage/widgets/status_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String title;
  ScrollController scrollController;
  HomePage({super.key, required this.title, required this.scrollController});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: scrWidth,
                height: 70,
                child: StatuswidgetList()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ChatList(
                  scrollController: widget.scrollController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

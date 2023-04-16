// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chat_app/pages/chatPage/chatpage.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  ScrollController scrollController;
  ChatList({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              itemCount: 50,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              controller: scrollController,
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, indext) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(name: 'name', id: indext)));
                      },
                      child: ChatHead()),
                );
              }),
        ),
      ],
    );
  }
}

class ChatHead extends StatelessWidget {
  const ChatHead({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      // color: Color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepPurple)),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Eren Yeager',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'Hello',
                style: TextStyle(fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }
}

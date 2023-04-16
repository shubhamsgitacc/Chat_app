// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class StatuswidgetList extends StatelessWidget {
  const StatuswidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return StatusWidget();
              }),
        ),
      ],
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                  color: Colors.blueAccent),
              height: 66,
              width: 66,
            ),
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: CircularProgressIndicator(
              value: 0,
              strokeWidth: 1,
              color: Colors.orangeAccent,
              backgroundColor: Color.fromRGBO(134, 133, 133, 1),
            ),
          ),
        ],
      ),
    );
  }
}

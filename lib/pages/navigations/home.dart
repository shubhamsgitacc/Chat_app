// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chat_app/pages/chatPage/chatpage.dart';
import 'package:chat_app/pages/feedpage/feedPage.dart';
import 'package:chat_app/pages/homepage/home_page.dart';
import 'package:chat_app/pages/profile/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavHomePage extends StatefulWidget {
  const NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  // List<Widget> pageList = <Widget>[HomePage, ChatPage, ProfilePage];
  int index = 0;
  ontap(int anum) {
    itemNum.value = anum;
  }

  ValueNotifier<int> itemNum = ValueNotifier<int>(0);
  getWidget(int index) {
    switch (index) {
      case 0:
        return HomePage(
          title: 'title',
          scrollController: _scrollController,
        );
        break;
      case 1:
        return FeedPage();
        break;
      case 2:
        return ProfilePage();
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('inside');
    _scrollController.addListener(() {
      print(_scrollController.offset);
      print(_scrollController.position.userScrollDirection);
      setState(() {
        position = _scrollController.offset;
        _scrollDirection =
            _scrollController.position.userScrollDirection.toString();
      });
      hideNavigation();
    });
  }

  double finalPos = 0.0;
  double position = 0.0;
  String _scrollDirection = '';
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    print(finalPos);
    // hideNavigation();
    // print(_scrollController.offset);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: itemNum,
                builder: ((context, value, child) => getWidget(itemNum.value))),
            Align(
                alignment: Alignment(0, finalPos),
                child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 65,
                    constraints: BoxConstraints(minWidth: 0, maxWidth: 200),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, ind) =>
                                navigatonWidget(ind, index, Icon(Icons.abc))),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  navigatonWidget(int cur, int idnex, Widget widget) {
    return ValueListenableBuilder(
      valueListenable: itemNum,
      builder: (context, value, child) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: cur == itemNum.value ? Colors.black : Colors.transparent),
        child: IconButton(
          onPressed: () {
            ontap(cur);
          },
          icon: Icon(
            cur == 0
                ? Icons.chat
                : cur == 1
                    ? Icons.search
                    : Icons.person,
            color: cur == itemNum.value ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  hideNavigation() {
    if (_scrollDirection == 'ScrollDirection.reverse' && position > 50) {
      setState(() {
        finalPos = finalPos < 2
            ? position > 50
                ? (position + 50) / 100
                : 1
            : 2;
      });
      print(finalPos.toString() + 'finla pos');
    } else if (_scrollDirection != 'ScrollDirection.reverse') {
      setState(() {
        finalPos = 1;
      });
    }
  }
}

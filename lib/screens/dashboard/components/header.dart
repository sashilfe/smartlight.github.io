import 'package:admin/controllers/MenuController.dart';
import 'package:admin/database/firebase_db.dart';
import 'package:admin/providers/user_provider.dart';
import 'package:admin/repositories/user_repor.dart';
import 'package:admin/responsive.dart';
import 'package:admin/services/auth.dart';
import 'package:admin/widgets/ProfileCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Header extends StatefulWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var extraLargeScreenGrid = currentWidth > 1536;
    var largeScreenGrid = currentWidth > 1366;
    var smallScreenGrid = currentWidth > 1201;
    var extraSmallScreenGrid = currentWidth > 1025;
    var tabScreenGrid = currentWidth > 769;

    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Text("Painel", style: TextStyle(color: Color(0x00252733))),
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text("Painel",
              style: TextStyle(
                  color: Color(0xFF252733),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        /*Expanded(
            child: SearchField(
          largeScreenGrid: largeScreenGrid,
          smallScreenGrid: smallScreenGrid,
        )),*/
        NotifiyCard(),
        Container(
          height: 27.0,
          width: 1.0,
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          color: Color(0xFFDFE0EB),
        ),
        ProfileCard(
          userProvider: userProvider,
        )
      ],
    );
  }
}

class NotifiyCard extends StatelessWidget {
  const NotifiyCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Tooltip(
            message: 'Alertas',
            child: Container(
              padding: EdgeInsets.all(05.0),
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/notify.svg',
                    color: Colors.grey,
                    height: 20,
                  ),
                  Positioned(
                    right: 0.0,
                    top: 0.0,
                    child: Stack(
                      children: <Widget>[
                        Icon(
                          Icons.brightness_1,
                          size: 08.0,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    this.largeScreenGrid,
    this.smallScreenGrid,
  }) : super(key: key);

  final largeScreenGrid;
  final smallScreenGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      height: 40.0,
      width: largeScreenGrid
          ? 500.0
          : smallScreenGrid
              ? 500.0
              : 400.0,
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.only(bottom: 2.0, right: 10.0),
              child: Icon(
                Icons.search,
                color: Colors.blue,
                size: 22.0,
              ),
            ),
            filled: true,
            fillColor: Color(0xFFEEEEEE),
            contentPadding: const EdgeInsets.only(left: 25, top: 30.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontSize: 15.0),
            hintText: 'Search here...'),
        textInputAction: TextInputAction.search,
        onChanged: (String value) {},
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black87,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 0.000000000001,
        ),
      ),
    );
  }
}

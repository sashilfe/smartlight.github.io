import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

int selectedIndex = 0;

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Container(
          height: MediaQuery.of(context).size.height,
          //color: bgColor,
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  height: (MediaQuery.of(context).size.height) * 0.1,
                  padding: EdgeInsets.only(left: 31),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 33,
                        height: 52,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Smart",
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: txColor,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "Light",
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              DrawerListTile(
                title: "Painel",
                svgSrc: "assets/icons/menu_dashbord.svg",
                press: () {
                  print(MediaQuery.of(context).size.width);
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                selec: 0,
              ),
              DrawerListTile(
                title: "Cadastro",
                svgSrc: "assets/icons/menu_tran.svg",
                press: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                selec: 1,
              ),
              DrawerListTile(
                title: "Manutenção",
                svgSrc: "assets/icons/menu_task.svg",
                press: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                selec: 2,
              ),
              Divider(
                color: secondaryColor,
                height: 2.0,
              ),
              DrawerListTile(
                title: "Configurações",
                svgSrc: "assets/icons/menu_setting.svg",
                press: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                selec: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.press,
    @required this.selec,
  }) : super(key: key);

  final String title, svgSrc;
  final int selec;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: primaryColor,
          height: 48.0,
          width: selec == selectedIndex ? 2.0 : 0.0,
        ),
        Expanded(
          child: ListTile(
            onTap: press,
            horizontalTitleGap: 0.0,
            leading: SvgPicture.asset(
              svgSrc,
              color: selec == selectedIndex ? primaryColor : Colors.white54,
              height: 16,
            ),
            title: Text(
              title,
              style: TextStyle(
                  color: txColor,
                  fontWeight: selec == selectedIndex
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}

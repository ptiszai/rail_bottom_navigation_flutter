import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rail_bottom_navigation_flutter/l10n/locale_keys.g.dart';
import 'package:rail_bottom_navigation_flutter/main.dart';
import 'package:rail_bottom_navigation_flutter/utils.dart';

enum SingingCharacter { hu, en }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void menuset() async {
    setState(() {
      _scaffoldKey.currentState!.openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.homePageAppBarTitle.tr()),
          actions: languageFlag(context, () {
            setState(() {});
          }),
        ),
        bottomNavigationBar:
            MyBottomNavigationBar(menu: true, functionmenu: () => menuset()),
        key: _scaffoldKey,
        drawer: MyNavigationRail(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/720x1520-background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/flutter.jpg"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                child: Column(children: <Widget>[
                  Text(
                    'Version: ${MainPage.packageInfo.version}',
                  ),
                  Text(
                    'Internet: ${MainPage.connectStr}',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 14),
                  ),
                ])),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:rail_bottom_navigation_flutter/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rail_bottom_navigation_flutter/utils.dart';

class SomethingPage extends StatefulWidget {
  SomethingPage({super.key});

  @override
  State<SomethingPage> createState() => _SomethingPageState();
}

class _SomethingPageState extends State<SomethingPage> {
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
        title: Text(LocaleKeys.viconName3.tr()),
        actions: languageFlag(context, () {
          setState(() {});
        }),
      ),
      bottomNavigationBar:
          MyBottomNavigationBar(menu: true, functionmenu: () => menuset()),
      key: _scaffoldKey,
      drawer: MyNavigationRail(),
      body: Container(
        color: Color.fromARGB(255, 149, 2, 175),
        alignment: Alignment.center,
        child: Text(
          LocaleKeys.viconName3.tr(),
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

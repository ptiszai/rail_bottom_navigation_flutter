import 'package:flutter/material.dart';
import 'package:rail_bottom_navigation_flutter/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rail_bottom_navigation_flutter/utils.dart';

class QRcodePage extends StatefulWidget {
  QRcodePage({super.key});

  @override
  State<QRcodePage> createState() => _QRcodePageState();
}

class _QRcodePageState extends State<QRcodePage> {
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
        title: Text(LocaleKeys.viconName4.tr()),
        actions: languageFlag(context, () {
          setState(() {});
        }),
      ),
      bottomNavigationBar:
          MyBottomNavigationBar(menu: true, functionmenu: () => menuset()),
      key: _scaffoldKey,
      drawer: MyNavigationRail(),
      body: Container(
        color: Color.fromARGB(255, 240, 231, 150),
        alignment: Alignment.center,
        child: Text(
          LocaleKeys.viconName4.tr(),
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

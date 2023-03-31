import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:rail_bottom_navigation_flutter/l10n/locale_keys.g.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:rail_bottom_navigation_flutter/l10n/language.dart';
import 'package:rail_bottom_navigation_flutter/l10n/l10.dart';
import 'package:rail_bottom_navigation_flutter/pages/home_page.dart';
import 'package:rail_bottom_navigation_flutter/pages/contacts_page.dart';
import 'package:rail_bottom_navigation_flutter/pages/account_page.dart';
import 'package:rail_bottom_navigation_flutter/pages/news_page.dart';
import 'package:rail_bottom_navigation_flutter/pages/programs_page.dart';
import 'package:rail_bottom_navigation_flutter/pages/something_page.dart';
import 'package:rail_bottom_navigation_flutter/pages/qrcode_page.dart';
import 'package:rail_bottom_navigation_flutter/pages/about_page.dart';

final logger = SimpleLogger();
Language language = Language.languageList()[0];
bool menuextended_global = false;
int selectedPage = 1;
int selectedMenuIndex = 1;

void main() async {
  logger.setLevel(
    Level.INFO,
    includeCallerInfo: true,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: L10n.all,
    path: 'assets/l10n',
    useOnlyLangCode: true,
    fallbackLocale: L10n.all[0],
    child: const MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static bool isButtonEnabled = false;
  static String connectStr = "none";
  static PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  //ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  //late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    initConnectivity();

    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  final _routes = {
    '/': (context) => HomePage(),
    '/contacts': (context) => ContactsPage(),
    '/account': (context) => AccountPage(),
    '/news': (context) => NewsPage(),
    '/programs': (context) => ProgramsPage(),
    '/something': (context) => SomethingPage(),
    '/qrcode': (context) => QRcodePage(),
    '/about': (context) => AboutPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.homePageAppBarTitle.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: _routes,
      initialRoute: '/',
    );
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      MainPage.packageInfo = info;
    });
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      //  _connectionStatus = result;
      switch (result) {
        case ConnectivityResult.none:
          MainPage.connectStr = LocaleKeys.internetState0.tr();
          break;
        case ConnectivityResult.bluetooth:
          MainPage.connectStr = "bluetooth";
          break;
        case ConnectivityResult.ethernet:
          MainPage.connectStr = "ethernet";
          break;
        case ConnectivityResult.mobile:
          MainPage.connectStr = "mobil";
          break;
        case ConnectivityResult.wifi:
          MainPage.connectStr = "wifi";
          break;
        case ConnectivityResult.vpn:
          MainPage.connectStr = "vpn";
          break;
        case ConnectivityResult.other:
          MainPage.connectStr = LocaleKeys.internetState1.tr();
          break;
      }
      MainPage.isButtonEnabled =
          (result == ConnectivityResult.none) ? false : true;
    });
  }
}

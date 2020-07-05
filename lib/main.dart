import 'package:ecoin/constants.dart';
import 'package:ecoin/screens/chat.dart';
import 'package:ecoin/screens/home.dart';
import 'package:ecoin/screens/home_details.dart';
import 'package:ecoin/screens/login.dart';
import 'package:ecoin/screens/markets.dart';
import 'package:ecoin/screens/orders.dart';
import 'package:ecoin/screens/setting.dart';
import 'package:ecoin/screens/settingDetails/deposit.dart';
import 'package:ecoin/screens/settingDetails/send.dart';
import 'package:ecoin/screens/settingDetails/wallet.dart';
import 'package:ecoin/screens/settingDetails/withdraw.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          canvasColor: Color(0xff242424),
          appBarTheme: AppBarTheme(color: kBackgroundColor, elevation: 0),
        ),
        title: 'eCoin',
        home: NavigationBar(),
        routes: {
          Deposit.route: (context) => Deposit(),
          Send.route: (context) => Send(),
          Withdraw.route: (context) => Withdraw(),
          Wallet.route: (context) => Wallet(),
          Login.route: (context) => Login(),
          HomeDetails.route: (context) => HomeDetails(),
        });
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Market(),
    Orders(),
    Chat(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? Image.asset('assets/images/folio_golden.png')
                : Image.asset('assets/images/folio_white.png'),
            title: Text('Folio'),
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Image.asset('assets/images/market_golden.png')
                  : Image.asset('assets/images/market_white.png'),
              title: Text("Market")),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? new Image.asset('assets/images/orders_golden.png')
                  : new Image.asset('assets/images/orders_white.png'),
              title: Text("Orders")),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? new Image.asset('assets/images/chat_golden.png')
                  : new Image.asset('assets/images/chat_white.png'),
              title: Text("Chat")),
          BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? new Image.asset('assets/images/settings_golden.png')
                  : new Image.asset('assets/images/settings_white.png'),
              title: Text("Settings")),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffFFC400),
        unselectedItemColor: const Color(0xffDADADA),
        onTap: _onItemTapped,
      ),
    );
  }
}

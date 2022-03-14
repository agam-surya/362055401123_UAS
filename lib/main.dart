import 'package:flutter/material.dart';
import 'screen/drawer/drawer.dart';
import 'screen/home/widgets/body_widget.dart';
import 'screen/home/widgets/bottom-navbar.dart';
import 'screen/home/widgets/country_widget.dart';
import 'screen/home/widgets/title_widget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedNavbar = 0;
  double bNavBarHeight = 70;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: AppDrawer(),
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Title_widget(globalKey: _globalKey),
                  SizedBox(height: 30),
                  body_widget(),
                  SizedBox(height: 30),
                  CountryWidget(),
                ],
              )),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(
          bNavBarHeight: bNavBarHeight, selectedNavbar: _selectedNavbar),
    );
  }
}

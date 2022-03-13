import 'package:flutter/material.dart';
import 'data_json.dart';
import 'screen/drawer/drawer.dart';
import 'screen/home/widgets/body_widget.dart';
import 'screen/home/widgets/bottom-navbar.dart';
import 'screen/home/widgets/country_widget.dart';
import 'screen/home/widgets/title_widget.dart';
import 'package:http/http.dart' as http;

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
  Data? dataApi;
  int _selectedNavbar = 0;
  double bNavBarHeight = 70;

  String activeCases = 'null';
  String deathCases = 'null';
  String tanggal = '';

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: AppDrawer(),
      body: ListView(children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
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
              // BottomNavBar(
              //     bNavBarHeight: bNavBarHeight,
              //     selectedNavbar: _selectedNavbar),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(bNavBarHeight: bNavBarHeight, selectedNavbar: _selectedNavbar),
    );
  }

  Future<dynamic> _fetchData() async {
    var result = await http.get(Uri.parse('https://data.covid19.go.id/public/api/update.json'));

    final data = dataFromJson(result.body);

    dataApi = data;
    activeCases = dataApi!.update.penambahan.jumlahPositif.toString();
    deathCases = dataApi!.update.penambahan.jumlahMeninggal.toString();
    tanggal = dataApi!.update.penambahan.tanggal;
    return dataApi;
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryWidget extends StatefulWidget {
  @override
  _CountryWidgetState createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  String daerah = 'null';
  String infectedCase = 'null';
  String deathCases = 'null';
  var _get;

  Future _getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://data.covid19.go.id/public/api/prov.json"));

      // untuk cek data
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _get = data['list_data'];
        });
        print(data);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 185, 221, 250),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/jawa_timur.png",
            height: 80,
            width: 80,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _get[3]['key'].toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    '${_get[3]['jumlah_kasus'].toString()}' +
                        " infected cases reported",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '${_get[3]['jumlah_meninggal'].toString()}' +
                        " death cases reported",
                    style: TextStyle(color: Colors.black87),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

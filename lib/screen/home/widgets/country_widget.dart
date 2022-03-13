import 'package:flutter/material.dart';

class CountryWidget extends StatelessWidget {
  const CountryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 185, 221, 250),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/italy.png")),
            SizedBox(width: 25),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Italy",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Image.asset("assets/images/countries.png")
                      ],
                    ),
                    Text(
                      '- 74.386 infected cases reported',
                      style: TextStyle(color: Colors.black87),
                    ),
                    Text(
                      '- 7.503 death cases reported',
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

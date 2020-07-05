import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IndiaPanel extends StatefulWidget {
  @override
  _IndiaPanelState createState() => _IndiaPanelState();
}

class _IndiaPanelState extends State<IndiaPanel> {
  Map indiaData;

  fetchIndiaData() async {
    http.Response response =
        await http.get('http://covid19-india-adhikansh.herokuapp.com/summary');
    setState(() {
      indiaData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchIndiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),
        backgroundColor: Colors.amber[500],
        title: Text(
          'India Overall',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: indiaData == null
          ? SpinKitFoldingCube(
              color: Colors.amber,
            )
          : Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 3),
                  Image(
                    image: AssetImage('assets/ball.png'),
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: 4),
                  Container(
                    child: GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 2),
                      children: <Widget>[
                        StatusPanel(
                          title: 'CONFIRMED',
                          panelColor: Colors.redAccent,
                          textColor: Colors.red[100],
                          count: indiaData['Total Cases'].toString(),
                        ),
                        StatusPanel(
                          title: 'ACTIVE',
                          panelColor: Colors.blue,
                          textColor: Colors.blue[100],
                          count: indiaData['Active cases'].toString(),
                        ),
                        StatusPanel(
                          title: 'RECOVERED',
                          panelColor: Colors.green,
                          textColor: Colors.green[100],
                          count:
                              indiaData['Cured/Discharged/Migrated'].toString(),
                        ),
                        StatusPanel(
                          title: 'DEATHS',
                          panelColor: Colors.grey,
                          textColor: Colors.black,
                          count: indiaData['Death'].toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(15),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      ),
    );
  }
}

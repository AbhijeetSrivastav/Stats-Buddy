import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  ScrollController _scrollController;
  bool _isOnTop = true;
  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
    _scrollController = ScrollController();
  }

  _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
    setState(() => _isOnTop = true);
  }

  _scrollToBottom() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    setState(() => _isOnTop = false);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),
        backgroundColor: Colors.amber[500],
        title: Text(
          'Country Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: countryData == null
          ? SpinKitFoldingCube(
              color: Colors.amber,
            )
          : Container(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: countryData == null ? 0 : countryData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 130,
                      decoration:
                          BoxDecoration(color: Colors.grey[400], boxShadow: [
                        BoxShadow(
                          color: Colors.pink[400],
                          blurRadius: 20,
                          offset: Offset(1, 9),
                        )
                      ]),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 60,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.blueGrey[400],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Confirmed ${countryData[index]['cases'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red[500]),
                                  ),
                                  Text(
                                    'Recovered ${countryData[index]['recovered'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[900]),
                                  ),
                                  Text(
                                    'Active ${countryData[index]['active'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[800]),
                                  ),
                                  Text(
                                    'Deaths ${countryData[index]['deaths'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[900]),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber[500],
        splashColor: Colors.blue,
        elevation: 20,
        onPressed: _isOnTop ? _scrollToBottom : _scrollToTop,
        child: Icon(_isOnTop ? Icons.arrow_downward : Icons.arrow_upward),
      ),
    );
  }
}

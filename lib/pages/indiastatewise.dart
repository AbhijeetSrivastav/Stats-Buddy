import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class IndiaStateWise extends StatefulWidget {
  @override
  _IndiaStateWiseState createState() => _IndiaStateWiseState();
}

class _IndiaStateWiseState extends State<IndiaStateWise> {
  ScrollController _scrollController;
  bool _isOnTop = true;

  Map indiaStatesData;

  fetchIndiaData() async {
    http.Response response =
        await http.get('http://covid19-india-adhikansh.herokuapp.com/states');
    setState(() {
      indiaStatesData = json.decode(response.body);
      //print(indiaData['state'][1]['name']);
    });
  }

  @override
  void initState() {
    fetchIndiaData();
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
          'India Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: indiaStatesData == null
          ? SpinKitFoldingCube(
              color: Colors.amber,
            )
          : Container(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: indiaStatesData == null
                      ? 0
                      : indiaStatesData['state'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      height: 130,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.pink[400],
                          blurRadius: 20,
                          offset: Offset(1, 9),
                        )
                      ]),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 5),
                                  child: Text(
                                    indiaStatesData['state'][index]['name'] ==
                                            'Dadra and Nagar Haveli and Daman and Diu'
                                        ? indiaStatesData['state'][index]
                                                ['name']
                                            .substring(0, 5)
                                        : indiaStatesData['state'][index]
                                            ['name'],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 97, vertical: 0),
                                  child: Text(
                                    'Confirmed ${indiaStatesData['state'][index]['total'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red[500]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 97, vertical: 0),
                                  child: Text(
                                    'Recovered ${indiaStatesData['state'][index]['cured'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[500]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 97, vertical: 0),
                                  child: Text(
                                    'Active ${indiaStatesData['state'][index]['active'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[500]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 97, vertical: 0),
                                  child: Text(
                                    'Deaths ${indiaStatesData['state'][index]['death'].toString()}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800]),
                                  ),
                                ),
                              ],
                            ),
                          ),
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

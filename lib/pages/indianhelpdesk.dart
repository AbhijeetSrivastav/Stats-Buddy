import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class IndiaHelpDesk extends StatelessWidget {
  final String indiaUrl = 'https://www.mohfw.gov.in/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),
        backgroundColor: Colors.amber[500],
        title: Text(
          'India Help Desk',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: indiaUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

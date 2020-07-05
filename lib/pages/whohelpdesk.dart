import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class WHOHelpDesk extends StatelessWidget {
  final String whoUrl =
      'https://www.who.int/emergencies/diseases/novel-coronavirus-2019';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(60))),
        backgroundColor: Colors.amber[500],
        title: Text(
          'WHO Help Desk',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: whoUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

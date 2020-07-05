import 'package:radar/pages/generalinfo.dart';
import 'package:radar/pages/indianhelpdesk.dart';
import 'package:radar/pages/whohelpdesk.dart';
import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpDesk()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'General Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.pink),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => IndiaHelpDesk()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'India Help Desk',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.pink),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WHOHelpDesk()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'WHO Help Desk',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.pink),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

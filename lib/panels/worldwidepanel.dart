import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        //constrain the grid view height and width
        shrinkWrap: true,
        //Makes the Grid Un scrollable
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(
            title: 'Confirmed',
            panelColor: Colors.redAccent,
            textColor: Colors.red[100],
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'Active',
            panelColor: Colors.blue,
            textColor: Colors.blue[100],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'Recoverd',
            panelColor: Colors.green,
            textColor: Colors.green[100],
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'Deaths',
            panelColor: Colors.grey,
            textColor: Colors.black,
            count: worldData['deaths'].toString(),
          ),
        ],
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
    //This will get the width of the device
    double width = MediaQuery.of(context).size.width;
    return Container(
      //adds margin in all the status panels
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          ),
        ],
      ),
    );
  }
}

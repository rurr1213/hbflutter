import 'main.dart';
import 'package:flutter/material.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({ Key key }) : super(key: key);
  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  String _garageState = "Garage C losed";
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text('Garage'),
    ),
    body: new Container(
      margin: new EdgeInsets.only(
          top: 50.0
      ),
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Text(_garageState),
          new RaisedButton(
              child: new Text(
                  'OpenGarage'
              ),
              onPressed: () { setState( () { _garageState = "Garage Open"; }); },
          ),
          new RaisedButton(
              child: new Text(
                   'CloseGarage'
              ),
              onPressed: () { setState( () { _garageState = "Garage Closed"; }); },
          )
        ],
      ),
    ),
    bottomNavigationBar: BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () {Navigator.of(context).pushReplacementNamed('/home');},),
          IconButton(icon: Icon(Icons.local_car_wash), onPressed: () { Navigator.of(context).pushReplacementNamed('/garage');},),
        ],
      ),
    ),
  );
}
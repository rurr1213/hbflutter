import 'main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text('Home'),
    ),
    body: new Container(
      margin: new EdgeInsets.only(
          top: 50.0
      ),
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Text('Welcome to App!'),
          new RaisedButton(
              child: new Text(
                  'Logout'
              ),
              onPressed: () {
                appAuth.logout().then(
                        (_) => Navigator.of(context).pushReplacementNamed('/login')
                );
              }
          ),
          new RaisedButton(
              child: new Text(
              'OpenGarage'
              ),
                onPressed: () {
                  appAuth.logout().then(
                          (_) => Navigator.of(context).pushReplacementNamed('/garage')
                  );
                }
            ),

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
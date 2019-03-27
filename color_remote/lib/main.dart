import 'package:color_remote/bloc/ipAddressProvider.dart';
import 'package:color_remote/gui/remote.dart';
import 'package:color_remote/gui/settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
        accentColor: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 4,
          title: Text('Wlads IoT Lampe'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.lightbulb_outline)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: IpAddressProvider(
          child: TabBarView(
            children: <Widget>[
              LightPage(scaffoldKey: _scaffoldKey),
              Settings(),
            ],
          ),
        ),
      ),
    );
  }
}

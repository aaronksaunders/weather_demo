import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_demo/my_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() { });
  }

  Future getMyLocation() async {
    var _locationService = new Location();
    bool serviceStatus = await _locationService.serviceEnabled();
    print("Service status: $serviceStatus");

    var d = await _locationService.getLocation();

    return "location ${d.latitude} , ${d.longitude}, ${d.time} ";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Object>(
          future: getMyLocation(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                //return Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        snapshot.data,
                      ),
                      WeatherSlider(),
                    ],
                  ),
                );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

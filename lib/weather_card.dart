import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final List<String> _list =
      List<String>.generate(12, (int i) => 'Heading (${i + 1})');
  final String title;
  final int temp;

  WeatherCard({this.title, this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(38),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.indigo[200],
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Colors.black87, blurRadius: 30, offset: Offset(10, 10))
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
              child: Text(
                this.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Text(
                'Sunny',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 1, 10, 20),
              child: Text(
                this.temp.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 48),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "This is the weather card description for the current weather in plain text for the reader",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            WeatherByHour(_list)
          ],
        ),
      ),
    );
  }
}

@immutable
class WeatherByHour extends StatelessWidget {
  const WeatherByHour(this.hourlyWeather);

  static const EdgeInsets rowEdgeInsets =
      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5);

  // Builder methods rely on a set of data, such as a list.
  final List<String> hourlyWeather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: _buildList(context),
    ));
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: hourlyWeather.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(children: <Widget>[
          Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Text(hourlyWeather[index]))
        ]);
      },
    );
  }
}

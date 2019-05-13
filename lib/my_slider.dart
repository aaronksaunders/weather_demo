import 'package:flutter/material.dart';
import 'package:weather_demo/weather_card.dart';

class WeatherSlider extends StatelessWidget {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: mediaQueryData.size.height - 200.0,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(40),
            child: Container(
              // color: Colors.red,
              child: WeatherCard(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              color: Colors.blue,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              color: Colors.green,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

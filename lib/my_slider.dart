import 'package:flutter/material.dart';
import 'package:weather_demo/weather_card.dart';

class WeatherSlider extends StatelessWidget {
  final PageController controller = PageController();

  List<Widget> _generateSlides() {
    return [
      WeatherCard(title: "Washington DC", temp: 89),
      WeatherCard(title: "Ocean City, MD", temp: 81),
      WeatherCard(title: "Silver Spring, MD", temp: 84)
    ];
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: mediaQueryData.size.height - 200.0,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: _generateSlides(),
      ),
    );
  }
}

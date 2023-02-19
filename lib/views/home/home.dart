import 'package:flutter/material.dart';
import 'package:food_court_weather_app/utils/colors.dart';
import 'package:food_court_weather_app/utils/text_style.dart';
import 'package:food_court_weather_app/views/home/home_view_model.dart';
import 'package:food_court_weather_app/views/home/widget/weather_widget.dart';
import 'package:food_court_weather_app/widgets/custom_multi_select.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (model) =>
          model.getWeather(lat: "6.4500", lon: "3.4000"),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: model.selectedCities.length,
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  "Cities(up to 3)",
                  style: kBodyTextStyle,
                ),
                IconButton(
                  onPressed: () async {
                    final List<String>? results = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MultiSelect(items: model.cityResponse);
                      },
                    );
                    model.changeCity(results);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            bottom: TabBar(
                labelStyle: kBodyTextStyle,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: model.selectedCities.map((e) {
                  return Tab(text: e);
                }).toList()),
          ),
          body: TabBarView(
              children: model.selectedCities.map((e) {
            return WeatherWidget(city: e);
          }).toList()),
        ),
      ),
    );
  }
}

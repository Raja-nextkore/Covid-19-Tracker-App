import 'package:flutter/material.dart';

import '/view/countries_list_view.dart';
import '/view/country_details_view.dart';
import '/view/splash_view.dart';
import '/view/worldStates_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        SplashView.id: (context) => const SplashView(),
        WorldStatesView.id: (context) => const WorldStatesView(),
        CountriesListView.id: (context) => const CountriesListView(),
        CountryDetailsView.id: (context) => const CountryDetailsView(),
      },
    );
  }
}

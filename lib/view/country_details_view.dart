import 'package:flutter/material.dart';

import '../helper/reusableCard.dart';

class CountryDetailsView extends StatefulWidget {
  static const id = '/CountryDetailsView';
  final String? countryName;
  final String? countryFlag;
  final int? countryTotalCases;
  final int? countryTotalDeaths;
  final int? countryTotalRecovered;
  final int? countryActiveCases;
  final int? countryCriticalCases;
  final int? countryTodayRecovered;
  final int? countryTest;

  const CountryDetailsView({
    Key? key,
    this.countryName,
    this.countryFlag,
    this.countryTotalCases,
    this.countryTotalDeaths,
    this.countryTotalRecovered,
    this.countryActiveCases,
    this.countryCriticalCases,
    this.countryTodayRecovered,
    this.countryTest,
  }) : super(key: key);

  @override
  State<CountryDetailsView> createState() => _CountryDetailsViewState();
}

class _CountryDetailsViewState extends State<CountryDetailsView> {
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as CountryDetailsView;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text(data.countryName!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        ReusableCard(
                          title: 'Cases',
                          value: data.countryTotalCases.toString(),
                        ),
                        ReusableCard(
                          title: 'Deaths',
                          value: data.countryTotalDeaths.toString(),
                        ),
                        ReusableCard(
                          title: 'Total Recovered',
                          value: data.countryTotalRecovered.toString(),
                        ),
                        ReusableCard(
                          title: 'Active',
                          value: data.countryActiveCases.toString(),
                        ),
                        ReusableCard(
                          title: 'Critical Cases',
                          value: data.countryCriticalCases.toString(),
                        ),
                        ReusableCard(
                          title: 'Today Recovered',
                          value: data.countryTodayRecovered.toString(),
                        ),
                        ReusableCard(
                          title: 'Test',
                          value: data.countryTest.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(data.countryFlag.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

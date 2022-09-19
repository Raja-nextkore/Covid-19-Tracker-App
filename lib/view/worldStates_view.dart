import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '/model/world_states_model.dart';
import '/services/networking.dart';
import '/view/countries_list_view.dart';
import '../helper/build_pie_chart.dart';
import '../helper/reusableCard.dart';
import '../helper/track_countries.dart';

class WorldStatesView extends StatefulWidget {
  static const id = '/WorldStatesView';

  const WorldStatesView({Key? key}) : super(key: key);

  @override
  State<WorldStatesView> createState() => _WorldStatesViewState();
}

class _WorldStatesViewState extends State<WorldStatesView>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FutureBuilder(
                future: Networking.fetchWorldStatesData(),
                builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        controller: _animationController,
                      ),
                    );
                  } else {
                    var data = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildPieChart(
                          total: data.cases!.toString(),
                          recovered: data.recovered!.toString(),
                          deaths: data.deaths!.toString(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableCard(
                                    title: 'Total',
                                    value: data.cases!.toString(),
                                  ),
                                  ReusableCard(
                                    title: 'Deaths',
                                    value: data.deaths!.toString(),
                                  ),
                                  ReusableCard(
                                    title: 'Recovered',
                                    value: data.recovered!.toString(),
                                  ),
                                  ReusableCard(
                                    title: 'Active',
                                    value: data.active!.toString(),
                                  ),
                                  ReusableCard(
                                    title: 'Critical',
                                    value: data.critical!.toString(),
                                  ),
                                  ReusableCard(
                                    title: 'Today Deaths',
                                    value: data.todayDeaths!.toString(),
                                  ),
                                  ReusableCard(
                                    title: 'Today Recovered',
                                    value: data.todayRecovered!.toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TrackCountries(
                          onTap: () {
                            Navigator.pushNamed(context, CountriesListView.id);
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

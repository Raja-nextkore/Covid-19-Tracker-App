import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '/view/country_details_view.dart';
import '../services//networking.dart';

class CountriesListView extends StatefulWidget {
  static const id = '/CountriesListView';

  const CountriesListView({Key? key}) : super(key: key);

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  //  _controller.text = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Country by name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: FutureBuilder(
                future: Networking.fetchCountriesListData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700,
                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(),
                          ),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 50.0,
                                width: 50.0,
                                color: Colors.white,
                              ),
                              title: Container(
                                height: 10.0,
                                width: 89.0,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10.0,
                                width: 89.0,
                                color: Colors.white,
                              ),
                            );
                          }),
                    );
                  } else {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data![index];
                          String name = data['country'];
                          if (_controller.text.isEmpty) {
                            return buildListTile(data);
                          } else if (name
                              .toLowerCase()
                              .contains(_controller.text.toLowerCase())) {
                            return buildListTile(data);
                          } else {
                            return Container();
                          }
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(data) {
    return ListTile(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pushNamed(
          context,
          CountryDetailsView.id,
          arguments: CountryDetailsView(
            countryName: data['country'],
            countryFlag: data['countryInfo']['flag'],
            countryTotalCases: data['cases'],
            countryTotalDeaths: data['deaths'],
            countryActiveCases: data['active'],
            countryTotalRecovered: data['recovered'],
            countryCriticalCases: data['critical'],
            countryTodayRecovered: data['todayRecovered'],
            countryTest: data['tests'],
          ),
        );
      },
      leading: Image(
        image: NetworkImage(
          data['countryInfo']['flag'],
        ),
        height: 50.0,
        width: 50.0,
      ),
      title: Text(
        data['country'],
      ),
      subtitle: Text(data['cases'].toString()),
    );
  }
}

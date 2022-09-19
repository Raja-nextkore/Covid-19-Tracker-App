import 'dart:convert';

import 'package:http/http.dart' as http;

import '/model/world_states_model.dart';
import '/services/api.dart';

class Networking {
  static Future<WorldStatesModel> fetchWorldStatesData() async {
    http.Response response = await http.get(Uri.parse(Api.worldStatesApi));
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      return WorldStatesModel.fromJson(decodedJson);
    } else {
      throw ('Unable to fetch Data');
    }
  }

  static Future<List<dynamic>> fetchCountriesListData() async {
    dynamic data;
    http.Response response = await http.get(Uri.parse(Api.countriesListApi));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      return data;
    } else {
      throw ('Unable to fetch Data');
    }
  }
}

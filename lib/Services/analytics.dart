import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vvt_demo/Model/population.dart';

class AnalyticsService {
  Future<List<Population>> getAnalyticsData() async {
    try {
      final response = await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
      final data = json.decode(response.body);
      print(data['data']);
      List<Population> populationList = [];
      populationList = data['data']
          .map((tagJson) => Population.fromJson(tagJson))
          .cast<Population>()
          .toList();
      return populationList;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

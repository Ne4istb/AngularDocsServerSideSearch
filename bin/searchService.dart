import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class SearchService {

//  final String URL = 'https://docs.angularjs.org/js/search-data.json';
  final String URL = 'http://localhost:8080/data.json';

  Future<String> search(query) {
    return http
    .get(URL)
    .then((response) => group(JSON.decode(response.body)))
    .then((groupedItems) => filter(groupedItems, query.toLowerCase()));
  }

  Map<String, List<Map>> group(Iterable<Map> items) {

    Map groupedItems = new Map<String, List<Map>>();

    items.forEach((item) {

      var groups = item['path'].split('/');
      var group = groups.length > 0 ? groups[0] : item['path'];

      if (groupedItems[group] == null) {
        groupedItems[group] = new List<Map>();
      }

      groupedItems[group].add(item);
    });

    return groupedItems;
  }

  String filter(Map<String, List<Map>> groupedItems, String query) {

    List result = [];
    groupedItems.forEach((key, List<Map> value) {
      Map group = new Map();
      print(value);
      group['name'] = key;
      group['group'] = filterGroup(value, query);
      result.add(group);
    });

    return JSON.encode(result);
  }

  List<Map> filterGroup(List<Map> group, String query) {

    List<Map> result = [];

    var filteredByTitle = group.where((item) => item['titleWords'].contains(query));
    result.addAll(filteredByTitle);

    var filteredByMembers = group.where((item) => !item['titleWords'].contains(query) && item['members'].contains(query));
    result.addAll(filteredByMembers);

    var filteredByKeywords = group.where((item) => !item['titleWords'].contains(query) && !item['members'].contains(query) && item['keywords'].contains(query));
    result.addAll(filteredByKeywords);

    return result.toList();
  }
}
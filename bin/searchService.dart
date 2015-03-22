import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class SearchService {

  final String URL = 'https://docs.angularjs.org/js/search-data.json';

  Future<String> search(query) {
    return http
      .get(URL)
      .then((response) => filter(response, query.toLowerCase()));
  }

  String filter(response, query) {

    Iterable<Map> items =  JSON.decode(response.body)
      .where((item) => item['keywords'].contains(query));

    Map groupedItems = new Map();

    items.forEach((item){

      var groups = item['path'].split('/');
      var group = groups.length > 0 ? groups[0] : item['path'];

      if (groupedItems[group] == null){
        groupedItems[group] = new List<Map>();
      }

      groupedItems[group].add(item);
    });

    List result = [];
    groupedItems.forEach((key, value){
      Map group = new Map();
      group['name'] = key;
      group['group'] = value;
      result.add(group);
    });

    return JSON.encode(result);
  }
}
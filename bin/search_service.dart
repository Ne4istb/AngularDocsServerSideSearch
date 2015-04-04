import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import '../lib/shared/constants.dart' as shared;

class SearchService {

  final String URL = urlDocs + "js/search-data.json";

  static get urlDocs => shared.Constants.angularSiteUrl;

  Future<String> search(query) {
    return http
    .get(URL)
    .then((response) => _group(JSON.decode(response.body)))
    .then((groupedItems) => _filter(groupedItems, query.toLowerCase()));
  }

  Map<String, List<Map>> _group(Iterable<Map> items) {

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

  String _filter(Map<String, List<Map>> groupedItems, String query) {

    List result = [];
    groupedItems.forEach((key, List<Map> value) {
      Map group = new Map();
      group['name'] = key;
      group['group'] = _filterGroup(value, query);
      result.add(group);
    });

    return JSON.encode(result);
  }

  List<Map> _filterGroup(List<Map> group, String query) {

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
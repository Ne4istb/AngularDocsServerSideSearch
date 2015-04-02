library search_result;

import 'package:angular/angular.dart';
import 'package:angularDartRemote/search_service.dart';

@Component(
    selector: 'search_result',
    templateUrl: 'search_result.html',
    cssUrl: 'search_result.css',
    useShadowDom: false)
class SearchComponent {

  get angularSiteUrl => "https://docs.angularjs.org/";

  SearchService _searchService;
  var _result;
  String query;

  SearchComponent(this._searchService, RouteProvider routeProvider) {

    query = routeProvider.parameters["query"];

    if (query == null)
      query = '';

    search();
  }

  void search() {
    _searchService.find(query).then((result) => _result = result);
  }

  get result => _result;
}
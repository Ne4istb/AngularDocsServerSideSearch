library search_result;

import 'package:angular/angular.dart';
import 'package:angularDartRemote/searchService.dart';

@Component(
    selector: 'search-result',
    templateUrl: 'search-result.html',
    cssUrl: 'search-result.css',
    useShadowDom: false)
class SearchComponent {

  SearchService _searchService;
  RouteProvider _routeProvider;
  var _result;

  SearchComponent(this._searchService, this._routeProvider) {
    print(_routeProvider.parameters);
    var query = _routeProvider.parameters["query"];
    print("test $query");
    _searchService.find('di').then((result) => _result = result);
  }

  get result => _result;
}
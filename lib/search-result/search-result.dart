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
  var _result;

  SearchComponent(this._searchService) {
    _searchService.find('di').then((result) => _result = result);
  }

  get result => _result;
}
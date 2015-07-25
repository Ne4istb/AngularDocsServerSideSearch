library search_service;

import 'package:angular/angular.dart';
import 'dart:async';
import 'dart:html';
@Injectable()
class SearchService {

  final String URL = '${window.location.origin}/api/find';

	Http _http;

  SearchService(this._http);

	Future<Map> find(String query) {
		var url = '$URL?query=$query';
		return _http.get(url)
      .then((response) => response.data)
      .catchError((response) => print(response));
	}
}
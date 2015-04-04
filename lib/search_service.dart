library search_service;

import 'package:angular/angular.dart';
import 'dart:async';

@Injectable()
class SearchService {

	final String URL = 'http://docs-angular.herokuapp.com/api/find';
//	final String URL = 'http://localhost:8080/api/find';

	Http _http;

  SearchService(this._http);

	Future<Map> find(String query) {
		var url = '$URL?query=$query';
		return _http.get(url)
      .then((response) => response.data)
      .catchError((response) => print(response));
	}
}
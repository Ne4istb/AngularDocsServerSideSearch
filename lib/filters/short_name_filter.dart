library short_name_filter;

import 'package:angular/angular.dart';

@Formatter(name: 'shortNameFilter')
class ShortNameFilter {
  String call(String value) {
    const maxLength = 20;
    if (value.length > maxLength){
      value = value.substring(0, maxLength - 2) + "..";
    }
    return value;
  }
}

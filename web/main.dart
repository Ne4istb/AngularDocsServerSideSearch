library angularDartRemote;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:angularDartRemote/search-result/search-result.dart';
import 'package:angularDartRemote/searchService.dart';

class AngularDartRemoteModule extends Module {
  AngularDartRemoteModule() {
    bind(SearchComponent);
    bind(SearchService);
  }
}

main() {
  applicationFactory()
  .addModule(new AngularDartRemoteModule())
  .run();
}
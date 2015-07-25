library angularDartRemote;

import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';

import 'package:angularDartRemote/search_result/search_result.dart';
import 'package:angularDartRemote/spinner/spinner.dart';
import 'package:angularDartRemote/filters/short_name_filter.dart';
import 'package:angularDartRemote/routing/search_router.dart';
import 'package:angularDartRemote/search_service.dart';

class AngularDartRemoteModule extends Module {
  AngularDartRemoteModule() {
    bind(SearchComponent);
    bind(SpinnerComponent);
    bind(SearchService);
    bind(ShortNameFilter);
    bind(RouteInitializerFn, toValue: searchRouteInitializer);
    bind(NgRoutingUsePushState, toValue: new NgRoutingUsePushState.value(false));
  }
}

main() {
  applicationFactory()
  .addModule(new AngularDartRemoteModule())
  .run();
}
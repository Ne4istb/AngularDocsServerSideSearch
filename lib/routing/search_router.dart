library search_routing;

import 'package:angular/angular.dart';

void searchRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    '/': ngRoute(
        path: '/',
        viewHtml: '<search-result></search-result>',
        defaultRoute: true)
  });
}
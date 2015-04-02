library search_routing;

import 'package:angular/angular.dart';

void searchRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    '/': ngRoute(
        path: '/:query',
        viewHtml: '<search_result></search_result>',
        defaultRoute: true)
  });
}
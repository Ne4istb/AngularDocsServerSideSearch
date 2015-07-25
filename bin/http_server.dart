import "dart:io";

import 'package:redstone/server.dart' as app;
import 'package:shelf_static/shelf_static.dart';

import 'search_service.dart';

var _searchService = new SearchService();

@app.Route("/api/find")
find(@app.QueryParam("query") String query) {
  return _searchService.search(query);
}

main() {
  var port = _getConfig("PORT", "8080");
  var web = _getConfig("WEB_FOLDER", "web");

  app.setShelfHandler(
      createStaticHandler(web, defaultDocument: "index.html", serveFilesOutsidePath: true));

  app.setupConsoleLog();

  app.start(port: int.parse(port));
}

_getConfig(String name, [defaultValue]) {
  var value = Platform.environment[name];

  if (value == null) {
    return defaultValue;
  }

  return value;
}

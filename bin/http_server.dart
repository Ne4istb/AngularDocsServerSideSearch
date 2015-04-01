import 'package:redstone/server.dart' as app;
import 'package:shelf_static/shelf_static.dart';

import 'searchService.dart';

main() {

  app.setShelfHandler(
      createStaticHandler("../web",  defaultDocument: "index.html", serveFilesOutsidePath: true));



  app.start();
}

@app.Route("/api/find")
find(@app.QueryParam("query") String query) {
  return new SearchService().search(query);
}
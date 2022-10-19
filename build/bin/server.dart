// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../main.dart' as entrypoint;
import '../routes/catagories/index.dart' as catagories_index;

import '../routes/catagories/_middleware.dart' as catagories_middleware;

void main() => createServer();

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final handler = Cascade().add(buildRootHandler()).handler;
  final server = await entrypoint.run(handler, ip, port);
  print('\x1B[92m✓\x1B[0m Running on http://${server.address.host}:${server.port}');
  return server;
}

Handler buildRootHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..mount('/catagories', (context) => buildCatagoriesHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildCatagoriesHandler() {
  final pipeline = const Pipeline().addMiddleware(catagories_middleware.middleware);
  final router = Router()
    ..all('/', (context) => catagories_index.onRequest(context,));
  return pipeline.addHandler(router);
}

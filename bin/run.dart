import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:args/args.dart';

class TestRunner {
  bool in_group = false;

  void readJson(String path) {
    File(path).readAsString().then((String contents) {
      contents.split('\n').forEach((String line) {
        if (line.startsWith('{')) {
          var decoded = json.decode(line);
          print(decoded);
        }
      });
    });
  }
}

void main(List<String> arguments) {
  final parser = ArgParser();
  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  var runner = new TestRunner();
  runner.readJson(paths[0]);
}

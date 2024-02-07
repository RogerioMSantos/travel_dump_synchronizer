import 'package:args/args.dart';
import 'package:travel_dump_synchronizer/travel_dump_synchronizer.dart'
    as travel_dump_synchronizer;

void main(List<String> arguments) {
  final argParser = ArgParser()
    ..addOption('travelsFile',
        abbr: 't', help: 'Travels JSON file path', mandatory: true)
    ..addOption('coordinatesFile',
        abbr: 'c', help: 'Coordinates JSON file path', mandatory: true)
    ..addOption('username', abbr: 'u', help: 'API Username', mandatory: true)
    ..addOption('password', abbr: 'p', help: 'API Password', mandatory: true);

  ArgResults argResults;

  try {
    argResults = argParser.parse(arguments);
  } catch (e) {
    print(e);
    print(argParser.usage);
    return;
  }

  final travelsFile = argResults['travelsFile'];
  final coordinatesFile = argResults['coordinatesFile'];
  final username = argResults['username'];
  final password = argResults['password'];

  travel_dump_synchronizer.synchronize(
    travelJsonPath: travelsFile,
    coordinatesJsonPath: coordinatesFile,
    username: username,
    password: password,
  );
}

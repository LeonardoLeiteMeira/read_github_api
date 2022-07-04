import 'dart:io';
import 'package:csv/csv.dart';
import 'package:read_github_api/entity/software_entity.dart';
// import 'package:path/path.dart' as p;

class FileService {
  Future<List<SoftwareEntity>> getSoftwareList() async {
    List<SoftwareEntity> softwareList = [];

    var csvString = await File("lib/csv/softwares.csv").readAsString();
    List<List<dynamic>> csv = const CsvToListConverter().convert(csvString);

    csv.removeAt(0); //remove csv header

    for (var data in csv) {
      softwareList.add(SoftwareEntity(data[0], data[1], data[2]));
    }
    return softwareList;
  }

  //TEST
  // void writeSoftwareList(List<SoftwareEntity> list) {
  //   var csvString = CsvToListConverter().convert(list.toString());
  //   var dir = p.join('lib', "csv", 'test.csv');
  //   var file = File(dir);
  //   print(csvString);
  //   file.writeAsString(csvString.toString());
  // }
}

import 'dart:io';
import 'package:csv/csv.dart';
import 'package:read_github_api/entity/github_success_entity.dart';
import 'package:read_github_api/entity/software_entity.dart';
import 'package:path/path.dart' as p;

class FileService {
  Future<List<SoftwareEntity>> getSoftwareListFromCSV() async {
    List<SoftwareEntity> softwareList = [];

    var csvString = await File("lib/csv/softwares.csv").readAsString();
    List<List<dynamic>> csv = const CsvToListConverter().convert(csvString);

    csv = _removeHeader(csv);

    for (var data in csv) {
      softwareList.add(SoftwareEntity(data[0], data[1], data[2]));
    }
    return softwareList;
  }

  List<List> _removeHeader(List<List> list) {
    list.removeAt(0);
    return list;
  }

  void writeListAsCSV(String fileName, List<GitHubSucessEntity> list) {
    var listAsString = _writeListAsStringCSV(list);

    var csvString = CsvToListConverter().convert(listAsString);
    var dir = p.join('lib', "csv", '$fileName.csv');
    var file = File(dir);
    file.writeAsString(_writeListAsStringCSV(csvString));
  }

  String _writeListAsStringCSV(List list) {
    var finalString = "";
    for (var item in list) {
      finalString += item.toString();
    }
    finalString = finalString.replaceAll("[", "");
    finalString = finalString.replaceAll("]", "");
    return finalString;
  }
}

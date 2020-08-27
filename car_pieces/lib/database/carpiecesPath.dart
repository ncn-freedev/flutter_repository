/*
 * Classe utilizando path_provider para garantir a persistência dos dados digitados 
 * no app, neste caso serão os dados do carro
 *  
 */
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CarPiecesPath {
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/car_information.json");
  }

  Future<File> saveData(List informations) async {
    String data = json.encode(informations);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await getFile();
      return file.readAsString();
    } catch (e) {
      return "Houve um erro ao retornar os dados!";
    }
  }
}

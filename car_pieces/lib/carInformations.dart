import 'dart:convert';

import 'package:car_pieces/database/carpiecesPath.dart';
import 'package:flutter/material.dart';

class CarInformations extends StatefulWidget {
  @override
  _CarInformationsState createState() => _CarInformationsState();
}

class _CarInformationsState extends State<CarInformations> {
  CarPiecesPath informationspath = CarPiecesPath();

  final apelido = TextEditingController();
  final modelo = TextEditingController();
  final marca = TextEditingController();
  final ano = TextEditingController();
  final km = TextEditingController();

  List saveList = [];

  @override
  void initState() {
    super.initState();
    informationspath.readData().then((value) {
      saveList = json.decode(value);
      if (saveList != []) {
        apelido.text = saveList[0]["apelido"];
        modelo.text = saveList[0]["modelo"];
        marca.text = saveList[0]["marca"];
        ano.text = saveList[0]["ano"];
        km.text = saveList[0]["quilometragem"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text("Informações do carro"),
        ),
        backgroundColor: Colors.blueGrey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              informationsFields("Apelido do carro", apelido),
              informationsFields("Modelo", modelo),
              informationsFields("Marca", marca),
              informationsFields("Ano", ano),
              informationsFields("Quilometragem", km),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * .1),
                child: Container(
                  width: 400,
                  height: 100,
                  child: RaisedButton(
                      child: Text("Salvar"),
                      color: Colors.blueGrey,
                      onPressed: () {
                        add();
                      }),
                ),
              )
            ],
          ),
        ));
  }

  Widget informationsFields(
      String fieldName, TextEditingController controllerName) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.width * .1,
          right: MediaQuery.of(context).size.width * .1),
      child: TextField(
        controller: controllerName,
        decoration: InputDecoration(labelText: fieldName),
      ),
    );
  }

  void add() {
    Map<String, dynamic> map = Map();
    saveList.clear();
    map['apelido'] = apelido.text;
    map['modelo'] = modelo.text;
    map['marca'] = marca.text;
    map['ano'] = ano.text;
    map['quilometragem'] = km.text;
    saveList.add(map);
    apelido.text = "";
    modelo.text = "";
    marca.text = "";
    ano.text = "";
    km.text = "";
    print(saveList);
    informationspath.saveData(saveList);
  }
}

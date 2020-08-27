import 'package:car_pieces/carInformations.dart';
import 'package:car_pieces/classPiece.dart';
import 'package:car_pieces/database/carpiecesDB.dart';
import 'package:car_pieces/pieceListScreen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  CarPiecesDB data = CarPiecesDB();

  List<Piece> pieceList;

  @override
  void initState() {
    super.initState();
    setState(() {
      data.getAllPieces().then((list) => pieceList = list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("CAR PIECES"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[200],
      body: LayoutBuilder(
        builder: (context, constraints) {
          double containerWidth = constraints.maxWidth * .6;
          double containerHeight = constraints.maxHeight * .2;
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.05,
                          left: constraints.maxWidth * 0.2),
                      child: Container(
                          color: Colors.blueGrey,
                          width: containerWidth,
                          height: containerHeight,
                          child: Center(
                            child: Text(
                              "Informações do carro",
                              style: TextStyle(fontSize: containerHeight * .17),
                            ),
                          )),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarInformations()),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.05,
                          left: constraints.maxWidth * 0.2),
                      child: Container(
                          color: Colors.blueGrey,
                          width: containerWidth,
                          height: containerHeight,
                          child: Center(
                            child: Text("Adicionar peça ou serviço",
                                style: TextStyle(
                                  fontSize: containerHeight * 0.17,
                                )),
                          )),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PieceListScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

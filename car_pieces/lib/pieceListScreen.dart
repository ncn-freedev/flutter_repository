import 'dart:io';

import 'package:car_pieces/classPiece.dart';
import 'package:car_pieces/database/carpiecesDB.dart';
import 'package:car_pieces/pieceScreen.dart';
import 'package:flutter/material.dart';

class PieceListScreen extends StatefulWidget {
  @override
  _PieceListScreenState createState() => _PieceListScreenState();
}

class _PieceListScreenState extends State<PieceListScreen> {
  CarPiecesDB data = CarPiecesDB();

  List<Piece> pieceList = [];

  int count;

  @override
  void initState() {
    super.initState();
    setState(() {
      data.getAllPieces().then((list) {
        pieceList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pieceList.length == 0) {
      count = 1;
    } else {
      count = pieceList.length;
    }
    print(count);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Lista de peças"),
        ),
        backgroundColor: Colors.blueGrey[200],
        body: LayoutBuilder(builder: (context, constraints) {
          return ListView.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: pieceCard(context, index, constraints.maxWidth,
                    constraints.maxHeight),
              );
            },
          );
        }));
  }

  Widget pieceCard(
      BuildContext context, int index, var sizeWwidth, var sizeHeight) {
    if (pieceList.length == 0) {
      return initPieceCard(sizeWwidth, sizeHeight);
    } else {
      return Container(
          padding: EdgeInsets.only(
              left: sizeWwidth * 0.02,
              right: sizeWwidth * 0.02,
              top: sizeHeight * 0.01,
              bottom: sizeHeight * 0.01),
          height: sizeHeight * .2,
          child: GestureDetector(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: sizeWwidth * 0.1,
                    child: Image.file(File(pieceList[index].img)),
                  ),
                  Text(
                    pieceList[index].nome,
                    style: TextStyle(fontSize: sizeWwidth * 0.05),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PieceScreen()),
              );
            },
          ));
    }
  }

  Widget initPieceCard(var sizeWwidth, var sizeHeight) {
    return Container(
        padding: EdgeInsets.only(
            left: sizeWwidth * 0.02,
            right: sizeWwidth * 0.02,
            top: sizeHeight * 0.01,
            bottom: sizeHeight * 0.01),
        height: sizeHeight * .2,
        child: GestureDetector(
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: sizeWwidth * 0.1,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Adicionar peça ou serviço",
                  style: TextStyle(fontSize: sizeWwidth * 0.05),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PieceScreen()),
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';

class PieceScreen extends StatefulWidget {
  @override
  _PieceScreenState createState() => _PieceScreenState();
}

class _PieceScreenState extends State<PieceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Peça"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

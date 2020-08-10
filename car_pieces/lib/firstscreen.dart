import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
          return Column(
            children: [
              GestureDetector(
                  child: Padding(
                padding: EdgeInsets.only(
                    top: constraints.maxHeight * 0.05,
                    left: constraints.maxWidth * 0.1),
                child: Container(
                  color: Colors.blueGrey,
                  width: constraints.maxWidth * .8,
                  height: constraints.maxHeight * .2,
                  child: Text("Adicionar peça ou serviço"),
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}

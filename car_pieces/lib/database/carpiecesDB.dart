import 'package:car_pieces/classPiece.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class CarPiecesDB {
  ///Padrão Sigleton
  static final CarPiecesDB _instance = CarPiecesDB.internal();

  factory CarPiecesDB() => _instance;

  CarPiecesDB.internal();

  ///Declarando o Bando de dados
  Database _banco;

  ///Inicializando o banco de dados
  get banco async {
    if (_banco != null) {
      return _banco;
    } else {
      _banco = await initBanco();
      return _banco;
    }
  }

  ///Incializando o banco de dados
  ///função chamada no get banco()
  Future<Database> initBanco() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "CarPiecesDB");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerversion) async {
      await db.execute(
          "CREATE TABLE carpieces (id INTEGER PRIMARY KEY, nome TEXT, marca TEXT, data DATE, local TEXT, preco FLOAT, img TEXT)");
    });
  }

  void savePiece(Piece piece) async {
    Database pieceDB = await banco;
    piece.id = await pieceDB.insert("carpieces", piece.toMap());
  }

  Future<Piece> getPiece(int id) async {
    Database pieceDB = await banco;
    List<Map> maps = await pieceDB.query("carpieces",
        columns: ["id", "nome", "marca", "data", "local", "preco", "img"],
        where: "id = $id");
    if (maps.length > 0) {
      return Piece.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deletePiece(int id) async {
    Database pieceDB = await banco;
    return await pieceDB.delete("carpieces", where: "id = $id");
  }

  void updatePiece(Piece piece) async {
    Database pieceDB = await banco;
    pieceDB.update("carpieces", piece.toMap(),
        where: "id = ?", whereArgs: [piece.id]);
  }

  Future<List> getAllPieces() async {
    Database pieceDB = await banco;
    List listmaps = await pieceDB.rawQuery("SELECT * FROM carpieces");
    List<Piece> pieceList = List();
    for (Map map in listmaps) {
      pieceList.add(Piece.fromMap(map));
    }
    return pieceList;
  }
}

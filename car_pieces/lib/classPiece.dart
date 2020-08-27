class Piece {
  int id;
  String nome;
  String marca;
  DateTime data;
  String local;
  double preco;
  String img;

  Piece.fromMap(Map map) {
    id = map["id"];
    nome = map["nome"];
    marca = map["marca"];
    data = map["data"];
    local = map["local"];
    preco = map["preco"];
    img = map["img"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "nome": nome,
      "marca": marca,
      "data": data,
      "local": local,
      "preco": preco,
      "img": img,
    };
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }
}

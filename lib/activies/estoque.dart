void main() {
  final estoque = Estoque();
  final celular = Item.criar(name: "Celular ", quantidade: 15, preco: 2500.0);
  final fone = Item.criar(name: "Fone ", quantidade: 15, preco: 250);
  final calculadora =
      Item.criar(name: "Calculadora ", quantidade: 15, preco: 25);
  final tv = Item.criar(name: "Tv ", quantidade: 15, preco: 25);

  estoque.listar();
  estoque.vender(item: celular, quantidade: 10);
  estoque.newPreco(item: celular, newPreco: 0.0);
  estoque.listar();
}

class Item {
  String? name;
  int? quantidade;
  double? preco;

  Item._([this.name, this.quantidade, this.preco]);

  factory Item.criar(
      {required String name, required int quantidade, required double preco}) {
    if (name.isEmpty) {
      print("Valor não pode ser vazio");
    } else if (quantidade == 0) {
      print(" Você não pode criar um item com estoque zerado");
    } else if (preco == 0) {
      preco = 0.0;
    }
    Item value = Item._(name = name, quantidade = quantidade, preco = preco);
    Estoque.adicionar(value);
    return value;
  }
}

class Estoque {
  static List<Item> _list = <Item>[];

  Estoque();

  static adicionar(Item value) {
    _list.add(value);
  }

  vender({required Item item, required int quantidade}) {
    item.quantidade = item.quantidade! - quantidade;

    return item.quantidade;
  }

  listar() {
    for (Item item in _list) {
      print("Produto: ${item.name}");
      print("Quantidade: ${item.quantidade}");
      print("Preço: ${item.preco}" "\n");
    }
  }

  void newPreco({required Item item, required double newPreco}) {
    item.preco = newPreco;
  }
}

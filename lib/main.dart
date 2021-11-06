import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _textControllerNumConta =
      TextEditingController();
  final TextEditingController _textControllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textControllerNumConta,
              style: TextStyle(fontSize: 24.0),
              decoration: InputDecoration(
                  labelText: 'Numero da conta', hintText: '0000'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textControllerValor,
              style: TextStyle(fontSize: 24.0),
              decoration:
                  InputDecoration(labelText: 'Valor', hintText: '000.00'),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () {
              debugPrint('clicou no confirmar');
              final int? numeroConta = int.tryParse(_textControllerNumConta.text);
              final double? valor = double.tryParse(_textControllerValor.text);
              if(numeroConta != null && valor != null){
                final tranferenciaCriada = Tranferencia(valor, numeroConta);
                debugPrint('$tranferenciaCriada');
              }
            },
          )
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTranferencia(Tranferencia(100.6, 17380)),
          ItemTranferencia(Tranferencia(402.7, 87532)),
          ItemTranferencia(Tranferencia(809.4, 57934)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTranferencia extends StatelessWidget {
  final Tranferencia _tranferencia;

  const ItemTranferencia(this._tranferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_tranferencia.valor.toString()),
        subtitle: Text(_tranferencia.numeroConta.toString()),
      ),
    );
  }
}

class Tranferencia {
  final double valor;
  final int numeroConta;

  Tranferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Tranferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

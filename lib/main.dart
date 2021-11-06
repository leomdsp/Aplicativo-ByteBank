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
  final TextEditingController _controladorNumConta =
      TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(controlador:_controladorNumConta, rotulo: 'Número da conta', dica: '0000'),
          Editor(controlador:_controladorValor, rotulo:'Valor', dica:'00.00', icone: Icons.monetization_on,),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () => _criaTransferencia(),
          )
        ],
      ),
    );
  }

  void _criaTransferencia() {
    final int? numeroConta = int.tryParse(_controladorNumConta.text);
    final double? valor = double.tryParse(_controladorValor.text);
    if(numeroConta != null && valor != null){
      final tranferenciaCriada = Tranferencia(valor, numeroConta);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({ this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration:
        InputDecoration(icon: icone != null ? Icon(icone) : null, labelText: rotulo,  hintText: dica),
        keyboardType: TextInputType.number,
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

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tela_inicial();
  }
}

class Tela_inicial extends StatefulWidget {
  const Tela_inicial({Key? key}) : super(key: key);

  @override
  State<Tela_inicial> createState() => _Tela_inicialState();
}

class _Tela_inicialState extends State<Tela_inicial> {
  int _contadorPessoas = 0;

  _atualizarContador(String title) {
    setState(() {
      if (title == "+")
        _contadorPessoas++;
      else if (_contadorPessoas > 0) _contadorPessoas--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contador de Pessoas"),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _contador(),
          SizedBox(height: 16),
          _button("+"),
          SizedBox(height: 36),
          _button("-"),
        ],
      ),
    );
  }

  _contador() {
    return Text(
      '$_contadorPessoas',
      style: TextStyle(
        color: Colors.red,
        fontSize: 144,
      ),
    );
  }

  _button(title) {
    return Container(
      width: 200,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: title == "+" ? Colors.blueGrey : Colors.tealAccent,
        ),
        onPressed: () {
          _atualizarContador(title);
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}

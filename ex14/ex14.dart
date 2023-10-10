import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas de Desenvolvedor"),
      centerTitle: true,
      backgroundColor: Colors.orangeAccent,
    );
  }

  _corpo() {
    return Container(
      child: ListView(
        children: <Widget>[
          _vaga('Desenvolvedor Backend Junior',
              'Salário: 3000,00. Criar aplicações em Java com Spring Boot. Contato: recrutador@ibm.com'),
          _vaga('Desenvolvedor Frontend Junior',
              'Salário: 2700,00. Criar aplicações em Vue.JS. Contato: Recrutador@fiap.com'),
          _vaga('Desenvolvedor Backend Pleno',
              'Salário: 5000,00. Criar aplicações em C#. Contato: Recrutador@accenture.com'),
          _vaga('Desenvolvedor Frontend Senior',
              'Salário: 3700,00. Criar aplicações em React.JS. Contato: Recrutador@itau.com'),
        ],
      ),
    );
  }

  _textoVaga(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20,
      ),
    );
  }

  _tituloVaga(String titulo) {
    return Text(
      titulo,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: 28,
      ),
    );
  }

  _vaga(String tituloVaga, String textoVaga) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      child: Column(children: <Widget>[
        SizedBox(height: 15),
        _tituloVaga(tituloVaga),
        SizedBox(height: 10),
        _textoVaga(textoVaga),
      ]),
    );
  }
}

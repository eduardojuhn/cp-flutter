import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitialScreen();
  }
}

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String resultText = "";

  void _calculateRandomNumber() {
    setState(() {
      int randomNumber = Random().nextInt(11);
      resultText = "Número: $randomNumber";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Jogo do n° Aleatório"),
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _img(),
          SizedBox(height: 20),
          _buildTitle(),
          SizedBox(height: 30),
          _buildButton(),
          SizedBox(height: 16),
          _buildResultText(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Pense em um n° de 0 a 10",
      style: TextStyle(
        color: Colors.red,
        fontSize: 22,
      ),
    );
  }

  Widget _buildResultText() {
    return Text(
      resultText,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 28,
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: () {
          _calculateRandomNumber();
        },
        child: Text(
          "Descobrir",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  _img() {
    return Center(
      child: Image.network(
        'https://colorindo.org/wp-content/uploads/2022/10/desenhos-de-ponto-de-interrogacao-1.jpg',
        height: 200,
        width: 200,
      ),
    );
  }
}
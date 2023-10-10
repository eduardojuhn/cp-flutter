import 'package:flutter/material.dart';
import 'Infos.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  String dropdownSexoValor = "Masculino";
  String dropdownEscolaridadeValor = "Ensino Médio";
  double valorLimiteSlider = 200.00;
  bool valorBrasileiroSwitch = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Abertura de Conta"),
          centerTitle: true,
        ),
        body: _body(context),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _campo("Digite o nome", nomeController),
          SizedBox(height: 10),
          _campo("Digite a idade", idadeController),
          SizedBox(height: 10),
          _dropdownSexo(),
          SizedBox(height: 10),
          _dropdownEscolaridade(),
          SizedBox(height: 10),
          _sliderLimite(),
          SizedBox(height: 10),
          _switchNacionalidade(),
          SizedBox(height: 30),
          _button(context),
        ],
      ),
    );
  }

  _campo(String title, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: title, labelStyle: TextStyle(color: Colors.blue)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.orange, fontSize: 20.0),
      controller: controller,
    );
  }

  _button(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: () {
          _onClickNavegacao(context);
        },
        child: Text(
          "Confirmar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  _dropdownSexo() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Sexo", style: TextStyle(fontSize: 20, color: Colors.blue)),
          SizedBox(width: 15),
          DropdownButton<String>(
            value: dropdownSexoValor,
            items: <String>['Masculino', 'Feminino'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valorSelecionado) {
              setState(() {
                dropdownSexoValor = valorSelecionado!;
              });
            },
          ),
        ],
      ),
    );
  }

  _dropdownEscolaridade() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Escolaridade",
              style: TextStyle(fontSize: 20, color: Colors.blue)),
          SizedBox(width: 15),
          DropdownButton<String>(
            value: dropdownEscolaridadeValor,
            items: <String>[
              'Ensino Fundamental',
              'Ensino Médio',
              'Graduação',
              'Pós Graduação',
              'Mestrado',
              'Doutorado'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valorSelecionado) {
              setState(() {
                dropdownEscolaridadeValor = valorSelecionado!;
              });
            },
          ),
        ],
      ),
    );
  }

  _sliderLimite() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Limite", style: TextStyle(fontSize: 20, color: Colors.blue)),
          Slider(
            value: valorLimiteSlider,
            min: 0,
            max: 1000,
            divisions: 20,
            label: (valorLimiteSlider > 800)
                ? 'Limite muito alto ($valorLimiteSlider)'
                : valorLimiteSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                valorLimiteSlider = value;
              });
            },
          ),
        ],
      ),
    );
  }

  _switchNacionalidade() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Brasileiro?",
              style: TextStyle(fontSize: 20, color: Colors.blue)),
          SizedBox(width: 15),
          Switch(
            value: valorBrasileiroSwitch,
            onChanged: (value) {
              setState(() {
                valorBrasileiroSwitch = value;
              });
            },
          ),
        ],
      ),
    );
  }

  _onClickNavegacao(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Infos(
              valueNome: nomeController.text,
              valueIdade: idadeController.text,
              valueSexo: dropdownSexoValor,
              valueEscolaridade: dropdownEscolaridadeValor,
              valueLimite: valorLimiteSlider.toString(),
              valueNacionalidade: (valorBrasileiroSwitch == true)
                  ? 'Brasileira'
                  : 'Estrangeira');
        },
      ),
    );
  }
}

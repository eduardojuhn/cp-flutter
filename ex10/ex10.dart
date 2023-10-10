import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  String sexoSelecionado = "Masculino";
  String escolaridadeSelecionada = "Ensino Médio";
  double limiteSlider = 200.00;
  bool brasileiro = true;

  String dados = "";

  void _exibirDados() {
    setState(() {
      String nome = nomeController.text;
      String idade = idadeController.text;
      String nacionalidade =
          (brasileiro == true) ? 'Brasileira' : 'Estrangeira';

      dados =
          "Dados informados: \n\nNome: $nome \nIdade: $idade \nSexo: $sexoSelecionado \nEscolaridade: $escolaridadeSelecionada \nLimite: $limiteSlider \nNacionalidade: $nacionalidade";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal, // Cor principal
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.orange), // Cor do texto
        ),
        fontFamily: 'Arial', // Fonte padrão
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cadastro",
            style: TextStyle(fontFamily: 'Arial'), // Fonte do título
          ),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _campo("Nome", nomeController),
          SizedBox(height: 10),
          _campo("Idade", idadeController),
          SizedBox(height: 10),
          _dropdownSexo(),
          SizedBox(height: 10),
          _dropdownEscolaridade(),
          SizedBox(height: 10),
          _sliderLimite(),
          SizedBox(height: 10),
          _switchNacionalidade(),
          SizedBox(height: 30),
          _button(),
          SizedBox(height: 16),
          _texto(),
        ],
      ),
    );
  }

  _campo(String label, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
    );
  }

  _texto() {
    return Text(
      dados,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  _button() {
    return ElevatedButton(
      onPressed: () {
        _exibirDados();
      },
      child: Text(
        "Salvar",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  _dropdownSexo() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Sexo", style: TextStyle(fontSize: 20)),
          SizedBox(width: 15),
          DropdownButton<String>(
            value: sexoSelecionado,
            items: <String>['Masculino', 'Feminino'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valorSelecionado) {
              setState(() {
                sexoSelecionado = valorSelecionado!;
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
          Text("Escolaridade", style: TextStyle(fontSize: 20)),
          SizedBox(width: 15),
          DropdownButton<String>(
            value: escolaridadeSelecionada,
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
                escolaridadeSelecionada = valorSelecionado!;
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
          Text("Limite", style: TextStyle(fontSize: 20)),
          SizedBox(width: 15),
          Slider(
            value: limiteSlider,
            min: 0,
            max: 1000,
            divisions: 20,
            label: (limiteSlider > 800)
                ? 'Limite muito alto ($limiteSlider)'
                : limiteSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                limiteSlider = value;
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
          Text("Brasileiro?", style: TextStyle(fontSize: 20)),
          SizedBox(width: 15),
          Switch(
            value: brasileiro,
            onChanged: (value) {
              setState(() {
                brasileiro = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

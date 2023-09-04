import 'package:flutter/material.dart';

void main() {
  runApp(CombustivelApp());
}

class CombustivelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gasolina x Álcool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CombustivelScreen(),
    );
  }
}

class CombustivelScreen extends StatefulWidget {
  @override
  _CombustivelScreenState createState() => _CombustivelScreenState();
}

class _CombustivelScreenState extends State<CombustivelScreen> {
  TextEditingController _etanolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();
  String _resultado = '';

  void _calcularMelhorCombustivel() {
    double precoEtanol = double.tryParse(_etanolController.text) ?? 0;
    double precoGasolina = double.tryParse(_gasolinaController.text) ?? 0;

    if (precoEtanol <= 0 || precoGasolina <= 0) {
      setState(() {
        _resultado = 'Por favor, insira preços válidos.';
      });
      return;
    }

    double relacao = precoEtanol / precoGasolina;

    String resultado = '';

    if (relacao <= 0.7) {
      resultado = 'Abasteça com Etanol';
    } else {
      resultado = 'Abasteça com Gasolina';
    }

    setState(() {
      _resultado = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gasolina x Álcool'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://wp-midia-nova.bidu.com.br/uploads/2017/01/05175045/%C3%A1lcool.png',
              width: 200,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _etanolController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço do Etanol',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _gasolinaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preço da Gasolina',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularMelhorCombustivel,
              child: Text('Calcular Melhor Combustível'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

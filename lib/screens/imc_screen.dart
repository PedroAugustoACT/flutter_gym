import 'package:flutter/material.dart';
import '../styles/imc_styles.dart';

class IMCScreen extends StatefulWidget {
  @override
  _IMCScreenState createState() => _IMCScreenState();
}

class _IMCScreenState extends State<IMCScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _result = '';

  void _calculateIMC() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    if (height != null && weight != null && height > 0 && weight > 0) {
      final imc = weight / (height * height);
      setState(() {
        _result =
            'Seu IMC é ${imc.toStringAsFixed(2)} (${_getIMCClassification(imc)})';
      });
      Navigator.pushNamed(context, '/home');
    } else {
      setState(() {
        _result = 'Por favor, insira valores válidos.';
      });
    }
  }

  String _getIMCClassification(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidade';
    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Para começar, precisamos de algumas informações para melhor lhe atender',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: IMCStyles.textFieldDecoration('Altura (m)'),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: IMCStyles.textFieldDecoration('Peso (kg)'),
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _calculateIMC,
                child: Text('Calcular IMC'),
                style: IMCStyles.calculateButtonStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

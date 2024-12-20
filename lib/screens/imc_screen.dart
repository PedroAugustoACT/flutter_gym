import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/imc_styles.dart';

class IMCScreen extends StatefulWidget {
  @override
  _IMCScreenState createState() => _IMCScreenState();
}

class _IMCScreenState extends State<IMCScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _result = '';

  void _calculateIMC() {
    if (_formKey.currentState!.validate()) {
      final height =
          double.tryParse(_heightController.text.replaceAll(',', '.'));
      final weight =
          double.tryParse(_weightController.text.replaceAll(',', '.'));

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFF4BF01)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Image.asset(
            'assets/images/logo-smart-fit-2048.png',
            height: 100,
          ),
        ),
        actions: [
          Container(width: 48),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Text(
                            'Para começar, precisamos de algumas informações para melhor lhe atender',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.,]')),
                            ],
                            decoration:
                                IMCStyles.textFieldDecoration('Altura (m)'),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'A altura é obrigatória.';
                              }
                              if (double.tryParse(value.replaceAll(',', '.')) ==
                                  null) {
                                return 'Insira uma altura válida.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: _weightController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9.,]')),
                            ],
                            decoration:
                                IMCStyles.textFieldDecoration('Peso (kg)'),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'O peso é obrigatório.';
                              }
                              if (double.tryParse(value.replaceAll(',', '.')) ==
                                  null) {
                                return 'Insira um peso válido.';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: _calculateIMC,
                            child: Text('Continuar'),
                            style: IMCStyles.calculateButtonStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gym/widgets/expiry_date_formatter.dart';
import '../styles/payment_styles.dart';

class CardPaymentForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _cardNumberController,
            decoration: PaymentStyles.textFieldDecoration('Número do Cartão'),
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'O número do cartão é obrigatório.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _expiryDateController,
            decoration: PaymentStyles.textFieldDecoration('Data de Validade'),
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              ExpiryDateFormatter(),
            ],
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'A data de validade é obrigatória.';
              }
              if (!RegExp(r'^(0[1-9]|1[0-2])/\d{2}$').hasMatch(value)) {
                return 'Insira uma data válida no formato MM/AA.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _cvvController,
            decoration:
                PaymentStyles.textFieldDecoration('Código de Segurança'),
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'O código de segurança é obrigatório.';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: PaymentStyles.confirmButtonStyle(),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushReplacementNamed(context, '/imc');
              }
            },
            child: Text(
              'Confirmar pagamento',
              style:
                  PaymentStyles.buttonTextStyle.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

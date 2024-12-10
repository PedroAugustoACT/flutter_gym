import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../styles/payment_styles.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isPixSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: PaymentStyles.paymentButtonStyle(!isPixSelected),
                        onPressed: () {
                          setState(() {
                            isPixSelected = false;
                          });
                        },
                        child: Text(
                          'Cartão',
                          style: PaymentStyles.buttonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: PaymentStyles.paymentButtonStyle(isPixSelected),
                        onPressed: () {
                          setState(() {
                            isPixSelected = true;
                          });
                        },
                        child: Text(
                          'PIX',
                          style: PaymentStyles.buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                isPixSelected
                    ? _buildPixPayment(context)
                    : _buildCardPaymentForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardPaymentForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: PaymentStyles.textFieldDecoration('Número do Cartão'),
          style: TextStyle(color: const Color(0xFFF4BF01)),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: PaymentStyles.textFieldDecoration('Data de Validade'),
          style: TextStyle(color: const Color(0xFFF4BF01)),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: PaymentStyles.textFieldDecoration('Código de Segurança'),
          style: TextStyle(color: const Color(0xFFF4BF01)),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: PaymentStyles.confirmButtonStyle(),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/imc');
          },
          child: Text(
            'Confirmar pagamento',
            style: PaymentStyles.buttonTextStyle.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildPixPayment(BuildContext context) {
    String pixData = 'pix:chave-do-pagamento-fake';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16.0),
          child: QrImageView(
            data: pixData,
            version: QrVersions.auto,
            size: 200.0,
            foregroundColor: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Leia o QR Code acima para concluir o pagamento.',
          style: PaymentStyles.pixTextStyle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: PaymentStyles.confirmButtonStyle(),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/imc');
          },
          child: Text(
            'Confirmar pagamento',
            style: PaymentStyles.buttonTextStyle.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

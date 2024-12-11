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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Text(
                        'Selecione a forma de pagamento',
                        style: PaymentStyles.selectionMessageStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: PaymentStyles.paymentButtonStyle(
                                !isPixSelected),
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
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            style:
                                PaymentStyles.paymentButtonStyle(isPixSelected),
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
                    // Selecione o conteúdo baseado na opção PIX ou Cartão
                    isPixSelected
                        ? _buildPixPayment(context)
                        : _buildCardPaymentForm(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardPaymentForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: PaymentStyles.textFieldDecoration('Número do Cartão'),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: PaymentStyles.textFieldDecoration('Data de Validade'),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: PaymentStyles.textFieldDecoration('Código de Segurança'),
          style: const TextStyle(color: Colors.white),
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

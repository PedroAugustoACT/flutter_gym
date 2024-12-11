import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../styles/payment_styles.dart';

class PixPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

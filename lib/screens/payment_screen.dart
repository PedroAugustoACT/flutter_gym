import 'package:flutter/material.dart';
import '../styles/payment_styles.dart';
import '../widgets/card_payment.dart';
import '../widgets/pix_payment.dart';

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
                    isPixSelected ? PixPayment() : CardPaymentForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/services.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll('/', '');
    String formattedText = '';

    if (text.length > 0) {
      if (text.length <= 2) {
        formattedText = text;
      } else if (text.length <= 4) {
        formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
      } else {
        return oldValue;
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

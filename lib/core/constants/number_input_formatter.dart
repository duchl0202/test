class NumberInputFormatter {
  static double formatEditUpdate(String value) {
    final String newText = value.replaceAll(',', '').replaceAll('.', '');
    if (newText.isEmpty) {
      return double.parse('0');
    }
    final buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i % 3 == 0 && i != 0) {
        buffer.write(',');
      }
      buffer.write(newText[newText.length - 1 - i]);
    }
    final String string = buffer.toString();
    final String formattedString = string.split('').reversed.join('');
    return double.parse(formattedString);
  }
}

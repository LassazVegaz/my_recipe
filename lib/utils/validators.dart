bool validatePhoneNumber(String number) {
  final RegExp regex = RegExp(r'(\+94|0)7[0-9]{8}');
  return regex.hasMatch(number);
}

class Utils {
  static bool isValidNumber(String number) {
//    String urlPattern = r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    String numPattern =
//        r"^(https://|http://)?(www.)([a-zA-Z0-9]+).[a-zA-Z0-9]*.[a-z]{3}.?([a-z]+)$";
        r'^(?:[+0]9)?[0-9]{10,}$';
    RegExp regExp = new RegExp(numPattern);
    print(regExp.hasMatch(number));
    return regExp.hasMatch(number);
  }
}

class NoMatchName implements Exception {
  final String message;
  NoMatchName(this.message);
}

class Exception500 implements Exception {
  final String message;
  Exception500(this.message);
}

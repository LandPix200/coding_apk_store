class NumberUtils {
  static String formatNumberM(int number) {
    if (number >= 1000000) {
      double simplified = number / 1000000;
      String formatted = simplified.toStringAsFixed(1);
      return '$formatted M';
    } else if (number >= 1000) {
      double simplified = number / 1000;
      String formatted = simplified.toStringAsFixed(1);
      return '$formatted K';
    }
    return number.toString();
  }
}

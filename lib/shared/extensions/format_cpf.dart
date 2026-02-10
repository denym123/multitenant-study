extension StringFormatting on String {
  String formatCpf() {
    final cleaned = replaceAll(RegExp(r'\D'), '');
    if (cleaned.length != 11) {
      return this;
    }
    return '${cleaned.substring(0, 3)}.${cleaned.substring(3, 6)}.${cleaned.substring(6, 9)}-${cleaned.substring(9)}';
  }
}

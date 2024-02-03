extension FileSizeExtension on int {
  String get fileSize {
    const int oneKB = 1024;
    const int oneMB = 1024 * oneKB;
    const int oneGB = 1024 * oneMB;

    if (this >= oneGB) {
      return '${(this / oneGB).toStringAsFixed(2)} GB';
    } else if (this >= oneMB) {
      return '${(this / oneMB).toStringAsFixed(2)} MB';
    } else if (this >= oneKB) {
      return '${(this / oneKB).toStringAsFixed(2)} KB';
    } else {
      return '${this} Bytes';
    }
  }
}

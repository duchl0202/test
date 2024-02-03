extension EmailExtension on String {
  String getUserNameFromEmail() {
    final int atIndex = indexOf('@');
    if (atIndex != -1 && atIndex > 0) {
      return substring(atIndex - 1, atIndex);
    }
    return '';
  }

  Map<String, dynamic> convertStringToJson() {
    final styleValue = replaceAll(RegExp(r'[\{\}\s]'), '');

    final List<String> keyValuePairs = styleValue.split(',');

    final Map<String, dynamic> jsonMap = {};

    if (styleValue.isNotEmpty && styleValue != 'null') {
      for (String pair in keyValuePairs) {
        final List<String> keyValue = pair.split(':');
        final String key = keyValue[0].trim();
        final String value = keyValue[1].trim();

        if (key == 'style') {
          continue;
        }

        if (value == 'true' || value == 'false') {
          jsonMap[key] = value == 'true';
        } else {
          jsonMap[key] = value;
        }
      }
    }

    return jsonMap;
  }

  String capitalizeFirstLetter() {
    if (isEmpty) {
      return this;
    }

    return this[0].toUpperCase() + substring(1);
  }
}

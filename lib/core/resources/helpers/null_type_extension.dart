extension NullSafetyOnString on String? {
  String nullSafety() {
    return this ?? "null";
  }
}

extension NullSafetyOnNum on num? {
  num nullSafety() {
    return this ?? -1;
  }
}

extension NullSafetyOnMap on Map<String?, String?>? {
  Map<String, String> nullSafety() {
    if (this == null) {
      return {"null": "null"};
    } else {
      final Map<String, String> result = {};
      this!.forEach((key, value) {
        final safeKey = key.nullSafety();
        final safeValue = value.nullSafety();
        result[safeKey] = safeValue;
      });
      return result;
    }
  }
}

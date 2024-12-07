class SharedPreferenceConstats {
  static const String userIfo = "userInfo";
}

class SharedPreDataClass<T> {
  final String name;
  final T type;

  SharedPreDataClass({required this.name, required this.type});
}

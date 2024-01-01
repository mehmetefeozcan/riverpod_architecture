enum NavigationEnums {
  splash('splash');

  final String value;
  const NavigationEnums(this.value);

  String get toPath => '/$value';
}

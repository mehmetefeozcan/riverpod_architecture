enum NavigationEnums {
  splash('splash'),
  dashboard('dashboard'),
  home('home'),
  ;

  final String value;
  const NavigationEnums(this.value);

  String get toPath => '/$value';
}

enum EndpointEnums {
  login('login'),
  register('register'),
  refresh('refresh');

  final String value;
  const EndpointEnums(this.value);

  String get toPath => '/$value';
}

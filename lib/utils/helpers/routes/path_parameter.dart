class PathParameter {
  late String key;
  late String value;

  PathParameter(String key, String value) {
    // we need to make the first character of key is ':'
    this.key = key.contains(':') ? key : ':' + key;
    this.value = value;
  }
}
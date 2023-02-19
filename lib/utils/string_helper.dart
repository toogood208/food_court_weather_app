String removeDecimal(String string) {
  final arr = string.split(".");
  return arr[0];
}
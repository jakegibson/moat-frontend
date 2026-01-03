// Stub file for non-web platforms
// This file provides empty implementations for dart:html types

class FileUploadInputElement {
  String accept = '';
  bool multiple = false;
  CssStyleDeclaration get style => CssStyleDeclaration();
  Stream<dynamic> get onChange => const Stream.empty();
  List<File>? get files => null;
  void remove() {}
  void click() {}
}

class CssStyleDeclaration {
  String display = '';
}

class File {
  String get name => '';
}

class FileReader {
  dynamic result;
  Stream<dynamic> get onLoadEnd => const Stream.empty();
  void readAsArrayBuffer(dynamic blob) {}
}

class _Document {
  _Body? body;
}

class _Body {
  void append(dynamic element) {}
}

// ignore: non_constant_identifier_names
final document = _Document();

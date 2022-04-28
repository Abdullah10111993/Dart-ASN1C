// TODO: Put public facing types in this file.
import 'dart:ffi';
import 'dart:io' show Directory, Platform;

import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

/// Checks if you are awesome. Spoiler: you are.
class ASN1C {
  typedef decodeNative = Pointer<Utf8> Function(Pointer<Utf8> str);
  typedef decode = Pointer<Utf8> Function(Pointer<Utf8> str);
}

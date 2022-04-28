// TODO: Put public facing types in this file.
import 'dart:ffi';
import 'dart:io' show Directory, Platform;

import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;


typedef DECODENATIVE = Pointer<Utf8> Function(Pointer<Utf8> str);
typedef DECODE = Pointer<Utf8> Function(Pointer<Utf8> str);

class ASN1C {
  
  String libraryPath = "";

  ASN1C(){
    libraryPath = path.join(Directory.current.path, 'lib', 'src', 'asn1c_lib', 'lin_build', 'libasn1c.so');
    if (Platform.isMacOS) {
      libraryPath = path.join(Directory.current.path, 'lib', 'src', 'asn1c_lib', 'mac_build', 'libasn1c.dylib');
    }
    if (Platform.isWindows) {
      libraryPath = path.join(Directory.current.path, 'lib', 'src', 'asn1c_lib', 'win_build', 'libasn1c.dll');
    }
  }

  String decoder(String msg) {
    final dylib = DynamicLibrary.open(libraryPath);
    final decoder = dylib.lookupFunction<DECODENATIVE, DECODE>('decodeMsg');
    final msgsUtf8 = msg.toNativeUtf8();
    final decodedMsgUtf8 = decoder(msgsUtf8);
    final decodedMsg = decodedMsgUtf8.toDartString();
    return decodedMsg;
  }

}
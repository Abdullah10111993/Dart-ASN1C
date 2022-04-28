import 'dart:ffi';
import 'dart:io' show Directory, Platform;

import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

// Creating place holder funcitions for the c program
typedef DECODENATIVE = Pointer<Utf8> Function(Pointer<Utf8> str);
typedef DECODE = Pointer<Utf8> Function(Pointer<Utf8> str);


class ASN1C {
  
  String libraryPath = "";

  // Constructor -- initailizing library path
  ASN1C(){
    // library path for linux platform
    libraryPath = path.join(Directory.current.path, 'lib', 'src', 'asn1c_lib', 'lin_build', 'libasn1c.so');
    
    // library path for macos platform
    if (Platform.isMacOS) {
      libraryPath = path.join(Directory.current.path, 'lib', 'src', 'asn1c_lib', 'mac_build', 'libasn1c.dylib');
    }
    
    // library path for windows platform
    if (Platform.isWindows) {
      libraryPath = path.join(Directory.current.path, 'lib', 'src', 'asn1c_lib', 'win_build', 'libasn1c.dll');
    }
  }

  // decoder function that calls uper_decoder of asn1c library
  // Params1 - hex string that needs to be decoded
  // returns XML string
  String decoder(String msg) {
    // Opens the dynamic shared library and maps native function to dart function
    final dylib = DynamicLibrary.open(libraryPath);
    final decoder = dylib.lookupFunction<DECODENATIVE, DECODE>('decodeMsg');
    
    // Converts dat string to Native Utf8 
    final msgsUtf8 = msg.toNativeUtf8();

    final decodedMsgUtf8 = decoder(msgsUtf8);
    
    // Converts Native Utf8 to dat string  
    final decodedMsg = decodedMsgUtf8.toDartString();
    
    return decodedMsg;
  }

}
import 'package:dart_asn1c/dart_asn1c.dart';

void main() {
  final asn1c = ASN1C();
  final msg = '00204B7FFFC2000004EA1292E54D8BD20439BF9E0D19E0FFFF00FF00000007D07D07F7FFF64039BF9E0D9B17A40833C0000780002000080000000007FFF807F801FFFC0012018000810102000000';
  
  print(asn1c.decoder(msg));
}

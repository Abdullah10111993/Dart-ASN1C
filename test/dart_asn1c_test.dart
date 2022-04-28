import 'package:dart_asn1c/dart_asn1c.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final asn1c = ASN1C();
    final msg = '00204B7FFFC2000004EA1292E54D8BD20439BF9E0D19E0FFFF00FF00000007D07D07F7FFF64039BF9E0D9B17A40833C0000780002000080000000007FFF807F801FFFC0012018000810102000000';
  
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(asn1c.decoder(msg), isNotNull);
    });
  });
}

import 'dart:typed_data';
import 'package:dropbear/src/resource_identifier.dart';
import 'package:test/test.dart';

void main() {
  group('Serialization methods', () {
    final identity = ResourceIdentifier();

    test('.toRawBytes returns a value of the correct type', () {
      expect(identity.toRawBytes(), isNotEmpty);
      expect(identity.toRawBytes(), isA<Uint8List>());
    });

    test('.toString returns a value of the correct type', () {
      expect(identity.toString(), isNotEmpty);
      expect(identity.toString(), isA<String>());
    });

    test('.toReadableString returns a value of the correct type', () {
      expect(identity.toReadableString(), isNotEmpty);
      expect(identity.toReadableString(), isA<String>());
    });
  });

  group('Validation', () {
    final identity = ResourceIdentifier();

    test('Validates its own toString method correctly', () {
      expect(ResourceIdentifier.isValid(identity.toString()), isTrue);
    });

    test('Validates its own toReadableString method correctly', () {
      expect(ResourceIdentifier.isValid(identity.toReadableString()), isTrue);
    });

    test('Validates a known good string correctly', () {
      // Hello World string from https://www.dcode.fr/crockford-base-32-encoding
      const knownGoodValue = '91JPRV3F41BPYWKCCG8';
      expect(ResourceIdentifier.isValid(knownGoodValue), isTrue);
    });
  });

  group('Constructor options', () {
    test('Rejects a size that is too small', () {
      expect(() => ResourceIdentifier(sizeInBytes: -1),
          throwsA(isA<RangeError>()));

      expect(
          () => ResourceIdentifier(sizeInBytes: 2), throwsA(isA<RangeError>()));
    });

    test('Rejects a size that is too big', () {
      expect(() => ResourceIdentifier(sizeInBytes: 100),
          throwsA(isA<RangeError>()));
    });

    test('Accepts minimum and maximum sizes', () {
      expect(() => ResourceIdentifier(sizeInBytes: 10), returnsNormally);

      expect(() => ResourceIdentifier(sizeInBytes: 32), returnsNormally);
    });
  });
}

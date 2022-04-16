import 'dart:math';
import 'dart:typed_data';
import 'package:base32/base32.dart';
import 'package:base32/encodings.dart';
import 'package:quiver/iterables.dart';

/// Acts as an identifier for a resource
///
/// A cryptographically secure random identifier that can be expressed as a
/// Crockform Base32 string which provides a number of benefits over something
/// like a UUID for example as outlined here: http://www.crockford.com/base32.html
///
/// Used as an alternative to something like a UUID for example.
///
/// Example usage
/// ```dart
/// class MyResource {
///   late final ResourceIdentifier id;
///
///   MyResource(){
///     id = ResourceIdentifier;
///   }
/// }
/// ```
///
/// Implementation is based on Chapter 6 of the book API Design Patterns by
/// JJ Geewax (ISBN: 9781617295850) which makes a strong case for this
/// approach over other identifiers in modern API development.
class ResourceIdentifier {
  // Static Variables & Constants

  static const int _maxIdentifierSizeInBytes = 64;
  static const int _minIdentifierSizeInBytes = 4;

  // Instance Variables & Constants

  late final Uint8List _identifier;

  // Constructors & Factories

  ResourceIdentifier({int sizeInBytes = 7}) {
    if (sizeInBytes > ResourceIdentifier._maxIdentifierSizeInBytes) {
      throw RangeError(
          "sizeInBytes can not be higher than $ResourceIdentifier._maxIdentifierSizeInBytes bytes");
    }

    if (sizeInBytes < ResourceIdentifier._minIdentifierSizeInBytes) {
      throw RangeError(
          "sizeInBytes can not be lower than $ResourceIdentifier._minIdentifierSizeInBytes bytes");
    }

    _identifier = ResourceIdentifier._createRandomBytes(sizeBytes: sizeInBytes);
  }

  // Public Static Methods

  /// Validates a given [ResourceIdentifier]
  ///
  /// Returns `true` if the [String] provided is a valid
  /// [ResourceIdentifier].
  ///
  /// ```dart
  /// ResourceIdentifier.isValid(WN9P3405N1MQ2KXK5X60A) == true
  /// ```
  static bool isValid(String identifier) {
    // If there are any dashes in the identifier remove them first
    identifier = identifier.replaceAll('-', '');

    // Split the identifier into two pieces:
    // the value and the checksum character
    final value = identifier.substring(0, identifier.length - 1);
    final checksumChar = identifier[identifier.length - 1];

    try {
      // Decode the [Base32] value into its raw bytes.
      final buffer = base32.decode(value, encoding: Encoding.crockford);

      // Return whether the calculated checksum value
      // is equal to the provided one.
      return ResourceIdentifier._getChecksumCharacter(
              _calculateChecksum(buffer)) ==
          checksumChar;
    } catch (e) {
      return false;
    }
  }

  // Private Static Methods

  /// Uses the Base37 alphabet to choose a checksum value character
  ///
  /// Provides a way of representing the checksum value as a [String]
  /// rather than just a numeric value. It does this by building upon
  /// the standard [Base32] alphabet with 5 additional characters.
  /// This way any value that results from our checksum calculation
  /// (which will range from 0 to 36) will have a character to use
  /// in the identifier.
  static String _getChecksumCharacter(int checksumValue) {
    const base32Alphabet = '0123456789ABCDEFGHJKMNPQRSTVWXYZ';
    const additionalCharacters = '*~\$=U';
    const base37Alphabet = base32Alphabet + additionalCharacters;

    return base37Alphabet[checksumValue.abs()];
  }

  /// Creates a [Uint8List] of random data of a fixed size.
  static Uint8List _createRandomBytes({required int sizeBytes}) {
    final randomNumberGenerator = Random.secure();
    final Uint8List randomData = Uint8List(sizeBytes);
    for (var i = 0; i < sizeBytes; i++) {
      randomData[i] = randomNumberGenerator.nextInt(256);
    }
    return randomData;
  }

  /// Calculates a [Base32] checksum value.
  static int _calculateChecksum(Uint8List bytes) {
    // Start by converting the byte buffer into a [BigInt] value
    final BigInt intValue = _BigInt.fromByteStream(bytes);

    // Calculate the checksum value by determining the remainder after
    // dividing by 37
    final checksum = intValue % BigInt.from(37);

    return checksum.toInt();
  }

  // Public instance methods

  String toReadableString() {
    final identifier = toString();
    final idPartion = partition(identifier.split(''), 4);

    final chunks = <String>[];

    for (var element in idPartion) {
      chunks.add(element.join(''));
    }

    return chunks.join('-');
  }

  /// Some databases like MySQL are highly optimized for Binary data types
  /// this allows us to get direct access to it if needed.
  Uint8List toRawBytes() => _identifier;

  // Overrides

  @override
  String toString() {
    // Calculate the checksum and get the correct checksum character
    final checksum = _calculateChecksum(_identifier);
    final checksumCharacter = _getChecksumCharacter(checksum);
    final encoded = base32.encode(_identifier, encoding: Encoding.crockford);

    // Return the [Base32] serialized identifier with the checksum
    // character appended.
    return encoded + checksumCharacter;
  }
}

// BigInt doesn't come with a constructor that accepts [Uint8List] arguments
// so we can create an extension for it here.
extension _BigInt on BigInt {
  /// Converts a [Uint8List] byte buffer into a [BigInt]
  static fromByteStream(Uint8List bytes) {
    BigInt result = BigInt.zero;

    for (final byte in bytes) {
      // reading in big-endian, so we essentially concat the new byte to the end
      result = (result << 8) | BigInt.from(byte);
    }
    return result;
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/core/usecase/util/input_converter.dart';

void main() {
  late InputConverter inputConverter;
  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test('should return an integer when the string represent an unsigned integer', () async {
      final str = '123';
      final result = inputConverter.stringToUnsignedInteger(str);
      expect(result, Right(123));
    });
  });
}

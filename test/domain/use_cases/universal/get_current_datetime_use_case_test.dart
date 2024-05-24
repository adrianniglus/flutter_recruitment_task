import 'package:flutter_recruitment_task/domain/use_cases/universal/get_current_datetime_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetCurrentDateTimeUseCase useCase;

  final expected = DateTime.now();

  setUp(() {
    useCase = GetCurrentDateTimeUseCase();
  });

  group('GetCurrentDateTimeUseCase', () {
    test('Should return the current date and time', () {
      // Act
      final result = useCase();
      // Assert
      expect(result.year, expected.year);
      expect(result.month, expected.month);
      expect(result.day, expected.day);
      expect(result.hour, expected.hour);
      expect(result.minute, expected.minute);
      expect(result.second, expected.second);
    });
  });
}

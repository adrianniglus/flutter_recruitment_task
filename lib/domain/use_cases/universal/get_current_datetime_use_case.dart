import 'package:injectable/injectable.dart';

import '../../utils/use_case.dart';

// A use case that returns the current date and time.
// Allows for easy testing of time-dependent features.
@injectable
class GetCurrentDateTimeUseCase implements NoParamUseCaseSimple<DateTime> {
  const GetCurrentDateTimeUseCase();

  @override
  DateTime call() => DateTime.now();
}

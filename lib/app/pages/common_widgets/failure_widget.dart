import 'package:flutter/material.dart';

import '../../utils/app_spacing.dart';
import '../../utils/translations/generated/l10n.dart';


// A widget to display when the data fails to load
class FailureWidget extends StatelessWidget {
  const FailureWidget({required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Translation.of(context).somethingWentWrong,
            ),
            SizedBox(height: AppSpacing.dimension72),
            ElevatedButton(
              onPressed: onRefresh,
              child: Text(Translation.of(context).refresh),
            ),
          ],
        ),
      );
}

import 'package:flutter/material.dart';

import '../../../utils/app_spacing.dart';
import '../../../utils/translations/generated/l10n.dart';

class NoItemsFoundWidget extends StatelessWidget {
  const NoItemsFoundWidget();

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Translation.of(context).noMoviesFound,
            ),
            const SizedBox(height: AppSpacing.dimension12),
            Text(
              Translation.of(context).searchAnotherTitle,
            ),
            const SizedBox(height: AppSpacing.dimension24),
          ],
        ),
      );
}

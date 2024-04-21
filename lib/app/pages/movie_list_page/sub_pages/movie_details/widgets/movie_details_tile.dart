import 'package:flutter/material.dart';

import '../../../../../utils/app_spacing.dart';

// A widget to display the movie details
class MovieDetailsTile extends StatelessWidget {
  const MovieDetailsTile({
    required this.title,
    required this.content,
    super.key,
  });
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(AppSpacing.dimension16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: AppSpacing.dimension8),
            Text(
              content,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
}

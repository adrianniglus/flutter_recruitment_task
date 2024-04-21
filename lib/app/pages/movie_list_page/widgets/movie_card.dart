import 'package:flutter/material.dart';

import '../../../utils/app_spacing.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.title,
    required this.rating,
    required this.onTap,
    super.key,
  });
  final String title;
  final String rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          height: AppSpacing.dimension48,
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.dimension16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: AppSpacing.dimension16),
              Text(
                '$rating 🌟',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
}

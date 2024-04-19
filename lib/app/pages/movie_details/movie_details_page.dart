import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../domain/models/movies/movie_details.dart';
import '../../utils/app_spacing.dart';

@RoutePage()
class MovieDetailsPage extends StatefulWidget {
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final _details = [
    MovieDetails(title: 'Budget', content: '\$2400000'),
    MovieDetails(title: 'Revenue', content: '\$10000000'),
    MovieDetails(title: 'Should I watch it today?', content: 'Yes!'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          separatorBuilder: (context, index) => Container(
            height: AppSpacing.dimension1,
            color: Colors.grey.shade300,
          ),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(AppSpacing.dimension16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _details[index].title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: AppSpacing.dimension8),
                Text(
                  _details[index].content,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          itemCount: _details.length,
        ),
      );
}

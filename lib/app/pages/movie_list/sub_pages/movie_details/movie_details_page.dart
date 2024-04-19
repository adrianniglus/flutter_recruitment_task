import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/models/movies/movie.dart';
import '../../../../../injectable/injectable.dart';
import '../../../../utils/app_spacing.dart';
import '../../../../utils/translations/generated/l10n.dart';
import '../../../common_widgets/app_progress_indicator.dart';
import '../../../common_widgets/failure_widget.dart';
import 'cubit/movie_details_cubit.dart';
import 'cubit/movie_details_state.dart';
import 'widgets/movie_details_tile.dart';

@RoutePage()
class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) => BlocProvider<MovieDetailsCubit>(
        create: (_) => getIt<MovieDetailsCubit>()..init(movie.id),
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) => state.map(
            loaded: (loaded) => _Body(loaded.movie, loaded.shouldBeWatched),
            loading: (_) => _LoadingBody(title: movie.title),
            failure: (_) => _FailureBody(movie: movie),
          ),
        ),
      );
}

class _FailureBody extends StatelessWidget {
  const _FailureBody({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: FailureWidget(
          onRefresh: () => context.read<MovieDetailsCubit>().refresh(movie.id),
        ),
      );
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const AppProgressIndicator(),
      );
}

class _Body extends StatelessWidget {
  const _Body(this.movie, this.shouldBeWatched);

  final Movie movie;
  final bool shouldBeWatched;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: Column(
          children: [
            MovieDetailsTile(
              title: Translation.of(context).budget,
              content: '\$${movie.budget ?? Translation.of(context).noData}',
            ),
            const SizedBox(height: AppSpacing.dimension16),
            MovieDetailsTile(
              title: Translation.of(context).revenue,
              content: '\$${movie.revenue ?? Translation.of(context).noData}',
            ),
            const SizedBox(height: AppSpacing.dimension16),
            MovieDetailsTile(
              title: Translation.of(context).shoudIWatchIt,
              content: shouldBeWatched ? Translation.of(context).yes : Translation.of(context).no,
            ),
            const SizedBox(height: AppSpacing.dimension16),
          ],
        ),
      );
}

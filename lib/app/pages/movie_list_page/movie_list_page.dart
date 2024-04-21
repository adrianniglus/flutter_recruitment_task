import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/models/movies/movie.dart';
import '../../../injectable/injectable.dart';
import '../../utils/app_spacing.dart';
import '../../utils/router/app_router.gr.dart';
import '../../utils/translations/generated/l10n.dart';
import '../../common_widgets/app_progress_indicator.dart';
import '../../common_widgets/failure_widget.dart';
import 'cubit/movie_list_cubit.dart';
import 'cubit/movie_list_state.dart';
import 'widgets/movie_card.dart';
import 'widgets/no_items_found_widget.dart';
import 'widgets/search_box.dart';

@RoutePage()
class MovieListPage extends StatelessWidget {
  const MovieListPage();

  @override
  Widget build(BuildContext context) => BlocProvider<MovieListCubit>(
        create: (_) => getIt<MovieListCubit>(),
        child: BlocBuilder<MovieListCubit, MovieListState>(
          builder: (context, state) => const _Body(),
        ),
      );
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.movie_creation_outlined),
              onPressed: () => context.router.push(const TwoButtonsRoute()),
            ),
          ],
          title: Text(Translation.of(context).appTitle),
        ),
        body: Column(
          children: [
            SearchBox(
              onChanged: (query) => context.read<MovieListCubit>().search(query),
            ),
            _MovieList(),
          ],
        ),
      );
}

class _MovieList extends StatelessWidget {
  const _MovieList();

  @override
  Widget build(BuildContext context) => Expanded(
        child: BlocBuilder<MovieListCubit, MovieListState>(
          builder: (context, state) => state.maybeWhen(
            orElse: () => AppProgressIndicator(),
            failure: (error) => FailureWidget(
              onRefresh: () => context.read<MovieListCubit>().refresh(),
            ),
            loaded: (pagingController) => RefreshIndicator(
              onRefresh: context.read<MovieListCubit>().refresh,
              child: PagedListView.separated(
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<Movie>(
                  noItemsFoundIndicatorBuilder: (context) => NoItemsFoundWidget(),
                  animateTransitions: true,
                  itemBuilder: (context, item, index) => MovieCard(
                    title: item.title,
                    rating: '${(item.voteAverage * 10).toInt()}%',
                    onTap: () => context.router.push(MovieDetailsRoute(movie: item)),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: AppSpacing.dimension8,
                ),
              ),
            ),
          ),
        ),
      );
}

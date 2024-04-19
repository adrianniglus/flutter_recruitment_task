import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/models/movies/movie.dart';
import '../../../injectable/injectable.dart';
import 'cubit/movie_list_cubit.dart';
import 'cubit/movie_list_state.dart';
import 'widgets/movie_card.dart';
import 'widgets/search_box.dart';

@RoutePage()
class MovieListPage extends StatelessWidget {
  const MovieListPage();

  @override
  Widget build(BuildContext context) => BlocProvider<MovieListCubit>(
        create: (_) => getIt<MovieListCubit>(),
        child: BlocConsumer<MovieListCubit, MovieListState>(
          listener: _listener,
          builder: (context, state) => const _Body(),
        ),
      );

  void _listener(BuildContext ctx, MovieListState state) => state.mapOrNull(
        failure: (error) => SnackBar(
          content: error.failure.content != null ? Text(error.failure.content!) : const Text('Something went wrong'),
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
              onPressed: () {
                //TODO implement navigation
              },
            ),
          ],
          title: Text('Movie Browser'),
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
  Widget build(BuildContext context) => BlocBuilder<MovieListCubit, MovieListState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const Expanded(
            child: Center(
              child: const Center(child: CircularProgressIndicator.adaptive()),
            ),
          ),
          loaded: (pagingController) => Expanded(
            child: RefreshIndicator(
              onRefresh: context.read<MovieListCubit>().refresh,
              child: PagedListView.separated(
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<Movie>(
                  noItemsFoundIndicatorBuilder: (context) => const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'No matching titles',
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Try searching for another movie',
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  animateTransitions: true,
                  itemBuilder: (context, item, index) => MovieCard(
                    title: item.title,
                    rating: '${(item.voteAverage * 10).toInt()}%',
                    onTap: () {},
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
              ),
            ),
          ),
        ),
      );
}

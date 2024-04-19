import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/models/movies/movie.dart';
import '../../../../domain/models/movies/movie_query.dart';
import '../../../../domain/use_cases/search_movie_use_case.dart';
import '../../../../domain/utils/enums/sort_by.dart';
import 'movie_list_state.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit(
    this._searchMovieUseCase,
  ) : super(const MovieListState.loading()) {
    init();
  }
  // Search movie use case
  final SearchMovieUseCase _searchMovieUseCase;

  // Paging controller for infinite scroll
  final PagingController<int, Movie> _pagingController = PagingController<int, Movie>(firstPageKey: 1);

  // Query string for search
  String _query = '';

  // Debounce timer for search
  Timer? _debounce;

  // Initialize the cubit
  Future<void> init() async {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey: pageKey);
    });
    emit(
      MovieListState.loaded(
        pagingController: _pagingController,
      ),
    );
  }

  // Fetch movies by page key (pagination)
  Future<void> _fetchPage({
    required int pageKey,
  }) async {
    final query = MovieQuery(
      page: pageKey,
      query: _query,
      // This sortyBy does nothing. Normally, I would use BE query to sort the movies,
      // but for this example, I will sort them in the app,
      // because TMDB API does not support sorting in search query,
      // wich is a big limitation when using infinite scroll pagination.
      // I'm leaving this here as an example of how I would do it,
      // if the API supported it just like /discover endpoints (doesn't break the app
      // and let you see my approach in this kind of tasks).
      sortBy: SortBy.voteAverageDesc,
    );
    final result = await _searchMovieUseCase(query);
    emit(
      result.fold(
        (l) => MovieListState.failure(failure: l),
        (r) {
          final movies = List<Movie>.from(r.results);
          final isLastPage = r.page >= r.totalPages;
          if (isLastPage) {
            _pagingController.appendLastPage(movies);
          } else {
            final nextPageKey = pageKey + 1;
            _pagingController.appendPage(movies, nextPageKey);
          }
          // Sort movies by vote average in descending order (highest first).
          // Normally, I would use BE query to sort the movies.
          // It's important to note that this is not the best practice, to leave this logic in the app.
          _pagingController.itemList?.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
          return MovieListState.loaded(
            pagingController: _pagingController,
          );
        },
      ),
    );
  }

  // Refresh the list
  Future<void> refresh() async {
    emit(MovieListState.loading());
    _pagingController.itemList?.clear();
    await _fetchPage(
      pageKey: 1,
    );
  }

  // Search movies by query string (title)
  Future<void> search(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () async {
      _pagingController.value.itemList?.clear();
      _query = query;

      await _fetchPage(pageKey: 1);
    });
  }
}

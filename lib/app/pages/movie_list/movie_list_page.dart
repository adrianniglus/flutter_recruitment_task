import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/movies/movie.dart';
import 'widgets/movie_card.dart';
import 'widgets/search_box.dart';

@RoutePage()
class MovieListPage extends StatefulWidget {
  @override
  _MovieListPage createState() => _MovieListPage();
}

class _MovieListPage extends State<MovieListPage> {
  Future<List<Movie>> _movieList = Future.value([]);

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
          children: <Widget>[
            SearchBox(onSubmitted: _onSearchBoxSubmitted),
            Expanded(child: _buildContent()),
          ],
        ),
      );

  Widget _buildContent() => FutureBuilder<List<Movie>>(
      future: _movieList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(snapshot.error.toString()),
          );
        } else {
          return _buildMoviesList(snapshot.data ?? []);
        }
      });

  Widget _buildMoviesList(List<Movie> movies) => ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 1.0,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) => MovieCard(
          title: movies[index].title,
          rating: '${(movies[index].voteAverage * 10).toInt()}%',
          onTap: () {},
        ),
        itemCount: movies.length,
      );

  void _onSearchBoxSubmitted(String text) {
    setState(() {
      if (text.isNotEmpty) {
        // Mock data
        _movieList = Future.value([
          Movie(
            title: 'movie 1',
            voteAverage: 0.0,
            id: 1,
          ),
          Movie(
            title: 'movie 2',
            voteAverage: 0.0,
            id: 2,
          ),
          Movie(
            title: 'movie 3',
            voteAverage: 0.0,
            id: 3,
          ),
        ]);
      } else {
        _movieList = Future.value([]);
      }
    });
  }
}

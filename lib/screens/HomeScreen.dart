import 'package:flutter/material.dart';
import 'package:peliculas_curso/providers/moviesProvider.dart';
import 'package:peliculas_curso/search/searchDelegate.dart';
import 'package:peliculas_curso/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines '),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {
              showSearch(context: context, delegate: MovieSearchDelegate());
            }, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
                
              ),
              MovieSlider(
                onNextPage: (){
                  moviesProvider.getPopularMovies();
                },
                movies: moviesProvider.popularMovies,
                title: 'Provider!'
              ),
            ],
          ),
        ));
  }
}

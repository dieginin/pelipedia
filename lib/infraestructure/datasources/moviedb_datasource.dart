import 'package:dio/dio.dart';

import '/config/constants/environment.dart';
import '/config/domain/datasources/movies_datasource.dart';
import '/config/domain/entities/movie.dart';
import '/infraestructure/mappers/movie_mapper.dart';
import '/infraestructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {'api_key': Enviroment.movieDB, 'language': 'es-MX'},
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results.where((element) => element.posterPath != 'no-poster').map((movie) => MovieMapper.movieDBToEntity(movie)).toList();

    return movies;
  }
}

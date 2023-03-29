import '/config/domain/datasources/movies_datasource.dart';
import '/config/domain/entities/movie.dart';
import '/config/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) => datasource.getNowPlaying(page: page);
}

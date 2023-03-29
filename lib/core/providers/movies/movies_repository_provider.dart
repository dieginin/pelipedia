import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/infraestructure/datasources/moviedb_datasource.dart';
import '/infraestructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) => MovieRepositoryImpl(MoviedbDatasource()));

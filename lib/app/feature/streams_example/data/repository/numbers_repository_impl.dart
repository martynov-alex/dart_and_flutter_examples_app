import 'package:dart_and_flutter_examples_app/app/feature/streams_example/data/source/numbers_database.dart';
import 'package:dart_and_flutter_examples_app/app/feature/streams_example/data/source/numbers_database_impl.dart';
import 'package:dart_and_flutter_examples_app/app/feature/streams_example/domain/repository/numbers_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'numbers_repository_impl.g.dart';

@riverpod
class NumbersRepositoryImpl extends _$NumbersRepositoryImpl
    implements NumbersRepository {
  late final NumbersDatabase database = ref.read(NumbersDatabaseImpl.provider);

  @override
  Stream<List<int>> build() {
    return database.watchNumbers();
  }

  @override
  Stream<int> watchLast() {
    return database.watchLast();
  }
}

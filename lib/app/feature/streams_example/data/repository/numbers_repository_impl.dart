import 'package:dart_and_flutter_examples_app/app/feature/streams_example/data/source/numbers_database.dart';
import 'package:dart_and_flutter_examples_app/app/feature/streams_example/data/source/numbers_database_impl.dart';
import 'package:dart_and_flutter_examples_app/app/feature/streams_example/domain/repository/numbers_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'numbers_repository_impl.g.dart';

class NumbersRepositoryImpl implements NumbersRepository {
  final NumbersDatabase database;

  NumbersRepositoryImpl(this.database);

  @override
  Stream<List<int>> watchNumbers() {
    return database.watchNumbers();
  }

  @override
  Stream<int?> watchLastNumber() {
    return database.watchLastNumber();
  }

  @override
  Future<void> addNumber(int number) {
    return database.addNumber(number);
  }

  @override
  Future<void> addNumbers(List<int> numbers) {
    return database.addNumbers(numbers);
  }

  @override
  Future<void> deleteNumbers() {
    return database.deleteNumbers();
  }
}

@riverpod
NumbersRepositoryImpl numbersRepository(NumbersRepositoryRef ref) {
  final database = ref.read(NumbersDatabaseImpl.provider);
  return NumbersRepositoryImpl(database);
}

@riverpod
Stream<List<int>> numbersStream(NumbersStreamRef ref) {
  final repository = ref.watch(numbersRepositoryProvider);
  return repository.watchNumbers();
}

@riverpod
Stream<int?> lastNumbersStream(LastNumbersStreamRef ref) {
  final repository = ref.watch(numbersRepositoryProvider);
  return repository.watchLastNumber();
}

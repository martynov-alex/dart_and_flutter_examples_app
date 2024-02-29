import 'package:dart_and_flutter_examples_app/app/feature/streams_example/data/source/numbers_database_impl.dart';

class NumbersMapper {
  static int fromDto(NumberDto dto) => dto.number;
}

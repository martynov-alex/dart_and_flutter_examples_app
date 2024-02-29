abstract interface class NumbersDatabase {
  Stream<List<int>> watchNumbers();
  Stream<int> watchLast();
}

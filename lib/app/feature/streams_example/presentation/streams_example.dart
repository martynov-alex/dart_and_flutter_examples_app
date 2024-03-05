import 'package:dart_and_flutter_examples_app/app/common/constants/app_sizes.dart';
import 'package:dart_and_flutter_examples_app/app/common/ui/widgets/async_value_widget.dart';
import 'package:dart_and_flutter_examples_app/app/feature/streams_example/data/repository/numbers_repository_impl.dart';
import 'package:dart_and_flutter_examples_app/core/localization/string_hardcoded.dart';
import 'package:dart_and_flutter_examples_app/core/utils/extensions/theme_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamsExampleScreen extends ConsumerWidget {
  const StreamsExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.read(numbersRepositoryProvider);
    final numbersValue = ref.watch(numbersStreamProvider);

    final titleStyle = context.textTheme.titleMedium?.copyWith(
      color: context.colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'.hardcoded),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async => repository.addNumber(1),
              child: Text('Добавить 1'.hardcoded),
            ),
            ElevatedButton(
              onPressed: () async => repository.addNumber(2),
              child: Text('Добавить 2'.hardcoded),
            ),
            ElevatedButton(
              onPressed: () async => repository.addNumber(3),
              child: Text('Добавить 3'.hardcoded),
            ),
            ElevatedButton(
              onPressed: () async => repository.addNumbers([4, 5, 6]),
              child: Text('Добавить 4, 5, 6'.hardcoded),
            ),
            gapH16,
            ElevatedButton(
              onPressed: () async => repository.deleteNumbers(),
              child: Text('Удалить все'.hardcoded),
            ),
            gapH16,
            Text(
              'Поток всех чисел'.hardcoded,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            AsyncValueWidget<List<int>>(
              value: numbersValue,
              data: (numbers) => numbers.isEmpty
                  ? Center(child: Text('Чисел пока нет'.hardcoded))
                  : Text('Числа: $numbers'.hardcoded),
            ),
            gapH16,
            Text(
              'Поток последнего добавленного числа'.hardcoded,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            Consumer(
              builder: (_, ref, __) {
                final lastNumbersValue = ref.watch(lastNumbersStreamProvider);

                return AsyncValueWidget<int?>(
                  value: lastNumbersValue,
                  data: (number) => number == null
                      ? Text('Чисел пока нет'.hardcoded)
                      : Text('Последнее число: $number'.hardcoded),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

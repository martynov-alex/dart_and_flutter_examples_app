import 'package:dart_and_flutter_examples_app/core/assets/app_images.dart';
import 'package:dart_and_flutter_examples_app/core/routing/app_router.dart';
import 'package:dart_and_flutter_examples_app/core/utils/extensions/theme_x.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenScreen extends StatefulWidget {
  const IntroductionScreenScreen({super.key});

  @override
  IntroductionScreenScreenState createState() =>
      IntroductionScreenScreenState();
}

class IntroductionScreenScreenState extends State<IntroductionScreenScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );

  Widget _buildImage(String assetName, [double width = 350]) => Center(
        child: Image.asset(
          assetName,
          width: width,
        ),
      );

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
      imageAlignment: Alignment.topCenter,
      bodyAlignment: Alignment.bottomCenter,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      pages: [
        PageViewModel(
          title: 'Только заголовок',
          body: 'Описание',
          image: _buildImage(AppImages.introductionScreenBuilding),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage(AppImages.introductionScreenBuilding),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
              "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage(AppImages.introductionScreenDesign),
          decoration: pageDecoration,
        ),
      ],
      curve: Curves.fastLinearToSlowEaseIn,

      // ! Декорирование блока с прогрессом онбординга
      // Кнопки "Назад", "Пропустить", "Далее", "Закончить"
      // Показывать ли кнопку "Пропустить"
      // showSkipButton: true,

      // Flex для кнопок в начале и конце.
      // Если 0, то кнопки занимают минимальное пространство
      skipOrBackFlex: 0,
      nextFlex: 0,
      dotsFlex: 2,
      next: Icon(Icons.arrow_forward, color: context.colorScheme.onTertiary),
      done: Text(
        'Закончить',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onTertiary,
        ),
      ),
      doneStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(context.colorScheme.primary),
        shape: WidgetStateProperty.all(
          const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        ),
      ),
      // Колбэки кнопок
      onDone: () => _onIntroEnd(context),
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: context.colorScheme.onSurface,
        activeColor: context.colorScheme.onTertiary,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: context.colorScheme.tertiary.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Экран после онбординга')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pushReplacementNamed(AppRoute.home.name),
          child: const Text('Вернуться к списку примеров'),
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Buscar la comida',
      caption: 'Nostrud excepteur do enim adipisicing.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption:
          'Irure pariatur commodo aute Lorem sit pariatur Lorem aliqua duis do.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption:
          'Quis adipisicing culpa cupidatat mollit qui cillum sunt tempor do enim esse nisi elit voluptate.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageviewController = PageController() = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() => endReached = true);
      }
      //muestra el indice de la pagina actual
      //print('${ pageviewController.page }');
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) =>
                    _Slide(slide.title, slide.caption, slide.imageUrl))
                .toList()),
        Positioned(
          right: 20,
          top: 50,
          child: TextButton(
            child: const Text('Salir'),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        endReached
            ? Positioned(
                bottom: 30,
                right: 20,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(milliseconds: 500),
                  child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Siguiente')),
                ))
            : const SizedBox(),
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(this.title, this.caption, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 20),
          Text(caption, style: captionStyle),
        ],
      ),
    );
  }
}

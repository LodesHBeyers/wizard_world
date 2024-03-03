import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as universal_html;
import 'package:universal_html/parsing.dart' as parser;

class SearchedImage extends ConsumerWidget {
  final String query;

  final double _width;
  final double _height;
  final BoxShape _shape;

  const SearchedImage.circular({
    super.key,
    required this.query,
    required double diameter,
  })  : _height = diameter,
        _width = diameter,
        _shape = BoxShape.circle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: _width,
      height: _height,
      child: ref.watch(searchedImageProvider(query)).when(
            data: (String url) => Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: _shape,
                image: DecorationImage(
                  image: NetworkImage(
                    url,
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            error: (_, __) => const Icon(
              Icons.broken_image,
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}

final AutoDisposeFutureProviderFamily<String, String> searchedImageProvider =
    AutoDisposeFutureProviderFamily<String, String>(
  (
    AutoDisposeFutureProviderRef<String> ref,
    String arg,
  ) async {
    final Response response = await Dio().get(
        "https://www.google.com.ua/search?source=lnms&sa=X&gbv=1&tbm=isch&q=$arg");
    final universal_html.Document document = parser.parseHtmlDocument(
      response.data,
    );
    final universal_html.Element? el = document.querySelector(".DS1iW");
    if (el is! universal_html.ImageElement) {
      throw Exception();
    }
    if (el.src != null) {
      return el.src!;
    } else {
      throw Exception();
    }
  },
);

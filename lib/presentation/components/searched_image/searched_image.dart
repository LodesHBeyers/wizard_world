import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as universal_html;
import 'package:universal_html/parsing.dart' as parser;

class FutureImage extends StatefulWidget {
  final String prompt;

  const FutureImage({
    super.key,
    required this.prompt,
  });

  @override
  State<FutureImage> createState() => _FutureImageState();
}

class _FutureImageState extends State<FutureImage> {
  final String url = "https://www.google.com.ua/";
  Completer<String> completer = Completer<String>();

  @override
  void initState() {
    super.initState();
    fetchimage();
  }

  @override
  void dispose() {
    super.dispose();
    if (!completer.isCompleted) {
      completer.complete("");
    }
  }

  // Backwoods but if it works it works, YOLO
  void fetchimage() async {
    try {
      Dio dio = Dio();

      final Response response = await dio.get(
          "https://www.google.com.ua/search?source=lnms&sa=X&gbv=1&tbm=isch&q=${widget.prompt}");
      final universal_html.Document document = parser.parseHtmlDocument(
        response.data,
      );
      final universal_html.Element? el = document.querySelector(".DS1iW");
      if (el is! universal_html.ImageElement) {
        throw Exception();
      }
      if (el.src != null) {
        completer.complete(
          el.src,
        );
      }
    } catch (e) {
      completer.completeError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: completer.future,
      builder: (_, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return Image.network(
            snapshot.data!,
          );
        }
        return const Center(
          child: Icon(
            Icons.broken_image,
          ),
        );
      },
    );
  }
}

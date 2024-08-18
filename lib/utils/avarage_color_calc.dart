import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_connect/connect.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';

class AvarageColor extends GetConnect {
  AvarageColor._();
  static AvarageColor? _instance;

  static AvarageColor get instance {
    return _instance ??= AvarageColor._();
  }

  Future<Color> getAvarageColor(String imageUrl) async {
    // Resmi indirin ve ByteData olarak alın
    final response = await http.get(Uri.parse(imageUrl));
    final Uint8List bytes = response.bodyBytes;
    final ui.Image image = await _loadImage(Uint8List.view(bytes.buffer));

    // Palet oluşturucu ile baskın renkleri al
    final paletteGenerator = await PaletteGenerator.fromImage(image);

    return paletteGenerator.dominantColor?.color ?? Colors.black;
  }

  Future<ui.Image> _loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }
}

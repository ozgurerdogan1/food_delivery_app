import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class AvarageColor {
  AvarageColor._();
  static AvarageColor? _instance;

  static AvarageColor get instance {
    return _instance ??= AvarageColor._();
  }

  Future<Color> getAvarageColor(String imagePath) async {
    //img.Image? image = img.decodeImage(File(imagePath).readAsBytesSync());
    // Asset'tan resmi yükle
    try {
      final ByteData? data = await rootBundle.load(imagePath);
      final Uint8List? bytes = data?.buffer.asUint8List();

      if (bytes == null) return Colors.white;

      // Resmi decode et
      final img.Image? image = img.decodeImage(Uint8List.fromList(bytes));

      if (image == null) return Colors.white;

      double red = 0;
      double green = 0;
      double blue = 0;
      double count = 0;
      for (int x = 0; x < image.width; x++) {
        for (int y = 0; y < image.height; y++) {
          img.Pixel pixel = image.getPixel(x, y);
          red = red + pixel.r;
          green = green + pixel.g;
          blue = blue + pixel.b;
          count = count + 1;
        }
      }
      int rf = red ~/ count;
      int gf = green ~/ count;
      int bf = blue ~/ count;
      return Color.fromRGBO(rf, gf, bf, 1);
    } on Exception catch (e) {
      debugPrint("avarage error: $e");
      return Colors.black;
    }
  }
}

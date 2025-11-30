import 'dart:developer';

import 'package:image/image.dart' as img;
import 'package:nephroscan/base/assets/assets.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class CtScanModel {
  late Interpreter _interpreter;
  late List<int> _inputShape;
  late List<int> _outputShape;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset(MlModels.ctScanModel);
    _inputShape = _interpreter.getInputTensor(0).shape;
    _outputShape = _interpreter.getOutputTensor(0).shape;

    log("Model loaded.");
    log("Input shape: $_inputShape");
    log("Output shape: $_outputShape");
  }

  List<List<List<List<double>>>> processImage(img.Image image) {
    final resized = img.copyResize(image, width: 28, height: 28);

    List<List<List<List<double>>>> input = [
      List.generate(28, (y) {
        return List.generate(28, (x) {
          final pixel = resized.getPixel(x, y);
          return [pixel.r / 255.0, pixel.g / 255.0, pixel.b / 255.0];
        });
      }),
    ];

    return input;
  }

  List<double> predict(img.Image image) {
    final input = processImage(image);

    List output = List.filled(
      _outputShape.reduce((a, b) => a * b),
      0.0,
    ).reshape(_outputShape);

    _interpreter.run(input, output);

    return List<double>.from(output[0]);
  }
}

import 'package:flutter/material.dart';

/// Provê informações sobre a tela do dispositivo em uso.
class ScreenConfig {
  /// Largura da tela
  static double screenWidth = 0.0;

  /// Altura da tela
  static double screenHeight = 0.0;

  /// Orientação da tela: Retrato ou Paisagem
  static Orientation orientation = Orientation.portrait;

  /// Construtor
  /// Inicializa a classe e seus atributos.
  ScreenConfig(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

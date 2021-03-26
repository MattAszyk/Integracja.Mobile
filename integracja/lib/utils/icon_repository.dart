import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class IconRepository {
  static MdiIconData _getMdiPath(int code) {
    switch (code) {
      case 0:
        return Mdi.alphaACircleOutline;
      case 1:
        return Mdi.alphaBCircleOutline;
      case 2:
        return Mdi.alphaCCircleOutline;
      case 3:
        return Mdi.alphaDCircleOutline;
      case 4:
        return Mdi.alphaECircleOutline;
      case 5:
        return Mdi.alphaFCircleOutline;
      case 6:
        return Mdi.alphaGCircleOutline;
      case 7:
        return Mdi.alphaHCircleOutline;
      case 8:
        return Mdi.alphaICircleOutline;
      case 9:
        return Mdi.alphaJCircleOutline;
      case 10:
        return Mdi.alphaKCircleOutline;
      case 11:
        return Mdi.alphaLCircleOutline;
      case 12:
        return Mdi.alphaMCircleOutline;
      case 13:
        return Mdi.alphaNCircleOutline;
      case 14:
        return Mdi.alphaOCircleOutline;
      case 15:
        return Mdi.alphaPCircleOutline;
      case 16:
        return Mdi.alphaQCircleOutline;
      case 17:
        return Mdi.alphaRCircleOutline;
      case 18:
        return Mdi.alphaSCircleOutline;
      case 19:
        return Mdi.alphaTCircleOutline;
      case 20:
        return Mdi.alphaUCircleOutline;
      case 21:
        return Mdi.alphaVCircleOutline;
      case 22:
        return Mdi.alphaWCircleOutline;
      case 23:
        return Mdi.alphaXCircleOutline;
      case 24:
        return Mdi.alphaYCircleOutline;
      case 25:
        return Mdi.alphaZCircleOutline;
      default:
        return Mdi.circleMedium;
    }
  }

  static Icon getIcon(int code) {
    return Icon(
      _getMdiPath(code),
      color: Colors.orange,
      size: 40,
    );
  }
}

import 'package:easy_mask/easy_mask.dart';

extension FormatString on String {
  String formatString(String mask) {
    final magicMask = MagicMask.buildMask(mask);
    return magicMask.getMaskedString(this);
  }
}

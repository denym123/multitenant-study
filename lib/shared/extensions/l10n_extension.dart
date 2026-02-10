import 'package:flutter/material.dart';

import '../../core/core.dart';

extension L10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

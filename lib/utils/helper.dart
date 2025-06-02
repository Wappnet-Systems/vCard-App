import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:vcard/utils/responsive.dart';
import 'package:vcard/utils/style.dart';
import 'package:vcard/utils/textStyle.dart';

void showCustomLoadingDialog(context, {String? message}) async {
  SimpleFontelicoProgressDialog dialog =
      SimpleFontelicoProgressDialog(context: context);

  dialog.show(
      loadingIndicator: SpinKitCircle(
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? COLOR_WHITE
          : Colors.black,
      width: wp(40, context),
      indicatorColor: Theme.of(context).primaryColor,
      message: message ?? 'Please Wait...',
      textStyle: textMediumTextStyle.copyWith(
          color: Theme.of(context).primaryColorDark),
      radius: 12,
      type: SimpleFontelicoProgressDialogType.custom);
}

Future<void> closeCustomLoadingDialog(context) async {
  SimpleFontelicoProgressDialog dialog =
      SimpleFontelicoProgressDialog(context: context);
  dialog.hide();
}

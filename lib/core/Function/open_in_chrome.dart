import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openInChrome(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);

  try {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'action_view',
        data: uri.toString(),
        package: 'com.android.chrome',
      );
      await intent.launch();
    } else {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        showCustomErrorMessage(context, message: 'تعذر فتح الرابط');
      }
    }
  } catch (e) {
    // fallback لو Chrome مش متوفر
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      showCustomErrorMessage(context, message: 'تعذر فتح الرابط');
    }
  }
}

void showCustomErrorMessage(BuildContext context, {required String message}) {
  showTopSnackBar(Overlay.of(context), CustomSnackBar.error(message: message));
}

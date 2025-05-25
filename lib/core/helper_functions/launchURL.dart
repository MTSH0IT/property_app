import 'package:flutter/material.dart';
import 'package:property_app/core/helper_functions/build_snack_bar_message.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> buildlaunchURL(BuildContext context, String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    buildSnackBarMessage(context, 'Could not launch $url', Colors.red);
  }
}

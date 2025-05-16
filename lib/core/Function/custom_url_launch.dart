import 'package:bookly_app/core/Function/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLaunch(context, String? url) async {
  if (url != null) {
    Uri url0 = Uri.parse(url);
    if (await canLaunchUrl(url0)) {
      await launchUrl(url0);
    } else {
      customSnackBar(context, "cannot launch $url");
    }
  }
}

import 'package:go_router/go_router.dart';

customPushReplacement(context, {required String path}) {
  GoRouter.of(context).pushReplacement(path);
}

import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';

navigate(BuildContext context, dynamic path) {
  return Navigator.push(context,
      PageTransition(child: path, type: PageTransitionType.bottomToTop));
}

popNavigate(BuildContext context) {
  return Navigator.pop(context);
}

import 'package:firebase_analytics/firebase_analytics.dart';

class InoraAnalytics {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> logViewPage(String screenName, String screenClass) async {
    await analytics.logEvent(
      name: 'page_view',
      parameters: {
        'firebase_screen': screenName,
        'firebase_screen_class': screenClass,
      },
    );
  }
}

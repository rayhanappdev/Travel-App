import 'package:url_launcher/url_launcher.dart';

class CallUtils {
  static Future<void> makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      // ইউজারকে মেসেজ দেখানোর জন্য বা এরর হ্যান্ডেল করার জন্য
      print('Could not launch $launchUri');
    }
  }
}
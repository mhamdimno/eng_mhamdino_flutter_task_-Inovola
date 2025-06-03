import 'package:injectable/injectable.dart';
import '../interfaces/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

@Injectable(as: URLLauncher)
class URLLauncherService extends URLLauncher{

  @override
  void launchGoogleMaps(double lat, double lng) async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch Google Maps';
    }
  }

  @override
  void launchWhatsApp(String phone) async {
    final url = Uri.parse('https://wa.me/$phone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  @override
  void openWhatsApp() async {
    final url = Uri.parse('https://wa.me/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

}
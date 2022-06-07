import 'package:url_launcher/url_launcher.dart';

class LauncherManager {
  const LauncherManager._();

  static const _instance = LauncherManager._();

  static LauncherManager get instance => _instance;

  launchDialer(String number) async {
    await launch('tel://$number');
  }

  launchMailer() async {
    await launch(
      'mailto:ra108756@uem.br?subject=Sugestões de melhoria - APP Local DEA',
    );
  }
}

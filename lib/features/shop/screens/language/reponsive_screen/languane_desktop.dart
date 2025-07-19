import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguaneDesktop extends StatelessWidget {
  const LanguaneDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Language',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(32),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Choose your language',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.red),
                    title: const Text('Tiếng Việt'),
                    trailing: currentLocale == 'vi'
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      Get.updateLocale(const Locale('vi'));
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.language, color: Colors.blue),
                    title: const Text('English'),
                    trailing: currentLocale == 'en'
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () {
                      Get.updateLocale(const Locale('en'));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

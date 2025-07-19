import 'package:admin_hmoob_store/features/authentication/controllers/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDesktopScreen extends StatelessWidget {
  const LogoutDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.logout, size: 64, color: Colors.redAccent),
              const SizedBox(height: 24),
              const Text(
                'Are you sure you want to logout?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(160, 48),
                ),
                onPressed: () async {
                  await controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

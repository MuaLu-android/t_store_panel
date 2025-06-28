import 'package:admin_t_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:admin_t_store/common/widgets/layouts/templates/site_layouts.dart';
import 'package:admin_t_store/route/app_routes.dart';
import 'package:admin_t_store/route/route.dart';
import 'package:admin_t_store/utils/constants/sizes.dart';
import 'package:admin_t_store/utils/constants/text_string.dart';
import 'package:admin_t_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialRoute: TRoutes.login,
      getPages: TAppRoute.pages,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => const Scaffold(body: Center(child: Text('Page Not Found'))),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODOimplement build
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Simple Navigation: defaul Flutter Navigation vs Getx Navigation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                child: const Text('Defaul navigation'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const SecondScreen()),
                child: const Text('Getx Navigation'),
              ),
            ),

            // 2
            const SizedBox(height: 50),
            const Divider(),
            const Text(
              'Named navigation: Flutter Navigation vs Getx Navigation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second-screen');
                },
                child: const Text('Defaul navigation'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/second-screen'),
                child: const Text('Getx named Navigation'),
              ),
            ),
            //3
            // 2
            const SizedBox(height: 50),
            const Divider(),
            const Text(
              'Pass Data between screen - Getx',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/second-screen',
                    arguments: 'Get is fun with CWT',
                  );
                },
                child: const Text('Getx Pass Data'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/second-screen/1234'),
                child: const Text('Pass Data in URL'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/second-screen?device=phone&id=354&name=Enzo',
                    arguments: 'Get is fun with CWT',
                  );
                },
                child: const Text('Pass Data in URL with arguments'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(title: Text('SecondScreen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Get.arguments ?? ''),
            Text('Device = ${Get.parameters['device'] ?? ''}'),
            Text('Phone = ${Get.parameters['id'] ?? ''} '),
            Text('Name = ${Get.parameters['name'] ?? ''} '),
            Text('Name = ${Get.parameters['userId'] ?? ''} '),
          ],
        ),
      ),
    );
  }
}

class ResponiveDesignScreen extends StatelessWidget {
  const ResponiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // implement build
    return const TSizeTemplate(
      desktop: Desktop(),
      tablet: Tablet(),
      mobile: Mobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});
  @override
  Widget build(BuildContext context) {
    // implement build
    return Column(
      children: [
        // Firt Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TRoundedContainer(
                height: 450,
                backgroundColor: Colors.blue.withAlpha(100),
                child: const Center(child: Text('BOX 1')),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TRoundedContainer(
                    height: 215,
                    backgroundColor: Colors.grey.withAlpha(100),
                    child: const Center(child: Text('BOX 2')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundColor: Colors.grey.withAlpha(100),
                          child: const Center(child: Text('BOX 3')),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundColor: Colors.greenAccent.withAlpha(100),
                          child: Center(child: Text('BOX 6')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Second row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: TRoundedContainer(
                height: 190,
                backgroundColor: Colors.red.withAlpha(100),
                child: Center(child: Text('BOX 4')),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TRoundedContainer(
                height: 190,
                backgroundColor: Colors.red.withAlpha(100),
                child: Center(child: Text('BOX 5')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});
  @override
  Widget build(BuildContext context) {
    // implement build
    return Column(
      children: [
        // Firt Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TRoundedContainer(
                height: 450,
                backgroundColor: Colors.blue.withAlpha(100),
                child: const Center(child: Text('BOX 1')),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TRoundedContainer(
                    height: 215,
                    backgroundColor: Colors.grey.withAlpha(100),
                    child: const Center(child: Text('BOX 2')),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundColor: Colors.grey.withAlpha(100),
                          child: const Center(child: Text('BOX 3')),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: TRoundedContainer(
                          height: 215,
                          backgroundColor: Colors.greenAccent.withAlpha(100),
                          child: Center(child: Text('BOX 6')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Second row
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                children: [
                  TRoundedContainer(
                    height: 190,
                    width: double.infinity,
                    backgroundColor: Colors.red.withAlpha(100),
                    child: Center(child: Text('BOX 4')),
                  ),
                  const SizedBox(height: 20),
                  TRoundedContainer(
                    height: 190,
                    width: double.infinity,
                    backgroundColor: Colors.red.withAlpha(100),
                    child: Center(child: Text('BOX 5')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});
  @override
  Widget build(BuildContext context) {
    // implement build
    return Column(
      children: [
        TRoundedContainer(
          height: 450,
          width: double.infinity,
          backgroundColor: Colors.blue.withAlpha(100),
          child: const Center(child: Text('BOX 1')),
        ),
        const SizedBox(height: TSizes.lg),
        TRoundedContainer(
          height: 215,
          width: double.infinity,
          backgroundColor: Colors.grey.withAlpha(100),
          child: const Center(child: Text('BOX 2')),
        ),
        const SizedBox(height: 20),
        TRoundedContainer(
          height: 215,
          width: double.infinity,
          backgroundColor: Colors.grey.withAlpha(100),
          child: const Center(child: Text('BOX 3')),
        ),
        const SizedBox(height: 20),
        // Second row
        TRoundedContainer(
          height: 190,
          width: double.infinity,
          backgroundColor: Colors.red.withAlpha(100),
          child: Center(child: Text('BOX 4')),
        ),
        const SizedBox(height: 20),
        TRoundedContainer(
          height: 190,
          width: double.infinity,
          backgroundColor: Colors.red.withAlpha(100),
          child: Center(child: Text('BOX 5')),
        ),
      ],
    );
  }
}

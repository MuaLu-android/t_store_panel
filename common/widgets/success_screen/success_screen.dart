import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_string.dart';
import '../../styles/spacing_style.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.showEmail = true,
  });

  final String image, title, subtitle;
  final VoidCallback onPressed;
  final bool? showEmail;

  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Lottie.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              // Display Lottie animation
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(TTexts.tContinue),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              if (showEmail ?? true)
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(TTexts.resendEmail),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

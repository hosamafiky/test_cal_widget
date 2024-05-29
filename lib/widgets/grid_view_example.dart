import 'package:flutter/material.dart';
import 'package:test_hasibaat_widget/widgets/main_app_card.dart';

class GridViewExample extends StatelessWidget {
  const GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return MainAppCard(
          offset: const Offset(16, 16),
          borderRadius: BorderRadius.circular(8),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/onboarding_illustration.png'),
              const SizedBox(height: 20),
              Text(
                'Title',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color(0xFFED1C24),
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Subtitle',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: const Color(0xFFED1C24),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}

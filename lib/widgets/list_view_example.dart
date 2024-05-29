import 'package:flutter/material.dart';
import 'package:test_hasibaat_widget/widgets/main_app_card.dart';

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: 4,
      itemBuilder: (context, index) {
        return MainAppCard(
          offset: const Offset(16, 16),
          borderRadius: BorderRadius.circular(8),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.asset('assets/images/onboarding_illustration.png', width: 100, height: 100),
              const SizedBox(width: 20),
              Text(
                'Title',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: const Color(0xFFED1C24),
                    ),
              ),
              const SizedBox(width: 8),
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

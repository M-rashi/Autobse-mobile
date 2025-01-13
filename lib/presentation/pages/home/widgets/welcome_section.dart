// widgets/welcome_section.dart
import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  final String userName;

  const WelcomeSection({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Welcome back, $userName ',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const Text(
          '👋',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

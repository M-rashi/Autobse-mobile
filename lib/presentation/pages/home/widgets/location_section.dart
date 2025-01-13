// widgets/location_section.dart
import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  final String location;

  const LocationSection({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.orange, size: 16),
        const SizedBox(width: 4),
        Text(
          location,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

// widgets/services_section.dart
import 'package:flutter/material.dart';
import 'service_item.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our services',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ServiceItem(
              icon: Icons.show_chart,
              label: 'Live Auctions',
            ),
            ServiceItem(
              icon: Icons.calendar_today,
              label: 'Upcoming Auctions',
            ),
            ServiceItem(
              icon: Icons.local_shipping,
              label: 'Sell my truck',
            ),
          ],
        ),
      ],
    );
  }
}

// screens/home_page.dart
import 'package:autobse/domain/providers/home_provider/home_provider.dart';
import 'package:autobse/presentation/pages/home/widgets/advertisement.dart';
import 'package:autobse/presentation/pages/home/widgets/auctions_list.dart';
import 'package:autobse/presentation/pages/home/widgets/bid_summary.dart';
import 'package:autobse/presentation/pages/home/widgets/location_section.dart';
import 'package:autobse/presentation/pages/home/widgets/services_section.dart';
import 'package:autobse/presentation/pages/home/widgets/top_bar.dart';
import 'package:autobse/presentation/pages/home/widgets/welcome_section.dart';
import 'package:autobse/utils/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopBar(),
                const SizedBox(height: 20),
                WelcomeSection(userName: user['name'] ?? 'Guest'),
                LocationSection(location: user['location'] ?? 'Unknown'),
                const SizedBox(height: 20),
                const BidSummary(),
                const SizedBox(height: 30),
                const ServicesSection(),
                const SizedBox(height: 20),
                const SearchBar(),
                const SizedBox(height: 20),
                const AuctionsList(),
                const Advertisement(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

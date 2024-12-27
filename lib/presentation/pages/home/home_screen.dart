import 'package:autobse/domain/providers/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:autobse/utils/widgets/custom_bottom_nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final auctions = ref.watch(auctionsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBar(),
                const SizedBox(height: 20),
                _buildWelcomeSection(user),
                _buildLocationSection(user),
                const SizedBox(height: 20),
                _buildBidSummary(),
                const SizedBox(height: 30),
                _buildServicesSection(),
                const SizedBox(height: 20),
                _buildSearchBar(ref),
                const SizedBox(height: 20),
                _buildAuctionsList(ref, auctions),
                _buildAdvertisement(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.blue),
          onPressed: () {},
        ),
        Text(
          'HOME',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_border, color: Colors.blue),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWelcomeSection(Map<String, dynamic> user) {
    return Row(
      children: [
        Text(
          'Welcome back, ${user['name']} ',
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

  Widget _buildLocationSection(Map<String, dynamic> user) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.orange, size: 16),
        const SizedBox(width: 4),
        Text(
          user['location'] ?? '',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildBidSummary() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Bid Summary',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildServicesSection() {
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
          children: [
            _buildServiceItem(
              icon: Icons.show_chart,
              label: 'Live Auctions',
            ),
            _buildServiceItem(
              icon: Icons.calendar_today,
              label: 'Upcoming Auctions',
            ),
            _buildServiceItem(
              icon: Icons.local_shipping,
              label: 'Sell my truck',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar(WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
                ref.read(auctionsProvider.notifier).searchAuctions(value);
              },
              decoration: InputDecoration(
                hintText: 'Search Auctions',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.tune, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildAuctionsList(WidgetRef ref, List<Auction> auctions) {
    return Column(
      children: auctions
          .map((auction) => Column(
                children: [
                  _buildAuctionCard(ref, auction),
                  const SizedBox(height: 20),
                ],
              ))
          .toList(),
    );
  }

  Widget _buildServiceItem({
    required IconData icon,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.orange,
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAuctionCard(WidgetRef ref, Auction auction) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(
                    ' ${auction.rating} (${(auction.reviews / 1000).toStringAsFixed(1)}k)',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  auction.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: auction.isBookmarked ? Colors.blue : Colors.grey,
                ),
                onPressed: () => ref
                    .read(auctionsProvider.notifier)
                    .toggleBookmark(auction.id),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 150,
            color: Colors.grey[300],
            // Add your truck image here
          ),
          const SizedBox(height: 12),
          Text(
            auction.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.red),
              const SizedBox(width: 4),
              Text(
                '${auction.auctionDate.day} ${_getMonth(auction.auctionDate.month)} ${auction.auctionDate.year} | '
                '${auction.auctionDate.hour}:${auction.auctionDate.minute.toString().padLeft(2, '0')} '
                '${auction.auctionDate.hour >= 12 ? 'PM' : 'AM'}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${(auction.price / 100000).toStringAsFixed(2)} Lakh',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Bid now'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdvertisement() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'AD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String _getMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

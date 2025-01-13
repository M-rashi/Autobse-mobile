// widgets/auction_card.dart
import 'package:autobse/domain/providers/home_provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuctionCard extends ConsumerWidget {
  final Auction auction;

  const AuctionCard({
    Key? key,
    required this.auction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(ref),
          const SizedBox(height: 12),
          _buildImage(),
          const SizedBox(height: 12),
          _buildTitle(),
          const SizedBox(height: 4),
          _buildDateTime(),
          const SizedBox(height: 8),
          _buildPriceAndButton(),
        ],
      ),
    );
  }

  Widget _buildHeader(WidgetRef ref) {
    return Row(
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
          onPressed: () =>
              ref.read(auctionsProvider.notifier).toggleBookmark(auction.id),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      height: 150,
      color: Colors.grey[300],
      // Add your truck image here
    );
  }

  Widget _buildTitle() {
    return Text(
      auction.title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDateTime() {
    return Row(
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
    );
  }

  Widget _buildPriceAndButton() {
    return Row(
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

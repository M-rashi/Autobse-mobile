// home_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Models
class Auction {
  final String id;
  final String title;
  final double rating;
  final int reviews;
  final String imageUrl;
  final DateTime auctionDate;
  final double price;
  final bool isBookmarked;

  Auction({
    required this.id,
    required this.title,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.auctionDate,
    required this.price,
    this.isBookmarked = false,
  });

  Auction copyWith({bool? isBookmarked}) {
    return Auction(
      id: id,
      title: title,
      rating: rating,
      reviews: reviews,
      imageUrl: imageUrl,
      auctionDate: auctionDate,
      price: price,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}

// State Notifier
class AuctionsNotifier extends StateNotifier<List<Auction>> {
  AuctionsNotifier()
      : super([
          Auction(
            id: '1',
            title: 'Ashok Leyland Truck',
            rating: 4.8,
            reviews: 12800,
            imageUrl: 'assets/truck_image.png',
            auctionDate: DateTime(2024, 9, 27, 12, 0),
            price: 2000000,
          ),
          // Add more auctions as needed
        ]);

  void toggleBookmark(String auctionId) {
    state = state.map((auction) {
      if (auction.id == auctionId) {
        return auction.copyWith(isBookmarked: !auction.isBookmarked);
      }
      return auction;
    }).toList();
  }

  void searchAuctions(String query) {
    if (query.isEmpty) return;
    // Implement seach logic here
  }
}

// Providers
final userProvider =
    StateProvider((ref) => {'name': 'Shibu', 'location': 'Trivandrum'});

final searchQueryProvider = StateProvider((ref) => '');

final auctionsProvider =
    StateNotifierProvider<AuctionsNotifier, List<Auction>>((ref) {
  return AuctionsNotifier();
});

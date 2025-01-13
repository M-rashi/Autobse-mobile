import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuctionModel {
  final String title;
  final String location;
  final int vehicleCount;
  final String startDate;
  final String endDate;

  AuctionModel({
    required this.title,
    required this.location,
    required this.vehicleCount,
    required this.startDate,
    required this.endDate,
  });
}

final upcomingauctionsProvider = Provider<List<AuctionModel>>((ref) {
  return [
    AuctionModel(
      title: 'ASHOK LEYLAND TRUCK',
      location: 'Trivandrum',
      vehicleCount: 100,
      startDate: '25 Sept 2024 | 12:00 PM',
      endDate: '25 Sept 2024 | 12:00 PM',
    ),
    AuctionModel(
      title: 'ASHOK LEYLAND TRUCK',
      location: 'Trivandrum',
      vehicleCount: 100,
      startDate: '25 Sept 2024 | 12:00 PM',
      endDate: '25 Sept 2024 | 12:00 PM',
    ),
    // Add more auctions as needed
  ];
});

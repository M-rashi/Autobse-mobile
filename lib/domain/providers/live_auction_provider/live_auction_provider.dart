import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuctionItem {
  final String vehicleType;
  final String location;
  final String vehicleNumber;
  final DateTime auctionDate;

  AuctionItem({
    required this.vehicleType,
    required this.location,
    required this.vehicleNumber,
    required this.auctionDate,
  });
}

final liveauctionsProvider = StateProvider<List<AuctionItem>>((ref) {
  // Sample data - replace with your actual data source
  return [
    AuctionItem(
      vehicleType: 'ASHOK LEYLAND TRUCK',
      location: 'Trivandrum',
      vehicleNumber: '100',
      auctionDate: DateTime(2024, 9, 25, 12, 0),
    ),
    AuctionItem(
      vehicleType: 'ASHOK LEYLAND TRUCK',
      location: 'Trivandrum',
      vehicleNumber: '100',
      auctionDate: DateTime(2024, 9, 25, 12, 0),
    ),
    AuctionItem(
      vehicleType: 'ASHOK LEYLAND TRUCK',
      location: 'Trivandrum',
      vehicleNumber: '100',
      auctionDate: DateTime(2024, 9, 25, 12, 0),
    ),
  ];
});

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/travel_spot.dart';
import 'login_screen.dart';

class DetailsScreen extends StatelessWidget {
  final TravelSpot spot;
  const DetailsScreen({super.key, required this.spot});

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(spot.bookingUrl))) {
      throw Exception('Could not launch ${spot.bookingUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(spot.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(spot.imageUrl),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(spot.story, style: const TextStyle(fontSize: 16)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // Navigator use kore login screen-e niye jaoa
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              icon: const Icon(Icons.confirmation_number),
              label: const Text('টিকিট বুক করুন'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
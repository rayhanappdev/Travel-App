// lib/travel_spot.dart file format logic management: data update
class TravelSpot {
  final String name;
  final String imageUrl;
  final String description;
  final String story;
  final String bookingUrl;
  final String category; // Category dynamic field support logic update
  final String? guidePhone;
  TravelSpot({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.story,
    required this.bookingUrl,
    required this.category,
    this.guidePhone,
  });
}

List<TravelSpot> spots = [
  TravelSpot(
    name: "সুন্দরবন",
    category: "বন",
    imageUrl: "https://images.unsplash.com/...",
    story: "সুন্দরবন হলো বিশ্বের বৃহত্তম ম্যানগ্রোভ বন...",
    bookingUrl: "https://www.shohoz.com",
    description: "কিছু একটা বর্ণনা",
    guidePhone: "017XXXXXXXX",
  ),
];
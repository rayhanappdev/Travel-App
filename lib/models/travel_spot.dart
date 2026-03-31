// lib/travel_spot.dart file format logic management: data update
class TravelSpot {
  final String name;
  final String imageUrl;
  final String description;
  final String story;
  final String bookingUrl;
  final String category; // Category dynamic field support logic update

  TravelSpot({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.story,
    required this.bookingUrl,
    required this.category,
  });
}

List<TravelSpot> spots = [
  TravelSpot(
    name: "সুন্দরবন",
    category: "বন",
    imageUrl: "https://images.unsplash.com/photo-1591129841117-3adfd313e34f",
    story: "সুন্দরবন হলো বিশ্বের বৃহত্তম ম্যানগ্রোভ বন এবং ইউনেস্কো ওয়ার্ল্ড হেরিটেজ সাইট।",
    bookingUrl: "https://www.shohoz.com", description: '',
  ),
  // Baki spots gulo thik eivabe 5-ti field diye add korun
];
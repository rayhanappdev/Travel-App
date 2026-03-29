import 'package:flutter/material.dart';
import '../models/travel_spot.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'সব';
  final List<String> categories = ['সব', 'সমুদ্র', 'পাহাড়', 'বন', 'ঐতিহাসিক'];

  final List<TravelSpot> allSpots = [
    TravelSpot(
      name: "কক্সবাজার",
      category: "সমুদ্র",
      imageUrl: "https://images.unsplash.com/photo-1582650625119-3a31f8fa2699?q=80&w=1000&auto=format&fit=crop",
      story: "বিশ্বের দীর্ঘতম সমুদ্র সৈকত। নীল জলরাশি আর বিশাল ঢেউয়ের গর্জন পর্যটকদের মন ভরিয়ে দেয়।",
      bookingUrl: "https://www.shohoz.com",
    ),
    TravelSpot(
      name: "সাজেক",
      category: "পাহাড়",
      imageUrl: "https://images.unsplash.com/photo-1623492701902-47dc207df5dc?q=80&w=1000&auto=format&fit=crop",
      story: "মেঘের রাজ্য সাজেক ভ্যালি। পাহাড়ের চূড়ায় হাত বাড়ালেই মেঘ ছুঁতে পারবেন।",
      bookingUrl: "https://www.busbd.com.bd",
    ),
    TravelSpot(
      name: "সিলেট - জাফলং",
      category: "পাহাড়",
      imageUrl: "https://images.unsplash.com/photo-1628153472605-24d14b149b1a?q=80&w=1000&auto=format&fit=crop",
      story: "পাহাড়ের পাদদেশে স্বচ্ছ নীল পানির ডাউকি নদী আর পাথরের কোয়ারি এক অসাধারণ দৃশ্য।",
      bookingUrl: "https://www.greenline.com.bd",
    ),
    TravelSpot(
      name: "সুন্দরবন",
      category: "বন",
      imageUrl: "https://images.unsplash.com/photo-1591129841117-3adfd313e34f?q=80&w=1000&auto=format&fit=crop",
      story: "বিশ্বের বৃহত্তম ম্যানগ্রোভ বন। এখানকার রয়েল বেঙ্গল টাইগার এবং গোলপাতা বিখ্যাত।",
      bookingUrl: "https://www.shohoz.com",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // ফিল্টার লজিক
    List<TravelSpot> displaySpots = selectedCategory == 'সব'
        ? allSpots
        : allSpots.where((s) => s.category == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('ভ্রমণ গাইড', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          // ১. ক্যাটাগরি ফিল্টার
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: selectedCategory == cat,
                    selectedColor: Colors.teal,
                    labelStyle: TextStyle(
                      color: selectedCategory == cat ? Colors.white : Colors.black,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = cat;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // ২. মেইন লিস্ট (Vertical Scroll)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: displaySpots.length,
              itemBuilder: (context, index) {
                final spot = displaySpots[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsScreen(spot: spot)),
                  ),
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15)),
                          child: Image.network(
                            spot.imageUrl,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(
                                height: 180, child: Icon(Icons.broken_image)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    spot.name,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    spot.category,
                                    style: TextStyle(
                                        color: Colors.teal[700],
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} //HomeScreenState ক্লাস এখানে শেষ
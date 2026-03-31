import 'package:flutter/material.dart';
import '../models/travel_spot.dart';
import 'admin_dashboard.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'সব';
  final List<String> categories = ['সব', 'সমুদ্র', 'পাহাড়', 'বন', 'ঐতিহাসিক'];

  late List<TravelSpot> allSpots = [
    TravelSpot(
      name: "সুন্দরবন",
      category: "বন",
      imageUrl: "https://images.unsplash.com/photo-1591129841117-3adfd313e34f?q=80&w=1000&auto=format&fit=crop",
      story: "সুন্দরবন হলো বিশ্বের বৃহত্তম ম্যানগ্রোভ বন এবং ইউনেস্কো ওয়ার্ল্ড হেরিটেজ সাইট। এটি রয়েল বেঙ্গল টাইগারের প্রধান আবাসস্থল। এখানকার প্রাকৃতিক সৌন্দর্য, গোলপাতা বাগান এবং বনের ভেতর দিয়ে বয়ে যাওয়া নদীগুলো পর্যটকদের মুগ্ধ করে। আপনি যদি রোমাঞ্চ পছন্দ করেন, তবে সুন্দরবনের গহীনে ট্রলারে ভ্রমণ আপনার জন্য এক অনন্য অভিজ্ঞতা হবে।",
      bookingUrl: "https://www.shoboj.com", description: '',
    ),
    TravelSpot(
      name: 'সেন্ট মার্টিন',
      category: "সমুদ্র সৈকত",
      imageUrl: 'https://images.unsplash.com/photo-1589982840479-78836ec4644e',
      story: 'সেন্ট মার্টিন হলো বাংলাদেশের একমাত্র প্রবাল দ্বীপ। নারিকেল গাছ, নীল পানি আর পাথুরে সৈকত এই দ্বীপের প্রধান আকর্ষণ। রাতে দ্বীপের শান্ত পরিবেশ এবং সমুদ্রের গর্জন আপনাকে এক অন্য জগতে নিয়ে যাবে। এখানে আপনি স্বচ্ছ পানিতে সামুদ্রিক মাছ এবং প্রবাল দেখতে পাবেন। শীতকালে এখানে ভ্রমণের সবচেয়ে উপযুক্ত সময়।',
      bookingUrl: 'https://www.travelbd.com/saint-martin', description: '',
    ),
    TravelSpot(
      name: 'সিলেট রাতারগুল',
      category: "জলাবন",
      imageUrl: 'https://images.unsplash.com/photo-1590603740183-980e7f98e1ca',
      story: 'রাতারগুল সোয়াম্প ফরেস্ট হলো বাংলাদেশের একমাত্র স্বাদুপানির জলাবন। বৃষ্টির দিনে এই বনের অর্ধেক অংশ পানিতে ডুবে থাকে, যা দেখতে অনেকটা আমাজন বনের মতো লাগে। ছোট ছোট নৌকায় করে বনের ভেতর দিয়ে ঘুরে বেড়ানো যায়। বনের শান্ত প্রকৃতি এবং হিজল-করচ গাছের সারি পর্যটকদের দারুণভাবে টানে।',
      bookingUrl: 'https://www.travelbd.com/ratargul', description: '',
    ),
    TravelSpot(
      name: 'সাজেক ভ্যালি',
      category: "পাহাড়",
      imageUrl: 'https://images.unsplash.com/photo-1624026676760-53603403ac94',
      story: 'সাজেক ভ্যালিকে বলা হয় মেঘের রাজ্য। খাগড়াছড়ি জেলা থেকে অনেক উঁচুতে অবস্থিত এই উপত্যকা থেকে চারপাশে শুধু পাহাড় আর মেঘের খেলা দেখা যায়। সকালে ঘুম থেকে উঠে ঘরের জানালা দিয়ে মেঘের ভেলা দেখা এক অসাধারণ অনুভূতি। এখানকার কংলাক পাহাড় এবং পাহাড়ি জীবনযাত্রা আপনার মন জয় করে নেবে।',
      bookingUrl: 'https://www.travelbd.com/sajek', description: '',
    ),
    TravelSpot(
      name: 'জাফলং',
      category: "ঝর্ণা ও নদী",
      imageUrl: 'https://images.unsplash.com/photo-1596483572314-bc4870f77977',
      story: 'জাফলং প্রকৃতির এক অপূর্ব লীলাভূমি। খাসিয়া জৈন্তা পাহাড়ের পাদদেশে অবস্থিত জাফলং পিয়াইন নদীর তীরে পাথরের স্তূপের জন্য বিখ্যাত। ওপার থেকে নেমে আসা বিশাল ঝর্ণা আর নদীর স্বচ্ছ নীল পানি পর্যটকদের প্রধান আকর্ষণ। পাহাড়ের গায়ে চা বাগান আর মেঘের লুকোচুরি এখানে এক মনোমুগ্ধকর পরিবেশ তৈরি করে।',
      bookingUrl: 'https://www.travelbd.com/jaflong', description: '',
    ),
    TravelSpot(
      name: "বান্দরবান নীলগিরি",
      category: "পাহাড়",
      imageUrl: "https://images.unsplash.com/photo-1623945359620-136159f899e1?q=80&w=1000&auto=format&fit=crop",
      story: "নীলগিরি হলো বাংলাদেশের অন্যতম উঁচু একটি পর্যটন কেন্দ্র। এটি বান্দরবান জেলায় অবস্থিত এবং সেনাবাহিনী দ্বারা পরিচালিত। এখান থেকে মেঘের উপরিভাগ দেখা যায়, যা আপনাকে হিমালয়ের মতো অনুভূতি দেবে। সূর্যোদয় এবং সূর্যাস্তের সময় নীলগিরির রূপ অতুলনীয় হয়ে ওঠে। চারপাশের পাহাড়ের সারি এবং পাহাড়ি জনপদ এখান থেকে খুব সুন্দর দেখায়।",
      bookingUrl: "https://www.travelbd.com/nilgiri", description: '',
    ),

    TravelSpot(
      name: "কক্সবাজার সমুদ্র সৈকত",
      category: "সমুদ্র সৈকত",
      imageUrl: "https://images.unsplash.com/photo-1581441363689-1f3c3c414635?q=80&w=1000&auto=format&fit=crop",
      story: "কক্সবাজার হলো বিশ্বের দীর্ঘতম প্রাকৃতিক বালুকাময় সমুদ্র সৈকত। ১২০ কিলোমিটার দীর্ঘ এই সৈকত পর্যটকদের কাছে সবচেয়ে জনপ্রিয়। সমুদ্রের নীল ঢেউ আর ঝাউবনের সারি এখানে এক অনন্য প্রাকৃতিক পরিবেশ তৈরি করে। এখানে ইনানী বীচ এবং হিমছড়ির মতো আরও অনেক সুন্দর জায়গা রয়েছে। লাবণী পয়েন্ট এবং সুগন্ধা বীচে পর্যটকদের ভিড় সবসময় বেশি থাকে।",
      bookingUrl: "https://www.travelbd.com/coxsbazar", description: '',
    ),

    TravelSpot(
      name: "রাঙামাটি কাপ্তাই লেক",
      category: "লেক ও পাহাড়",
      imageUrl: "https://images.unsplash.com/photo-1614264259881-2826a8775f0a?q=80&w=1000&auto=format&fit=crop",
      story: "কাপ্তাই লেক হলো এশিয়ার বৃহত্তম কৃত্রিম হ্রদ। পাহাড়ের বুক চিরে বয়ে যাওয়া এই লেকের স্বচ্ছ পানি এবং চারপাশের সবুজ প্রকৃতি আপনাকে মুগ্ধ করবে। এখানে ঝুলন্ত সেতু, রাজবন বিহার এবং শুভলং ঝর্ণা দেখার মতো জায়গা। নৌকায় করে লেকের নীল জলরাশির ওপর দিয়ে ঘুরে বেড়ানো এক দারুণ প্রশান্তির অভিজ্ঞতা।",
      bookingUrl: "https://www.travelbd.com/kaptai", description: '',
    ),

    TravelSpot(
      name: "বিছনাকান্দি",
      category: "ঝর্ণা ও পাহাড়",
      imageUrl: "https://images.unsplash.com/photo-1590603740183-980e7f98e1ca?q=80&w=1000&auto=format&fit=crop",
      story: "বিছনাকান্দি হলো সিলেটের গোয়াইনঘাট উপজেলায় অবস্থিত একটি স্বর্গীয় স্থান। পাহাড়ের বুক চিরে নেমে আসা ঝর্ণার পানি আর নদীর নিচের পাথরের বিছানা দেখে মনে হবে যেন কোনো শিল্পীর আঁকা ছবি। ওপারে ভারতের পাহাড়ের ওপর মেঘের আনাগোনা এবং এপারের পাথুরে নদীর মিলনস্থল পর্যটকদের প্রধান আকর্ষণ। বর্ষাকালে বিছনাকান্দির রূপ পূর্ণতা পায়।",
      bookingUrl: "https://www.travelbd.com/bisnakandi", description: '',
    ),

    TravelSpot(
      name: "কুয়াকাটা",
      category: "সমুদ্র সৈকত",
      imageUrl: "https://images.unsplash.com/photo-1616447820121-665207869632?q=80&w=1000&auto=format&fit=crop",
      story: "কুয়াকাটা হলো সাগরকন্যা হিসেবে পরিচিত বাংলাদেশের দক্ষিণ-পশ্চিম অঞ্চলের এক অপূর্ব সমুদ্র সৈকত। এটি বিশ্বের অন্যতম বিরল সৈকত যেখান থেকে একই সাথে সূর্যোদয় এবং সূর্যাস্ত দেখা যায়। এখানকার শুঁটকি পল্লী, রাখাইন পল্লি এবং গঙ্গামতির জঙ্গল পর্যটকদের কাছে খুব প্রিয়। শান্ত ও স্নিগ্ধ পরিবেশের জন্য কুয়াকাটা পর্যটকদের পছন্দের তালিকায় উপরে থাকে।",
      bookingUrl: "https://www.travelbd.com/kuakata", description: '',
    ),

    TravelSpot(
      name: "তারেক ঘাট (নিকলী হাওর)",
      category: "হাওর",
      imageUrl: "https://images.unsplash.com/photo-1589408643171-89a19c676f6f?q=80&w=1000&auto=format&fit=crop",
      story: "কিশোরগঞ্জের নিকলী হাওর হলো বর্ষাকালের সেরা ঘোরার জায়গা। মাইলের পর মাইল বিস্তৃত জলরাশি আর মাঝেমধ্যে ভেসে থাকা ছোট ছোট গ্রামগুলো দেখতে অনেকটা দ্বীপের মতো লাগে। বিশেষ করে তারেক ঘাট থেকে যখন হাওরের দিগন্ত দেখা যায়, তখন মনে হয় আকাশ আর পানি এক হয়ে গেছে। নৌকায় রাত কাটানো এবং তাজা হাওরের মাছ খাওয়া পর্যটকদের জন্য এক দারুণ অভিজ্ঞতা।",
      bookingUrl: "https://www.travelbd.com/nikli", description: '',
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
      // এই অংশটুকু Scaffold-এর ভেতরে body এর নিচে বসবে
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.admin_panel_settings, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminDashboard(
                currentSpots: allSpots, // আপনার ফাইলের ওই 'allSpots' লিস্টটি
                onSpotsUpdated: (updatedList) {
                  setState(() {
                    allSpots = updatedList; // ড্যাশবোর্ডে ডিলিট/অ্যাড করলে এখানে আপডেট হবে
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
} //HomeScreenState ক্লাস এখানে শেষ
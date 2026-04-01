import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/travel_spot.dart';
// এখানে your_app_name এর জায়গায় তোমার আসল প্রজেক্টের নাম বসাবে
import 'package:url_launcher/url_launcher.dart';

class AdminDashboard extends StatefulWidget {
  final List<TravelSpot> currentSpots;
  final ValueChanged<List<TravelSpot>> onSpotsUpdated;

  const AdminDashboard({
    super.key,
    required this.currentSpots,
    required this.onSpotsUpdated,
  });

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late List<TravelSpot> editableSpots;
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    editableSpots = List.from(widget.currentSpots);
  }

  // কল করার ফাংশন (সরাসরি এখানেই রেখে দিলাম সুবিধার জন্য)
  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  void _showAddSpotDialog() {
    String name = '';
    String description = '';
    String guidePhone = ''; // নতুন ভ্যারিয়েবল
    _pickedImage = null;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text("Add New Travel Spot"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: "Spot Name"),
                    onChanged: (value) => name = value,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: "Description"),
                    onChanged: (value) => description = value,
                  ),
                  // --- নতুন ফোন নম্বর ইনপুট ---
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Guide Phone Number",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => guidePhone = value,
                  ),
                  const SizedBox(height: 20),
                  _pickedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(_pickedImage!,
                        height: 100, width: 100, fit: BoxFit.cover),
                  )
                      : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.image, size: 50),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      await _pickImage();
                      setDialogState(() {});
                    },
                    icon: const Icon(Icons.add_a_photo),
                    label: const Text("Select Image"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              ElevatedButton(
                onPressed: () {
                  if (name.isNotEmpty) {
                    setState(() {
                      editableSpots.add(TravelSpot(
                        name: name,
                        description: description,
                        imageUrl: _pickedImage?.path ?? "",
                        category: "Uncategorized",
                        guidePhone: guidePhone, // মডেল-এ পাস করা হচ্ছে
                        story: "",
                        bookingUrl: "",
                      ));
                    });
                    widget.onSpotsUpdated(editableSpots);
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add"),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: Colors.amber[800],
      ),
      body: ListView.builder(
        itemCount: editableSpots.length,
        itemBuilder: (context, index) {
          final spot = editableSpots[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: spot.imageUrl!.startsWith('http')
                    ? Image.network(spot.imageUrl!,
                    width: 50, height: 50, fit: BoxFit.cover)
                    : Image.file(File(spot.imageUrl!),
                    width: 50, height: 50, fit: BoxFit.cover),
              ),
              title: Text(spot.name ?? ""),
              // ট্রেইলিং সেকশনে ডিলিট এবং কল বাটন
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (spot.guidePhone != null && spot.guidePhone!.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.call, color: Colors.green),
                      onPressed: () => _makeCall(spot.guidePhone!),
                    ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        editableSpots.removeAt(index);
                      });
                      widget.onSpotsUpdated(editableSpots);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddSpotDialog,
        backgroundColor: Colors.amber[800],
        child: const Icon(Icons.add),
      ),
    );
  }
}
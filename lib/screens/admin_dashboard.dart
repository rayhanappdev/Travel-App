import 'package:flutter/material.dart';
import '../travel_spot.dart'; // Nishchit hoye nin path-ti thik ache kina

class AdminDashboard extends StatefulWidget {
  final List<TravelSpot> currentSpots;
  final Function(List<TravelSpot>) onSpotsUpdated;

  const AdminDashboard({
    super.key, // Latest Flutter syntax
    required this.currentSpots,
    required this.onSpotsUpdated,
  });

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late List<TravelSpot> editableSpots;

  @override
  void initState() {
    super.initState();
    // Widget theke data editable list-e copy kora
    editableSpots = List.from(widget.currentSpots);
  }

  // Spot Update korar logic
  void _updateSpot(int index, TravelSpot updatedSpot) {
    setState(() {
      editableSpots[index] = updatedSpot;
    });
    widget.onSpotsUpdated(editableSpots);
  }

  // Spot Delete korar logic
  void _deleteSpot(int index) {
    setState(() {
      editableSpots.removeAt(index);
    });
    widget.onSpotsUpdated(editableSpots);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: editableSpots.length,
        itemBuilder: (context, index) {
          final spot = editableSpots[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(spot.imageUrl, width: 50, fit: BoxFit.cover),
              title: Text(spot.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(spot.category),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _showEditDialog(context, index, spot),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteSpot(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Edit Dialog Box
  void _showEditDialog(BuildContext context, int index, TravelSpot spot) {
    final nameController = TextEditingController(text: spot.name);
    final categoryController = TextEditingController(text: spot.category);
    final imageController = TextEditingController(text: spot.imageUrl);
    final storyController = TextEditingController(text: spot.story);
    final bookingController = TextEditingController(text: spot.bookingUrl);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit: ${spot.name}"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: const InputDecoration(labelText: "নাম")),
              TextField(controller: categoryController, decoration: const InputDecoration(labelText: "ক্যাটেগরি")),
              TextField(controller: imageController, decoration: const InputDecoration(labelText: "ইমেজ লিঙ্ক")),
              TextField(controller: storyController, decoration: const InputDecoration(labelText: "গল্প"), maxLines: 3),
              TextField(controller: bookingController, decoration: const InputDecoration(labelText: "বুকিং লিঙ্ক")),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              final updatedSpot = TravelSpot(
                name: nameController.text,
                category: categoryController.text,
                imageUrl: imageController.text,
                story: storyController.text,
                bookingUrl: bookingController.text,
              );
              _updateSpot(index, updatedSpot);
              Navigator.pop(context);
            },
            child: const Text("Update"),
          ),
        ],
      ),
    );
  }
}
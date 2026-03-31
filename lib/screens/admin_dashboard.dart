import 'package:flutter/material.dart';
import '../models/travel_spot.dart';
import '../travel_spot.dart';

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

  @override
  void initState() {
    super.initState();
    // Safe initialization
    editableSpots = List.from(widget.currentSpots);
  }

  // Notun Spot Add korar Dialog
  void _showAddSpotDialog() {
    String name = '';
    String description = '';
    String imageUrl = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Travel Spot", style: TextStyle(fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Spot Name", border: OutlineInputBorder()),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: "Description", border: OutlineInputBorder()),
                maxLines: 3,
                onChanged: (value) => description = value,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: "Image URL", border: OutlineInputBorder()),
                onChanged: (value) => imageUrl = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[800]),
            onPressed: () {
              if (name.isNotEmpty) {
                setState(() {
                  editableSpots.add(TravelSpot(
                    name: name,
                    description: description,
                    imageUrl: imageUrl,
                    story: '',      // Model-e 'story' dorkar, tai khali string dilam
                    bookingUrl: '', // Model-e 'bookingUrl' dorkar
                    category: '',   // Model-e 'category' dorkar
                  ));
                });
                widget.onSpotsUpdated(editableSpots);
                Navigator.pop(context);
              }
            },
            child: const Text("Add Spot", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Admin Dashboard", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.amber[800],
        elevation: 4,
        centerTitle: true,
      ),
      body: editableSpots.isEmpty
          ? const Center(child: Text("No spots found. Click + to add some!"))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: editableSpots.length,
        itemBuilder: (context, index) {
          final spot = editableSpots[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  // ERROR FIX: Null check added here
                  (spot.imageUrl != null && spot.imageUrl!.isNotEmpty)
                      ? spot.imageUrl!
                      : 'https://via.placeholder.com/150',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(width: 70, height: 70, color: Colors.grey[300], child: const Icon(Icons.broken_image)),
                ),
              ),
              // ERROR FIX: spot.name and description safety
              title: Text(
                spot.name ?? "Unnamed Spot",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  spot.description ?? "No description provided.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blueAccent),
                    onPressed: () {
                      // Edit logic can go here
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
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
        backgroundColor: Colors.amber[800],
        onPressed: _showAddSpotDialog,
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
    );
  }
}
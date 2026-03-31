import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Image Picker import
import '../models/travel_spot.dart';

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
  File? _pickedImage; // Select kora image store korbe

  @override
  void initState() {
    super.initState();
    editableSpots = List.from(widget.currentSpots);
  }

  // Gallery theke image select korar function
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
    _pickedImage = null; // Dialog open hole image reset hobe

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder( // Dialog-er bhetore setState kaj korar jonno
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
                  const SizedBox(height: 20),

                  // Image Preview
                  _pickedImage != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(_pickedImage!, height: 100, width: 100, fit: BoxFit.cover),
                  )
                      : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.image, size: 50),
                  ),

                  TextButton.icon(
                    onPressed: () async {
                      await _pickImage();
                      setDialogState(() {}); // Dialog-er preview update korbe
                    },
                    icon: const Icon(Icons.add_a_photo),
                    label: const Text("Select Image"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
              ElevatedButton(
                onPressed: () {
                  if (name.isNotEmpty) {
                    setState(() {
                      editableSpots.add(TravelSpot(
                        name: name,
                        description: description,
                        // Ekhane imageUrl-er jaygay image path-ti pathano hochche
                        imageUrl: _pickedImage?.path ?? "",
                        category: "Uncategorized",
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
      appBar: AppBar(title: const Text("Admin Dashboard"), backgroundColor: Colors.amber[800]),
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
                    ? Image.network(spot.imageUrl!, width: 50, height: 50, fit: BoxFit.cover)
                    : Image.file(File(spot.imageUrl!), width: 50, height: 50, fit: BoxFit.cover),
              ),
              title: Text(spot.name ?? ""),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    editableSpots.removeAt(index);
                  });
                  widget.onSpotsUpdated(editableSpots);
                },
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
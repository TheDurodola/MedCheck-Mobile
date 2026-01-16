import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  // Callback function to send the file back to the parent (Registration Page)
  final void Function(File pickedImage) onImagePicked;

  const ProfileImagePicker({super.key, required this.onImagePicked});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _pickedImageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();

    final pickedImage = await picker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage == null) return;

    setState(() {
      _pickedImageFile = File(pickedImage.path);
    });


    widget.onImagePicked(_pickedImageFile!);
  }


  void _showPickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(ctx).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.of(ctx).pop();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: _pickedImageFile != null
                  ? FileImage(_pickedImageFile!)
                  : null,
              child: _pickedImageFile == null
                  ? const Icon(Icons.person, size: 50, color: Colors.grey)
                  : null,
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: _showPickerOptions,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),

        TextButton.icon(
          onPressed: _showPickerOptions,
          icon: const Icon(Icons.image),
          label: const Text('Add Profile Picture'),
        )
      ],
    );
  }
}
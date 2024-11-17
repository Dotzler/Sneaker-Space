import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReviewView extends StatefulWidget {
  final Map<String, dynamic> item;

  const ReviewView({Key? key, required this.item}) : super(key: key);

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  final TextEditingController _reviewController = TextEditingController();
  final List<File> _mediaFiles = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _addMedia(bool isVideo) async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        _mediaFiles.add(File(pickedFile.path));
      });
    }
  }

  void _submitReview() {
    final reviewText = _reviewController.text;

    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon isi ulasan Anda')),
      );
      return;
    }

    // Simpan ulasan atau kirim ke server (implementasi tergantung backend)
    print('Ulasan: $reviewText');
    print('Media files: ${_mediaFiles.length}');

    // Bersihkan form
    _reviewController.clear();
    setState(() {
      _mediaFiles.clear();
    });

    // Berikan notifikasi sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ulasan berhasil dikirim!')),
    );

    // Kembali ke halaman sebelumnya
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Tulis Ulasan"),
        backgroundColor: const Color(0xFFD3A335),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ulasan untuk: ${widget.item['title']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Tulis ulasan Anda di sini...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _addMedia(false),
                  icon: const Icon(Icons.camera),
                  label: const Text("Tambah Gambar"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () => _addMedia(true),
                  icon: const Icon(Icons.videocam),
                  label: const Text("Tambah Video"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _mediaFiles.map((file) {
                return Image.file(
                  file,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitReview,
                child: const Text("Kirim Ulasan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

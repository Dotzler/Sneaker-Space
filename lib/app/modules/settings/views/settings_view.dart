import 'package:flutter/material.dart';
import 'package:SneakerSpace/app/modules/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  final SettingsController _controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Audio Settings'),
        centerTitle: true,
        backgroundColor: Color(0xFFD3A335),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Audio Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD3A335),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Now Playing:',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    _controller.currentTrack.value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD3A335),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 20),
            Center(
              child: Obx(() {
                return ElevatedButton.icon(
                  onPressed: _controller.isPlaying.value
                      ? _controller.pauseAudio
                      : _controller.resumeAudio,
                  icon: Icon(
                    _controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                  ),
                  label: Text(
                    _controller.isPlaying.value ? 'Pause' : 'Play',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD3A335),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                );
              }),
            ),
            const Divider(height: 40, thickness: 1),
            const Text(
              'Switch Tracks',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD3A335),
              ),
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: const Icon(Icons.music_note, color: Color(0xFFD3A335)),
                  title: const Text('La Stravaganza'),
                  trailing: ElevatedButton(
                    onPressed: () =>
                        _controller.switchTrack('la-stravaganza.mp3'),
                    child: const Text('Play'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD3A335),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.music_note, color: Color(0xFFD3A335)),
                  title: const Text('Where We Started'),
                  trailing: ElevatedButton(
                    onPressed: () =>
                        _controller.switchTrack('background.mp3'),
                    child: const Text('Play'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD3A335),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.music_note, color: Color(0xFFD3A335)),
                  title: const Text('APT'),
                  trailing: ElevatedButton(
                    onPressed: () =>
                        _controller.switchTrack('ROSÉ_BrunoMars-APT.mp3'),
                    child: const Text('Play'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD3A335),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
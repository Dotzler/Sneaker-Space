import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/home/controllers/microphone_controller.dart';

class MicrophonePage extends StatelessWidget {
  final microphoneController = Get.put(MicrophoneController());

  MicrophonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Microphone Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => Text(
              microphoneController.text.value,
              style: const TextStyle(fontSize: 24),
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (microphoneController.isListening.value) {
                  microphoneController.stopListening();
                } else {
                  microphoneController.startListening();
                }
              },
              child: Obx(() => Text(
                microphoneController.isListening.value
                    ? 'Stop Listening'
                    : 'Start Listening',
              )),
            ),
          ],
        ),
      ),
    );
  }
}
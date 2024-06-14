import 'package:flutter/material.dart';

class SubmissionStatusPage extends StatelessWidget {
  final String role;
  final String company;
  final String address;

  SubmissionStatusPage({
    required this.role,
    required this.company,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Pengajuan'),
        backgroundColor: const Color(0xFF38A692),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Posisi: $role',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Perusahaan: $company',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Alamat: $address',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Status Pengajuan:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Stepper(
                  steps: [
                    Step(
                      title: Text('Dikirim'),
                      content: Text('Lamaran telah dikirim.'),
                      isActive: true,
                    ),
                    Step(
                      title: Text('Diproses'),
                      content: Text('Lamaran sedang diproses.'),
                      isActive: false,
                    ),
                    Step(
                      title: Text('Interview'),
                      content: Text('Anda dijadwalkan untuk interview.'),
                      isActive: false,
                    ),
                    Step(
                      title: Text('Pengumuman'),
                      content: Text('Pengumuman hasil interview.'),
                      isActive: false,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Motivasi:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Tetap semangat dan jangan menyerah! Kesempatan besar akan datang bagi mereka yang berusaha keras.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

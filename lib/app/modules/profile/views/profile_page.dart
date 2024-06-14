import 'package:flutter/material.dart';
import 'package:job_dream/app/modules/profile/views/RatingPage.dart';
import 'package:job_dream/app/modules/profile/views/SubmissionStatusPage.dart';
import 'package:job_dream/app/widgets/navbar.dart';
import 'package:job_dream/app/widgets/profile_card.dart';

// Halaman untuk menampilkan informasi aplikasi
class AppInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Aplikasi'),
        backgroundColor: const Color(0xFF38A692),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Aplikasi: Dream Job',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Versi: 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi: Ini adalah aplikasi yang membantu Anda menemukan pekerjaan impian Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Pengembang: Tim Dream Job',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Kontak: support@dreamjob.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman untuk mengganti password
class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Password'),
        backgroundColor: const Color(0xFF38A692),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _currentPasswordController,
                decoration: InputDecoration(labelText: 'Password Sebelumnya'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan password sebelumnya';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(labelText: 'Password Baru'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan password baru';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Konfirmasi Password Baru'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap konfirmasi password baru';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Password baru dan konfirmasi tidak cocok';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implementasi logika untuk mengganti password
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password berhasil diganti')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Ganti Password'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF38A692),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: const Color(0xFF38A692),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCard(
                name: "Tyandra Antanita",
                email: "Tyandra Antanita@gmail.com",
                phone: "081234567890",
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    List<String> items = [
                      "Informasi Aplikasi",
                      "Beri Rating",
                      "Status Pengajuan",
                      "Ganti Password",
                    ];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(items[index]),
                        trailing: Icon(Icons.arrow_forward_ios),
                        tileColor: Colors.transparent,
                        shape: Border(bottom: BorderSide(color: Colors.grey)),
                        onTap: () {
                          if (items[index] == "Informasi Aplikasi") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AppInfoPage()),
                            );
                          } else if (items[index] == "Ganti Password") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                            );
                          } else if (items[index] == "Status Pengajuan") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubmissionStatusPage(
                                  role: "UI/UX Designer",
                                  company: "AWS Company",
                                  address: "Oakland, CA",
                                ),
                              ),
                            );
                          } else if (items[index] == "Beri Rating") {
                            // Pindah ke halaman rating
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RatingPage()),
                            ).then((value) {
                              // Tampilkan popup ucapan terima kasih setelah rating diberikan
                              if (value != null && value is int) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Terima Kasih!'),
                                    content: Text('Terima kasih atas penilaian Anda: $value bintang.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Tutup dialog
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

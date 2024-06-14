import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_dream/app/modules/home/views/JobDetailPage.dart';
import 'package:job_dream/app/widgets/navbar.dart';
import 'package:job_dream/app/widgets/primary_card.dart';
import 'package:job_dream/app/widgets/secondary_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final User user = FirebaseAuth.instance.currentUser!;

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showJobDetailDialog(String title, String image, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(image, fit: BoxFit.cover),
                SizedBox(height: 10),
                Text(description),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NotificationDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: user.photoURL != null
                          ? NetworkImage(user.photoURL!) as ImageProvider<Object>?
                          : const AssetImage('assets/img/placeholder.png'),
                      backgroundColor: user.photoURL != null ? null : Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome To Dream Job',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            user.displayName ?? '',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Material(
                    elevation: 5,
                    shadowColor: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari Pekerjaan atau Pelatihan',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pekerjaan Terbaru',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF38A692),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JobDetailPage(
                              role: "UI/UX Designer",
                              company: "AWS Company",
                              address: "Oakland, CA",
                              description: "This is a detailed description of the UI/UX Designer role at AWS Company.",
                              image: 'assets/img/aws.png',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 300,
                        child: const PrimaryCard(
                          role: "UI/UX Designer",
                          company: "AWS Company",
                          address: "Oakland, CA",
                          picture: 'assets/img/aws.png',
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pelatihan Terbaru',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF38A692),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _showJobDetailDialog(
                          "UI/UX Designer",
                          'assets/img/aws.png',
                          "This is a detailed description of the UI/UX Designer role at AWS Company.",
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 300,
                        child: SecondaryCard(
                          title: "UI/UX Designer",
                          subTitle: "AWS Company",
                          image: 'assets/img/aws.png',
                          rating: "4.8",
                        ),
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

class NotificationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifications = [
      {'company': 'Company A', 'status': 'Accepted'},
      {'company': 'Company B', 'status': 'Pending'},
      {'company': 'Company C', 'status': 'Rejected'},
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Notifications',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ...notifications.map((notification) {
            return ListTile(
              title: Text(notification['company']!),
              subtitle: Text(notification['status']!),
              leading: Icon(Icons.work),
            );
          }).toList(),
        ],
      ),
    );
  }
}

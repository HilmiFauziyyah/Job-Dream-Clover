import 'package:flutter/material.dart';
import 'package:job_dream/app/modules/favourite/views/favourite_page.dart';
import 'package:job_dream/app/modules/home/views/home_page.dart';
import 'package:job_dream/app/modules/profile/views/profile_page.dart';
import 'package:job_dream/app/modules/community/views/community_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: Colors.black, 
      child: Container(
        color: Colors.white, 
        height: 50.0, // Tinggi navigasi
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home, color: const Color(0xFF38A692)), 
              onPressed: () {
               Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()),
                    );
              },
            ),
            IconButton(
              icon: const Icon(Icons.bookmark, color: Color(0xFF38A692)), 
              onPressed: () {
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavouritePage()),
                    );
              },
            ),
            IconButton(
              icon: const Icon(Icons.groups_2, color: Color(0xFF38A692)), 
              onPressed: () {
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityPage()),
                    );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Color(0xFF38A692)), 
              onPressed: () {
                 Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage()),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:job_dream/app/widgets/favourite_card.dart';
import 'package:job_dream/app/widgets/navbar.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 16.0), // Adjust the top padding value as needed
        child:  Column(
          
          children: [
            FavouriteCard(
              role: 'UI/UX Designer',
              company: 'Google',
              address: 'California',
            ),
            FavouriteCard(
              role: 'Admin HR Staff',
              company: 'PT.Lion Metal Works Tbk.',
              address: 'Jakarta Raya, Purwakarta (Jawa Barat)',
            ),
            FavouriteCard(
              role: 'Finance dan Accounting Staff',
              company: 'PT.Kito Indonesia',
              address: 'Bekasi(Jawa Barat)',
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

import 'package:flutter/material.dart';

class FavouriteCard extends StatelessWidget {
  final String role;
  final String company;
  final String address;

  const FavouriteCard(
      {Key? key,
      required this.role,
      required this.company,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(role,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(company,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 10)),
                    ),
                    Text(address,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ),
              const Icon(
                Icons.bookmark,
                color: Color(0xFF38A692),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

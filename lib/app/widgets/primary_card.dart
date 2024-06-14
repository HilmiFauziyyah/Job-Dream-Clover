import 'package:flutter/material.dart';

class PrimaryCard extends StatefulWidget {
  final String role;
  final String company;
  final String address;
  final String picture;

  const PrimaryCard(
      {Key? key,
      required this.role,
      required this.company,
      required this.address,
      required this.picture})
      : super(key: key);

  @override
  _PrimaryCardState createState() => _PrimaryCardState();
}

class _PrimaryCardState extends State<PrimaryCard> {
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
          color: Color.fromARGB(255, 76, 165, 149), // Set the color to green
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.picture),
            radius: 30,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.role,
                style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white)),
                ),
                Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(widget.company,
                style: const TextStyle(
              fontWeight: FontWeight.w300, fontSize: 10, color: Colors.white)),
                ),
                Text(widget.address,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
                Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                const Icon(
                  Icons.access_time,
                  color: Colors.white,
                  size: 15,
                ),
                const SizedBox(width: 20),
                Text('Full-time',
              style: const TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
              ],
            ),
                ),
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

import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beri Rating'),
        backgroundColor: const Color(0xFF38A692),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Beri Rating:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_rating >= 1 ? Icons.star : Icons.star_border),
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(_rating >= 2 ? Icons.star : Icons.star_border),
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(_rating >= 3 ? Icons.star : Icons.star_border),
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(_rating >= 4 ? Icons.star : Icons.star_border),
                  onPressed: () {
                    setState(() {
                      _rating = 4;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(_rating >= 5 ? Icons.star : Icons.star_border),
                  onPressed: () {
                    setState(() {
                      _rating = 5;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kirim rating ke sistem Anda
                Navigator.pop(context, _rating); // Kembali ke halaman sebelumnya dengan membawa nilai rating
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF38A692),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

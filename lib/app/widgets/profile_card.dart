import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_dream/app/utils/pick_image.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
  }) : super(key: key);

  final String name;
  final String email;
  final String phone;

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  Uint8List? image;

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    FirebaseAuth.instance.currentUser!.updatePhotoURL(image.toString());
    setState(() {
      this.image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 400, // Adjust the width here
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.black, width: 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    image != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage: MemoryImage(image!),
                          )
                        : const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://example.com/profile_image.jpg'), // Replace with actual image URL
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: selectImage,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          widget.email,
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 10),
                        ),
                      ),
                      Text(
                        widget.phone,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

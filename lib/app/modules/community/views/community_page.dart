import 'package:flutter/material.dart';
import 'package:job_dream/app/modules/community/constant/courses.dart';
import 'package:job_dream/app/modules/community/model/Course.dart';
import 'package:job_dream/app/widgets/navbar.dart';

class CourseTile extends StatelessWidget {
  final Course course;

  const CourseTile({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(course.imagePath),
          ),
          const SizedBox(height: 8),
          Text(
            course.title,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(course.subtitle),
        ],
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/img/skills.png'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Explore and Improve \nYour Skill',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return CourseTile(course: courses[index]);
                },
                childCount: courses.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

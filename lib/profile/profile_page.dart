import 'package:flutter/material.dart';
import 'package:mobile_teori_kuis2/profile/homepage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ));
            },
            child: Container(
              height: 80,
              child: Icon(Icons.home),
            ),
          )),
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ));
            },
            child: Container(
              height: 80,
              child: Icon(Icons.person),
            ),
          ))
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/profile.jpeg'),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama: Dejan Azul Ultamar",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "NIM: 124220138",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Tempat & Tanggal Lahir: Padang, 24 November 2004",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Hobi: Membaca Buku",
                      style: TextStyle(fontSize: 25),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

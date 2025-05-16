import 'package:flutter/material.dart';
import 'package:project_asli/View/profile_view.dart';
import 'package:project_asli/Widgets/bottomnav.dart';

class Halaman1View extends StatelessWidget {
  const Halaman1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SIAGAKU",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileView()),
                      );
                    },
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildImage('assets/pemadam2.jpg', 300),
                    _buildImage('assets/pemadam1.jpg', 228),
                    _buildImage('assets/pemadam2.jpg', 300),
                    _buildImage('assets/pemadam1.jpg', 228),
                  ],
                ),
              ),

              SizedBox(height: 26),

              Text(
                "Berita Terkini",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 15),

              _buildNewsCard('assets/rumah.jpg', 'DAMKAR SEMPROT RUMAH'),
              _buildNewsCard(
                'assets/dihajar.jpg',
                'GAGAL MALING AYAM SEKARUNG,\nMALAH DIHAJAR WARGA',
              ),
              _buildNewsCard(
                'assets/ambulance1.jpg',
                'NEKAT! ODGJ BAWA KABUR\nAMBULANS DESA',
              ),
              _buildNewsCard(
                'assets/kebakaran.jpg',
                'KEBAKARAN HUTAN!\nAPA PENYEBABNYA?',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }

  Widget _buildImage(String asset, double width) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(asset, width: width),
      ),
    );
  }

  Widget _buildNewsCard(String image, String title) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 11,
              right: 11,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

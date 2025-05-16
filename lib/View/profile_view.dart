import 'package:flutter/material.dart';
import 'package:project_asli/View/editprofile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Admin',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'siagaku@gmail.com',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, size: 24),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => EditProfileView()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 32),
              Text("Username", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: "Admin"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1E9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text("Kota", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: "Malang"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1E9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: "siagaku@gmail.com"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1E9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              TextField(
                readOnly: true,
                obscureText: true,
                controller: TextEditingController(text: "***********"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1E9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

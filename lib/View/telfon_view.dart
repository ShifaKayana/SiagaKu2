import 'package:flutter/material.dart';
import 'package:project_asli/Widgets/bottomnav.dart';
import 'package:url_launcher/url_launcher.dart';

class TelfonView extends StatelessWidget {
  const TelfonView({super.key});

  void confirmAndCall(BuildContext context, String number, String label) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Konfirmasi'),
            content: Text('Yakin ingin menghubungi $label?'),
            actions: [
              TextButton(
                child: Text('Tidak'),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: Text('Ya'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
    );

    if (confirm == true) {
      final Uri url = Uri(scheme: 'tel', path: number);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal menghubungi $label')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Panggilan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmergencyButton(
              icon: Icons.local_police,
              label: 'Polisi',
              onTap: () => confirmAndCall(context, '110', 'Polisi'),
            ),
            SizedBox(height: 16),
            EmergencyButton(
              icon: Icons.local_fire_department,
              label: 'Pemadam Kebakaran',
              onTap: () => confirmAndCall(context, '113', 'Pemadam Kebakaran'),
            ),
            SizedBox(height: 16),
            EmergencyButton(
              icon: Icons.medical_services,
              label: 'Ambulans',
              onTap: () => confirmAndCall(context, '118', 'Ambulans'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}

class EmergencyButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const EmergencyButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1E9D9),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(label, style: TextStyle(color: Colors.black)),
        onTap: onTap,
      ),
    );
  }
}

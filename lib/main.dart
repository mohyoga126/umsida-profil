import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UMSIDA',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const BerandaUMSIDA(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BerandaUMSIDA extends StatelessWidget {
  const BerandaUMSIDA({super.key});

  void _showComingSoonDialog(BuildContext context, String menuName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(menuName),
          content: Text('Fitur $menuName akan segera hadir!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenuCard({
    required BuildContext context, // ← TAMBAH INI
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _showComingSoonDialog(context, title);
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: color,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header dengan Logo
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      // Logo UMSIDA
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.school,
                          size: 60,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Nama Universitas
                      const Text(
                        'UNIVERSITAS MUHAMMADIYAH',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'SIDOARJO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Unggul dalam Iman, Ilmu, dan Amal',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Grid Menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Menu Utama',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        _buildMenuCard(
                          context: context, // ← TAMBAH INI
                          icon: Icons.person,
                          title: 'Profil',
                          color: Colors.blue,
                        ),
                        _buildMenuCard(
                          context: context, // ← TAMBAH INI
                          icon: Icons.school,
                          title: 'Akademik',
                          color: Colors.orange,
                        ),
                        _buildMenuCard(
                          context: context, // ← TAMBAH INI
                          icon: Icons.article,
                          title: 'Berita',
                          color: Colors.purple,
                        ),
                        _buildMenuCard(
                          context: context, // ← TAMBAH INI
                          icon: Icons.app_registration,
                          title: 'Pendaftaran',
                          color: Colors.red,
                        ),
                        _buildMenuCard(
                          context: context, // ← TAMBAH INI
                          icon: Icons.event,
                          title: 'Kalender',
                          color: Colors.teal,
                        ),
                        _buildMenuCard(
                          context: context, // ← TAMBAH INI
                          icon: Icons.contact_mail,
                          title: 'Kontak',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Footer
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Text(
                      '© 2025 UMSIDA',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Jl. Mojopahit 666B, Sidoarjo',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

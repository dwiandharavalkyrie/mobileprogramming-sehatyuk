import 'package:flutter/material.dart';
import 'package:sehatyuk/pages/checkout.dart'; // Pastikan impor file checkout.dart dengan benar

class MainChatDokterPage extends StatelessWidget {
  const MainChatDokterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1D7ED1)),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
        title: const Text(
          'Chat dengan Dokter',
          style: TextStyle(color: Color(0xFF1D7ED1)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari Dokter',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Cari Dokter atau Spesialisasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D7ED1),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildServiceItem('images/poli1.png', 'Dokter Umum', () {}),
                _buildServiceItem(
                    'images/poli2.png', 'Spesialis Penyakit\nDalam', () {}),
                _buildServiceItem('images/poli3.png', 'Dokter Gigi', () {}),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Rekomendasi Dokter',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D7ED1),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildDoctorItem(
                    context,
                    'Dr. Lily Luth',
                    'Dokter Umum',
                    9,
                    98,
                    50000,
                    'images/dokter1.png',
                  ),
                  _buildDoctorItem(
                    context,
                    'Dr. Raihan Aqilah S.PD',
                    'Spesialis Penyakit Dalam',
                    15,
                    98,
                    150000,
                    'images/dokter2.png',
                  ),
                  _buildDoctorItem(
                    context,
                    'Drg. Fenny Fatmawati',
                    'Dokter Gigi',
                    15,
                    99,
                    80000,
                    'images/dokter3.png',
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Image.asset('images/home.png', width: 30, height: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset('images/profile.png',
                        width: 35, height: 35),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorItem(BuildContext context, String name, String specialty,
      int years, int rating, int price, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.work, size: 16),
                    const SizedBox(width: 4),
                    Text('$years tahun'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.thumb_up, size: 16),
                    const SizedBox(width: 4),
                    Text('$rating%'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text('Rp. $price'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ScheduleConsultationPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF1D7ED1),
          ),
          child: const Text('Chat'),
        ),
      ),
    );
  }

  Widget _buildServiceItem(String imagePath, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(imagePath, width: 70, height: 70),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

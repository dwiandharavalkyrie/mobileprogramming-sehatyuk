import 'package:flutter/material.dart';
import 'package:sehatyuk/pages/mainchatdokterpage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('images/profile.png', width: 50, height: 50),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Image.asset('images/notification.png', width: 50, height: 50),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: ImageIcon(AssetImage('images/search.png'),
                      color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text('Pelayanan',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D7ED1))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildServiceItem('images/chatdokter.png', 'Chat dengan\nDokter',
                  () {
                Navigator.pushNamed(context,
                    '/mainchatdokter'); // Navigate to /mainchatdokter route
              }),
              _buildServiceItem(
                  'images/rujukan.png', 'Pendaftaran\nke Rumah\nSakit', () {
                Navigator.pushNamed(context, '/pendaftaran');
              }),
              _buildServiceItem('images/beliobat.png', 'Beli Obat', () {}),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('images/banner.png'), // Banner image
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text('Cari Dokter',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D7ED1))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildServiceItem('images/poli1.png', 'Dokter Umum', () {}),
              _buildServiceItem(
                  'images/poli2.png', 'Spesialis Penyakit\nDalam', () {}),
              _buildServiceItem('images/poli3.png', 'Dokter Gigi', () {}),
            ],
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Image.asset('images/home.png', width: 45, height: 45),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                      Image.asset('images/profile.png', width: 50, height: 50),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String imagePath, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFF1D7ED1)),
          ),
        ],
      ),
    );
  }
}

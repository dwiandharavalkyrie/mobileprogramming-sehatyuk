import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () {},
          ),
          title: const Text(
            'Chat dengan Dokter',
            style: TextStyle(color: Colors.blue),
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
                  prefixIcon: const Icon(Icons.search),
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
                      'Dr. Aisyah Mutiara',
                      'Dokter Umum',
                      9,
                      98,
                      50000,
                      'dokter1.png',
                    ),
                    _buildDoctorItem(
                      'Dr. Raihan Aqilah S.PD',
                      'Spesialis Penyakit Dalam',
                      15,
                      98,
                      150000,
                      'dokter2.png',
                    ),
                    _buildDoctorItem(
                      'Drg. Fenny Fatmawati',
                      'Dokter Gigi',
                      15,
                      99,
                      80000,
                      'dokter3.png',
                    ),
                  ],
                ),
              ),
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
                  _buildServiceItem('poli1.png', 'Dokter Umum'),
                  _buildServiceItem('poli2.png', 'Spesialis Penyakit\nDalam'),
                  _buildServiceItem('poli3.png', 'Dokter Gigi'),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorItem(String name, String specialty, int years, int rating,
      int price, String imagePath) {
    return Card(
      child: ListTile(
        leading: Image.asset('images/$imagePath', width: 50, height: 50),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('$years tahun'),
                const SizedBox(width: 8),
                Text('$rating%'),
              ],
            ),
            const SizedBox(height: 4),
            Text('Rp. $price'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Chat'),
        ),
      ),
    );
  }

  Widget _buildServiceItem(String imagePath, String title) {
    return Column(
      children: [
        Image.asset('images/$imagePath', width: 50, height: 50),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

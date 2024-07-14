import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScheduleConsultationPage(),
    );
  }
}

class ScheduleConsultationPage extends StatefulWidget {
  const ScheduleConsultationPage({Key? key}) : super(key: key);

  @override
  _ScheduleConsultationPageState createState() =>
      _ScheduleConsultationPageState();
}

class _ScheduleConsultationPageState extends State<ScheduleConsultationPage> {
  DateTime? _selectedDate;
  String _selectedTime = '19:00';
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwalkan Konsultasi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDoctorItem(
              'Dr. Lily Luthfiah',
              'Dokter Umum',
              9,
              98,
              50000,
              'images/dokter1.png',
            ),
            const SizedBox(height: 20),
            _buildSectionTitle('Pilih Tanggal & Waktu Konsultasi'),
            _buildDateTimePicker(),
            const SizedBox(height: 10),
            _buildSectionTitle('Pilih Jam Konsultasi'),
            _buildTimePicker(),
            const SizedBox(height: 10),
            _buildSectionTitle('Pilih Metode Pembayaran'),
            _buildPaymentMethods(),
            const SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Schedule consultation
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF1D7ED1),
                  ),
                  child: const Text('Jadwalkan Konsultasi'),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset('images/home.png', width: 30, height: 30),
              onPressed: () {
                // Action when home button is pressed
              },
            ),
            IconButton(
              icon: Image.asset('images/profile.png', width: 35, height: 35),
              onPressed: () {
                // Action when profile button is pressed
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1D7ED1),
        ),
      ),
    );
  }

  Widget _buildDateTimePicker() {
    return TextFormField(
      readOnly: true,
      controller: _dateController,
      decoration: const InputDecoration(
        hintText: 'Pilih tanggal',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
            _dateController.text =
                '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
          });
        }
      },
    );
  }

  Widget _buildTimePicker() {
    List<String> times = ['19:00', '19:30', '20:00', '20:30', '21:00'];

    return DropdownButtonFormField(
      value: _selectedTime,
      onChanged: (value) {
        setState(() {
          _selectedTime = value.toString();
        });
      },
      items: times.map((time) {
        return DropdownMenuItem(
          value: time,
          child: Text(time),
        );
      }).toList(),
      decoration: const InputDecoration(
        hintText: 'Pilih jam',
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      children: [
        _buildPaymentMethodTile(
          leadingIcon: 'images/creditcard.png',
          title: 'Credit Card',
        ),
        _buildPaymentMethodTile(
          leadingIcon: 'images/gopay.png',
          title: 'GOPAY',
        ),
        _buildPaymentMethodTile(
          leadingIcon: 'images/linkaja.png',
          title: 'LinkAja',
        ),
      ],
    );
  }

  Widget _buildPaymentMethodTile(
      {required String leadingIcon, required String title}) {
    return ListTile(
      leading: Image.asset(
        leadingIcon,
        width: 40,
        height: 40,
      ),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle payment method selection
      },
    );
  }

  Widget _buildDoctorItem(String name, String specialty, int years, int rating,
      int price, String imagePath) {
    return Row(
      children: [
        Image.asset(imagePath, width: 80, height: 80),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(specialty),
            Row(
              children: [
                const Icon(Icons.work, size: 16),
                const SizedBox(width: 4),
                Text('$years tahun'),
                const SizedBox(width: 8),
                const Icon(Icons.thumb_up, size: 16),
                const SizedBox(width: 4),
                Text('$rating%'),
              ],
            ),
            Text('Rp. $price',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}

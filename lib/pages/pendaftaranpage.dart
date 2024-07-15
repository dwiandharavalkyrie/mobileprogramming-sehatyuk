import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PendaftaranPage extends StatefulWidget {
  const PendaftaranPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PendaftaranPageState createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pendaftaran ke Rumah Sakit',
          style: TextStyle(
            color: Color(0xFF1D7ED1), // Set text color to #1D7ED1
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama Pasien',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Umur',
                ),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                ),
                items: ['Laki-laki', 'Perempuan'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'No Telepon',
                ),
                keyboardType: TextInputType.phone,
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Pilih Rumah Sakit',
                ),
                items: [
                  'RSUP Dr. M. Djamil Padang',
                  'Rumah Sakit Hermina Padang',
                  'Rumah Sakit Yos Sudarso',
                  'Rumah Sakit Islam Ibnu Sina'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Pilih Poli',
                ),
                items: ['Poli Umum', 'Poli Gigi', 'Poli Penyakit Dalam']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Daftar',
                  hintText: 'hh/bb/tt',
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _selectDate(context);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Keluhan',
                  hintText: 'Silahkan isi keluhan anda...',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF1D7ED1), // Set button color to #1D7ED1
                ),
                onPressed: () {
                  // Handle form submission
                },
                child: const Text(
                  'DAFTAR',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontWeight: FontWeight.bold, // Make text bold
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

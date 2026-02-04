import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/programs': (context) => const ProgramsPage(),
        '/admission': (context) => const AdmissionPage(),
        '/people': (context) => const PeoplePage(),
        '/laboratory': (context) => const LaboratoryPage(),
        '/campus-life': (context) => const CampusLifePage(),
        '/office-services': (context) => const OfficeServicesPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: false,
        title: Image.asset('assets/images/prasmul-logo-white.png', height: 50),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text(
                          'PROGRAMS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/programs');
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'ADMISSION',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/admission');
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'PEOPLE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/people');
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'LABORATORY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/laboratory');
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'CAMPUS LIFE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/campus-life');
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'OFFICE & SERVICES',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/office-services');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
                      child: Image.asset(
                        'assets/images/logo_upm_biru.png',
                        height: 120,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'VISION',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text(
                      'A globally recognized School for\nSTEMpreneur Education and Research',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'MISSION',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      'Provide quality STEM education and research\nfor nurturing the holistic citizen graduates\nthrough:',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Text(
                      '1. Collaborative learning by enterprising\n   involving interdisciplinary catalytic projects\n2. Innovative and impactful research to the\n   society',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.black87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 3, color: Colors.red),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'BSD City Kavling Edutown I.1\n'
                    'Jl. BSD Raya Utama, BSD City 15339\n'
                    'Kabupaten Tangerang, Indonesia',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 6),
                padding
                const Text(
                  'Tel. (021) 304-50-500\n'
                  'Hp. (+62) 81511662005',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 6),
                const Text(
                  'info@prasetiyamulya.ac.id',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Programs Page
class ProgramsPage extends StatelessWidget {
  const ProgramsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset('assets/images/prasmul-logo-white.png', height: 50),
      ),
      body: const Center(child: Text('PROGRAMS PAGE')),
    );
  }
}

// Admission Page
class AdmissionPage extends StatelessWidget {
  const AdmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset('assets/images/prasmul-logo-white.png', height: 50),
      ),
      body: const Center(child: Text('ADMISSION PAGE')),
    );
  }
}

// People Page
class PeoplePage extends StatelessWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset('assets/images/prasmul-logo-white.png', height: 50),
      ),
      body: const Center(child: Text('PEOPLE PAGE')),
    );
  }
}

// Laboratory Page
class LaboratoryPage extends StatelessWidget {
  const LaboratoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset('assets/images/prasmul-logo-white.png', height: 50),
      ),
      body: const Center(child: Text('LABORATORY PAGE')),
    );
  }
}

// Campus Life Page
class CampusLifePage extends StatelessWidget {
  const CampusLifePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset('assets/images/prasmul-logo-white.png', height: 50),
      ),
      body: const Center(child: Text('CAMPUS LIFE PAGE')),
    );
  }
}

// Office & Services Page
class OfficeServicesPage extends StatelessWidget {
  const OfficeServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Image.asset('assets/images/prasmul-logo-white.png', height: 50),
      ),
      body: const Center(child: Text('OFFICE & SERVICES PAGE')),
    );
  }
}

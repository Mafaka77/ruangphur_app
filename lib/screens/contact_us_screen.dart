import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 28,
                          child: Icon(Icons.support_agent, size: 30),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'We\'re here to help',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Reach out to us via phone or email and we\'ll get back to you soon.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: Text('Phone'),
                        subtitle: Text('+91 12345 67890'),
                      ),
                      Divider(height: 0),
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.blue),
                        title: Text('Email'),
                        subtitle: Text('support@ruangphur.in'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        leading:
                            Icon(Icons.location_on, color: Colors.redAccent),
                        title: Text('Office Address'),
                        subtitle: Text(
                            'Ruangphur Office\n2nd Floor, Main Street\nAizawl, Mizoram 796001'),
                        isThreeLine: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.access_time, color: Colors.orange),
                        title: Text('Office Hours'),
                        subtitle: Text(
                            'Mon - Fri: 9:30 AM - 5:30 PM\nSat - Sun: Closed'),
                        isThreeLine: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        const Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.public),
                            title: Text('Follow Us'),
                            subtitle: Text('Stay updated with the latest news'),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook),
                          tooltip: 'Facebook',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt_outlined),
                          tooltip: 'Instagram',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.alternate_email),
                          tooltip: 'Twitter / X',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We aim to respond within 24-48 hours.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

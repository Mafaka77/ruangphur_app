import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us'), centerTitle: true),
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
                      horizontal: 16,
                      vertical: 20,
                    ),
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
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
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
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: Text('Phone'),
                        subtitle: Text('0389-2390866'),
                      ),
                      Divider(height: 0),
                      ListTile(
                        dense: true,
                        leading: Icon(Icons.email, color: Colors.blue),
                        title: Text('Email'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('dswoeast@gmail.com'),
                            Text('dswowest@gmail.com'),
                            Text('dswolunglei@gmail.com'),
                            Text('dswomamit@gmail.com'),
                            Text('dswosiaha@gmail.com'),
                            Text('dswochamphai@gmail.com'),
                            Text('sethawnjordancentre@gmail.com'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                        ),
                        title: Text('Office Address'),
                        subtitle: Text(
                          'Directorate of Social Welfare,\n'
                          'Government of Mizoram,\n'
                          'Laipuitlang,\n'
                          'Aizawl - 796012,\n'
                          'Mizoram, India.',
                        ),
                        isThreeLine: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

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

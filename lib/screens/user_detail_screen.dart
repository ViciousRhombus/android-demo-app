import 'package:flutter/material.dart';
import '../model/user.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: const Color(0xFF5EBCF2),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                _buildSectionTitle('Personal Info'),
                _infoRow('Username', user.username),
                _infoRow('Email', user.email),
                _infoRow('Phone', user.phone),
                _infoRow('Website', user.website),
                const SizedBox(height: 24),
                _buildSectionTitle('Address'),
                _infoRow('Street', user.address.street),
                _infoRow('Suite', user.address.suite),
                _infoRow('City', user.address.city),
                _infoRow('Zipcode', user.address.zipcode),
                _infoRow('Geo', '${user.address.geo.lat}, ${user.address.geo.lng}'),
                const SizedBox(height: 24),
                _buildSectionTitle('Company'),
                _infoRow('Name', user.company.name),
                _infoRow('Catch Phrase', user.company.catchPhrase),
                _infoRow('Business', user.company.bs),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1F2937),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Color(0xFF4B5563)),
            ),
          ),
        ],
      ),
    );
  }
}

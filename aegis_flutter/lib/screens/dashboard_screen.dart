import 'package:flutter/material.dart';

import '../widgets/dashboard_card.dart';
import 'chat_screen.dart';
import 'network_map_screen.dart';
import 'resource_feed_screen.dart';
import 'settings_screen.dart';
import 'sos_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AEGIS"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Emergency Mesh Network",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Offline-first communication platform",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            DashboardCard(
              icon: Icons.people_alt,
              title: "Nearby Survivors",
              subtitle: "Discover nearby peers",
              onTap: () {},
            ),

            DashboardCard(
              icon: Icons.chat,
              title: "Mesh Chat",
              subtitle: "Offline encrypted messaging",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChatScreen(),
                  ),
                );
              },
            ),

            DashboardCard(
              icon: Icons.sos,
              title: "Emergency SOS",
              subtitle: "Broadcast emergency alert",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SosScreen(),
                  ),
                );
              },
            ),

            DashboardCard(
              icon: Icons.inventory_2,
              title: "Resources",
              subtitle: "Food • Water • Medicine",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResourceFeedScreen(),
                  ),
                );
              },
            ),

            DashboardCard(
              icon: Icons.map,
              title: "Network Map",
              subtitle: "Visualize nearby mesh nodes",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NetworkMapScreen(),
                  ),
                );
              },
            ),

            DashboardCard(
              icon: Icons.settings,
              title: "Settings",
              subtitle: "Identity & Preferences",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
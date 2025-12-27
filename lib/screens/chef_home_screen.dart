import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../utils/app_theme.dart';
import 'role_selection_screen.dart';

class ChefHomeScreen extends StatelessWidget {
  const ChefHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      appBar: AppBar(
        title: const Text('Chef Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleLogout(context, authController),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.outdoor_grill, size: 100, color: AppTheme.mutedSaffron),
            const SizedBox(height: 24),
            Text(
              'Welcome, Chef ${authController.currentUser?.name ?? ''}!',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Role: Home Chef',
              style: TextStyle(color: AppTheme.mutedSaffron, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text('Ready to cook? Manage your menu!'),
          ],
        ),
      ),
    );
  }

  void _handleLogout(BuildContext context, AuthController controller) async {
    await controller.logout();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
        (route) => false,
      );
    }
  }
}

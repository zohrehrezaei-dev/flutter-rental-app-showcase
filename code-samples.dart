// Home Page Navigation System - Flutter Rental App Showcase
// Demonstrates: Bottom navigation, state management, and modular architecture

import 'package:flutter/material.dart';

/// Main home page with bottom navigation and three primary sections:
/// - Explore: Property browsing for renters
/// - Messages: Communication system (placeholder)  
/// - Profile: User management and host actions
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildExplorePage(),
          _buildMessagesPage(), 
          _buildProfilePage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  /// Custom bottom navigation with Material Design theming
  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFEF4060), // Brand accent color
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined), 
          activeIcon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  /// Property exploration page for renters
  Widget _buildExplorePage() {
    // Integration with property listing system
    return const PropertyExploreView(); // Placeholder
  }

  /// Messaging system placeholder with modern empty state
  Widget _buildMessagesPage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Messages',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Your conversations will appear here',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Comprehensive profile page with dual-mode functionality
  Widget _buildProfilePage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 16),
          _buildAddPropertyButton(),
          const SizedBox(height: 16),
          _buildProfileMenuCard(),
          const SizedBox(height: 32),
          _buildSpecialActions(),
        ],
      ),
    );
  }

  /// Modern profile header with Material Design 3 theming
  Widget _buildProfileHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 32,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Profile',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Manage your account and preferences',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Call-to-action button for property hosts
  Widget _buildAddPropertyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          // Integration with property listing wizard
          _navigateToPropertyCreation();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Add your property for rent',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  /// Reusable profile menu card with consistent theming
  Widget _buildProfileMenuCard() {
    return Card(
      child: Column(
        children: [
          _buildMenuItem(Icons.favorite_border, 'Favorites', 'Your saved properties'),
          _buildMenuItem(Icons.account_circle, 'Account Settings', 'Manage your account details'),
          _buildMenuItem(Icons.help_outline, 'Get help', 'Support and assistance'),
          _buildMenuItem(Icons.security, 'Privacy & Security', 'Control your privacy settings'),
          _buildMenuItem(Icons.description, 'Legal Documents', 'Terms and privacy policy'),
          _buildMenuItem(Icons.logout, 'Log out', 'Sign out of your account'),
        ],
      ),
    );
  }

  /// Reusable menu item component with consistent styling
  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => _handleMenuAction(title),
    );
  }

  /// Special action cards for enhanced functionality
  Widget _buildSpecialActions() {
    return Column(
      children: [
        // Map View Card
        Card(
          color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
          child: ListTile(
            leading: Icon(
              Icons.map,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Map View',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text('Explore properties on map'),
            onTap: () => _navigateToMapView(),
          ),
        ),
        const SizedBox(height: 16),
        // Hosting Mode Card
        Card(
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
          child: ListTile(
            leading: Icon(
              Icons.business,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Hosting Mode',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text('Manage your rental properties'),
            trailing: Icon(
              Icons.arrow_forward,
              color: Theme.of(context).colorScheme.primary,
            ),
            onTap: () => _navigateToHostingMode(),
          ),
        ),
      ],
    );
  }

  // Navigation methods (implementation depends on app architecture)
  void _navigateToPropertyCreation() {
    // Navigate to property listing wizard
  }
  
  void _navigateToMapView() {
    // Navigate to interactive property map
  }
  
  void _navigateToHostingMode() {
    // Navigate to host dashboard
  }
  
  void _handleMenuAction(String action) {
    // Handle menu item interactions
  }
}

// Placeholder widgets for demo
class PropertyExploreView extends StatelessWidget {
  const PropertyExploreView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Property exploration interface'));
  }
}

// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'leave_request_screen.dart';
import 'notifications_screen.dart';
import 'settings_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Current index of BottomNavigationBar
  int _currentIndex = 0;
  // List of widgets for each tab
  final List<Widget> _children = [
    const HomeContent(), // Main Home Screen Content
    const NotificationsScreen(), // Notifications Placeholder
    const SettingsScreen(), // Settings Placeholder
  ];
  // Function to handle tab selection
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF122133), // Custom background color
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: const [
            Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white, // Icon color set to white
            ),
            SizedBox(width: 15),
            Text(
              'HR System',
              style: TextStyle(
                color: Colors.white, // Text color set to white
                fontSize: 20, // Optional: Adjust font size
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color:
              const Color(0xFF122133), // Set the background color of the Drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('Username'), // Replace with actual user name
                accountEmail:
                    Text('user@example.com'), // Replace with actual email
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              _buildDrawerItem(Icons.home, 'Home', 0),
              _buildDrawerItem(Icons.notifications, 'Notifications', 1),
              _buildDrawerItem(Icons.settings, 'Settings', 2),
              const Divider(
                  color:
                      Colors.white), // Optional: change divider color to white
              _buildLogoutItem(),
            ],
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF122133),
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white, // Highlight color for selected item
        unselectedItemColor: Colors.white, // Color for unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // Build drawer items to reduce redundancy
  ListTile _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white, // Set icon color to white
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white), // Set text color to white
      ),
      tileColor: _currentIndex == index
          ? Colors.blue[100]
          : null, // Highlight color when selected
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  // Logout item with confirmation dialog
  ListTile _buildLogoutItem() {
    return ListTile(
      leading: const Icon(
        Icons.logout,
        color: Colors.white, // Set icon color to white
      ),
      title: const Text(
        'Logout',
        style: TextStyle(color: Colors.white), // Set text color to white
      ),
      onTap: () {
        Navigator.pop(context);
        // Optional: Add confirmation dialog before logout
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Cancel
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  // Navigate back to LoginScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Separate widget for Home Content to keep code organized
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the list of leave types
    final List<Map<String, dynamic>> leaveTypes = [
      {
        'title': 'Leave Request',
        'icon': Icons.verified_user_outlined,
        'color': Colors.blue,
      },
      {
        'title': 'Leave Balance',
        'icon': Icons.account_balance_wallet,
        'color': Colors.pink,
      },
      {
        'title': 'Attendance',
        'icon': Icons.supervised_user_circle_sharp,
        'color': Colors.red,
      },
      {
        'title': 'Payroll',
        'icon': Icons.currency_exchange_rounded,
        'color': Colors.orange,
      },
      {
        'title': 'Reports',
        'icon': Icons.view_cozy_outlined,
        'color': Colors.orange,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: leaveTypes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 2, // Responsive grid
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 1, // Square buttons
        ),
        itemBuilder: (context, index) {
          final leave = leaveTypes[index];
          return GestureDetector(
            onTap: () => _navigateToLeaveRequest(context, leave['title']),
            child: Container(
              decoration: BoxDecoration(
                color: leave['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: leave['color'], width: 1.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    leave['icon'],
                    size: 30.0,
                    color: leave['color'],
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    leave['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: leave['color'],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to navigate to Leave Request Screen
  void _navigateToLeaveRequest(BuildContext context, String leaveType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LeaveRequestScreen(leaveType: leaveType),
      ),
    );
  }
}

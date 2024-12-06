// lib/screens/leave_request_screen.dart
import 'package:flutter/material.dart';

class LeaveRequestScreen extends StatelessWidget {
  final String leaveType;

  const LeaveRequestScreen({super.key, required this.leaveType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$leaveType Request'),
      ),
      body: Center(
        child: Text(
          'This is the $leaveType request screen.',
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

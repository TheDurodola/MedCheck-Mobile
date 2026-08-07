import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget{
  const ProfileWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState  extends State<ProfileWidget>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.article_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            "Profile",
            style: TextStyle(fontSize: 24, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            "Coming soon",
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

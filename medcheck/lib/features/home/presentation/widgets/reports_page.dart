import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget{
  const ReportsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReportPageState();
}

class _ReportPageState  extends State<ReportsPage>{
  @override
  Widget build(BuildContext context) {
     return Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Icon(Icons.article_outlined, size: 80, color: Colors.grey[400]),
           const SizedBox(height: 16),
           Text(
             "Reports",
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

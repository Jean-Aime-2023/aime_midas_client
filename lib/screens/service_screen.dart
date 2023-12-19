import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key,  required this.category });
  final String category;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(style: TextStyle(color:  Colors.black, fontSize: 30, fontStyle: FontStyle.normal), child: Text(category)),
      ),
    );
  }
}
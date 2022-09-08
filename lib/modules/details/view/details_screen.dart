import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Details Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.cyanAccent[200],
            ),
            Text(
              "Details Page",
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Size Selector',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: UniqueSizeSelectorScreen(),
    );
  }
}

class UniqueSizeSelectorScreen extends StatefulWidget {
  @override
  _UniqueSizeSelectorScreenState createState() => _UniqueSizeSelectorScreenState();
}

class _UniqueSizeSelectorScreenState extends State<UniqueSizeSelectorScreen> {
  String? selectedSize;

  void selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You chose: $size'))
    );
  }

  Widget _buildSizeButton(String size) {
    bool isSelected = selectedSize == size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AspectRatio(
          aspectRatio: 3.2 / 1,  // Adjusted ratio
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isSelected ? Colors.orangeAccent : Color(0xFFa8a8a8),  // Adjusted colors
              onPrimary: Colors.white,
              elevation: 5.0,  // Added elevation
              shape: RoundedRectangleBorder(  // Rounded corners
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () => selectSize(size),
            child: Center(
              child: Text(
                size,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector' ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                _buildSizeButton("S"),
                _buildSizeButton("M"),
                _buildSizeButton("L"),
                _buildSizeButton("XL"),
              ],
            ),
            SizedBox(height: 10.0),  // Adjusted spacing
            Row(
              children: [
                _buildSizeButton("XXL"),
                _buildSizeButton("XXXL"),
                Spacer(flex: 1),
                Spacer(flex: 1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
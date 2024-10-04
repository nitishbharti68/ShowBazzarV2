import 'package:flutter/material.dart';

class SortScreen extends StatefulWidget {
  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  List<String> sortingOptions = ['Option 1', 'Option 2', 'Option 3'];
  late String selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sort Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select Sorting Option:',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            DropdownButton<String>(
              value: selectedOption,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: sortingOptions.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Perform sorting based on selectedOption
                // For example:
                // if(selectedOption == 'Option 1') {
                //   // Sort according to Option 1 logic
                // }
                // Add your sorting logic here
                Navigator.pop(context, selectedOption); // Return selected sorting option
              },
              child: const Text('Apply Sorting'),
            ),
          ],
        ),
      ),
    );
  }
}

// Example usage:
// To open SortScreen and get selected sorting option:
// String selectedSortingOption = await Navigator.push(context, MaterialPageRoute(builder: (context) => SortScreen()));

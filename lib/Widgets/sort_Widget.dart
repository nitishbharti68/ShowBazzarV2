import 'package:flutter/material.dart';

class SortWidget extends StatefulWidget {
  @override
  _SortWidgetState createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  String _selectedSortOption = 'Relevance';
  bool _isSortMenuVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (!_isSortMenuVisible)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isSortMenuVisible = true;
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.sort,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Sort by',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (_isSortMenuVisible)
            Stack(
              children: [
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: _isSortMenuVisible ? 350 : 0,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'SORT BY:',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _isSortMenuVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                        buildSortOption('Relevance'),
                        buildSortOption('Popularity'),
                        buildSortOption('Price -> Low to High'),
                        buildSortOption('Price -> High to Low'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildSortOption(String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: _selectedSortOption == value
            ? const Icon(Icons.check_circle, color: Colors.blue)
            : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
        title: Text(value),
        onTap: () {
          setState(() {
            _selectedSortOption = value;
            _isSortMenuVisible = false;
          });
        },
      ),
    );
  }
}

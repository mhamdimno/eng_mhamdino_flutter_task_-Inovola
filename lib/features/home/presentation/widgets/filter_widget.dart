import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

// ignore: must_be_immutable
class FilterableListScreen extends StatefulWidget {
  const FilterableListScreen({super.key, required this.onSelectItem});
  final Function(String) onSelectItem;

  @override
  State<FilterableListScreen> createState() => _FilterableListScreenState();
}

class _FilterableListScreenState extends State<FilterableListScreen> {
  String _selectedFilter = 'All';
  // Initial selected value

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: context.customColorStyle?.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: context.customColorStyle?.lightGrey,
          value: _selectedFilter,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          style: Theme.of(context)
              .textTheme
              .bodySmall, // Apply the same text style
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedFilter = newValue; // Update the selected filter
              });
              widget.onSelectItem(
                  newValue); // Call the callback with the current date
            }
          },
          items: <String>[
            'All',
            'This month',
            'Last month',
            'Last 7 days',
            'Last year'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: AppText(value), // Use AppText for consistency
            );
          }).toList(),
        ),
      ),
    );
  }
}

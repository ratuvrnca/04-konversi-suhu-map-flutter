import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown(
      {Key? key,
      required this.listItem,
      required this.selectedDropdown,
      required this.onDropdownChange})
      : super(key: key);

  final List<String> listItem;
  final String selectedDropdown;
  final Function(dynamic) onDropdownChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      items: listItem.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        );
      }).toList(),
      value: selectedDropdown,
      onChanged: onDropdownChange,
    );
  }
}

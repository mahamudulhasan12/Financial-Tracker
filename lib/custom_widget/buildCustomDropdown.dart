import 'package:flutter/material.dart';

import 'apptext.dart';

Widget BuildCustomDropdown({
  required String value,
  required List<String> items,
  required Widget prefixIcon,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200, width: 1.5),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                prefixIcon,
                const SizedBox(width: 12),
                AppText(text: item, fontSize: 15, fontWeight: FontWeight.w500),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}


import 'package:flutter/material.dart';

Widget SectionHeader(String sectionName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        color: const Color.fromARGB(255, 255, 200, 0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          sectionName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          // Add your navigation or action here
        },
        child: Text(
          'Lihat Semua',
          style: TextStyle(
            color: const Color.fromARGB(255, 12, 12, 10),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

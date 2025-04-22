import 'package:flutter/material.dart';

class MyFormFieldCard extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? subtitle;

  const MyFormFieldCard({super.key, required this.child, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
        ],
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
        ],
        child,
      ],
    );
  }
}

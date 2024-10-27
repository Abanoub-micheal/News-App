import 'package:flutter/material.dart';
import '../../model/source.dart';

class TabItem extends StatelessWidget {
 final Source source;
  final bool isSelected;
 const TabItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 18),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}

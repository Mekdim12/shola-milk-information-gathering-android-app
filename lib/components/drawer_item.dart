import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.name, required this.icon, required this.onPressed});

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 18,
        child: Row(
          children: [
            Icon(icon, size: 15, color: Colors.white,),
            const SizedBox(width: 40,),
            Text(name, style: const TextStyle(fontSize: 14, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
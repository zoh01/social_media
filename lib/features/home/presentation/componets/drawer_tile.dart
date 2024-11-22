import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;

  final IconData icon;
  final void Function()? onTap;

  const DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontFamily: 'Roboto'),),
      leading: Icon(icon),
      onTap: onTap,
    );
  }
}

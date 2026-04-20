import 'package:flutter/material.dart';

class TopNav extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onHome, onInfo, onProgram, onGalleri, onContact;
  const TopNav({
    super.key,
    required this.onHome,
    required this.onInfo,
    required this.onProgram,
    required this.onGalleri,
    required this.onContact,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF412402),
      foregroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Rapsvägen 2026',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      actions: [
        _NavButton('Hem', onHome),
        _NavButton('Info', onInfo),
        _NavButton('Program', onProgram),
        _NavButton('Galleri', onGalleri),
        _NavButton('Kontakt', onContact),
        const SizedBox(width: 8),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton(this.label, this.onTap);
  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onTap,
    child: Text(
      label,
      style: const TextStyle(color: Colors.white70, fontSize: 13),
    ),
  );
}

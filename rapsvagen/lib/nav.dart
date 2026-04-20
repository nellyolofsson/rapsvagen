import 'package:flutter/material.dart';

const kAmber900 = Color(0xFF412402);

// ── Top nav ───────────────────────────────────────────────────────────────────
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return AppBar(
          backgroundColor: kAmber900,
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Rapsvägen 2026',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          actions: constraints.maxWidth < 500
              ? [
                  _NavMenuButton(
                    onHome: onHome,
                    onInfo: onInfo,
                    onProgram: onProgram,
                    onGalleri: onGalleri,
                    onContact: onContact,
                  ),
                ]
              : [
                  _NavButton('Hem', onHome),
                  _NavButton('Info', onInfo),
                  _NavButton('Program', onProgram),
                  _NavButton('Galleri', onGalleri),
                  _NavButton('Kontakt', onContact),
                  const SizedBox(width: 8),
                ],
        );
      },
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

class _NavMenuButton extends StatelessWidget {
  final VoidCallback onHome, onInfo, onProgram, onGalleri, onContact;
  const _NavMenuButton({
    required this.onHome,
    required this.onInfo,
    required this.onProgram,
    required this.onGalleri,
    required this.onContact,
  });
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.menu, color: Colors.white),
      onSelected: (value) {
        switch (value) {
          case 0:
            onHome();
            break;
          case 1:
            onInfo();
            break;
          case 2:
            onProgram();
            break;
          case 3:
            onGalleri();
            break;
          case 4:
            onContact();
            break;
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 0, child: Text('Hem')),
        const PopupMenuItem(value: 1, child: Text('Info')),
        const PopupMenuItem(value: 2, child: Text('Program')),
        const PopupMenuItem(value: 3, child: Text('Galleri')),
        const PopupMenuItem(value: 4, child: Text('Kontakt')),
      ],
    );
  }
}

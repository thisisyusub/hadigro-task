import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

        widget.pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
      items: [
        BottomNavigationBarItem(
          label: localizations.bookings,
          icon: const Icon(CupertinoIcons.tickets),
        ),
        const BottomNavigationBarItem(
          label: 'QR Code',
          icon: Icon(CupertinoIcons.qrcode),
        ),
        const BottomNavigationBarItem(
          label: 'About',
          icon: Icon(CupertinoIcons.info),
        ),
      ],
    );
  }
}

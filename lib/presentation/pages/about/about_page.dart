import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/assets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaData = MediaQuery.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: mediaData.viewPadding.top + 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.logo,
            width: mediaData.size.width * 0.8,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppLocalizations.of(context).hadigroDescription,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

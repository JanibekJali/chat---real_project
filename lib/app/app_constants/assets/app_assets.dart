import 'package:flutter_svg/svg.dart';

class AppAssets {
  static const String _illustrations = 'assets/vectors/illustrations';
  static const String _icons = 'assets/vectors/icons';
  static final Map<String, String> _paths = {
    // illustration
    'walkthrough': '$_illustrations/walkthrough.svg',
    // icons
    'chat_icons': '$_icons/chat_icon.svg',
  };
  static SvgPicture walkthrough({double? height}) {
    return SvgPicture.asset(
      _paths['walkthrough']!,
      height: height,
    );
  }
}

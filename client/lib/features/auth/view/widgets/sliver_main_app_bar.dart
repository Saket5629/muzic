import 'package:flutter/material.dart';

class SliverMainAppBar extends StatefulWidget {
  const SliverMainAppBar({
    super.key,
    required this.fromScreen,
    required this.isFromScreen,
    required this.userProfileOnTap,
    required this.title,
    required this.preferredBottomHeight,
    required this.bottom,
    this.onTapOverride,
  });

  final String fromScreen;
  final bool isFromScreen;
  final VoidCallback userProfileOnTap;
  final String title;
  final double preferredBottomHeight;
  final Widget bottom;
  final VoidCallback? onTapOverride;

  @override
  State<SliverMainAppBar> createState() => _SliverMainAppBarState();
}

class _SliverMainAppBarState extends State<SliverMainAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

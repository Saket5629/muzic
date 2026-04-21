import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:muzic/constants/assets_constants.dart';
import "package:flutter_svg/flutter_svg.dart";

class SliverMainAppBar extends StatefulWidget {
  const SliverMainAppBar({
    super.key,
    required this.from,
    required this.fromScreen,
    required this.profileOnTap,
    required this.title,
    this.preferredBottomHeight,
    required this.bottom,
    this.onTapOverride,
    this.onDoubleTapOverride,
    this.onLongPressOverride,
  });

  final String from;
  final String fromScreen;
  final VoidCallback profileOnTap;
  final String title;
  final double? preferredBottomHeight;
  final Widget bottom;
  final VoidCallback? onTapOverride;
  final VoidCallback? onDoubleTapOverride;
  final VoidCallback? onLongPressOverride;

  @override
  State<SliverMainAppBar> createState() => _SliverMainAppBarState();
}

class _SliverMainAppBarState extends State<SliverMainAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                log("Profile icon tapped");
                widget.profileOnTap();
              },
              child: SvgPicture.asset(AssetsConstants.userProfileAvatarIcon, height: 30, width: 30),
            ),
          ),
        ],
      ),
    );
  }
}

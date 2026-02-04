import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';

part 'custom_fonts.dart';

class ThemeConstants {
  const ThemeConstants._();

  static TextStyle customTextStyleMapper({
    double? fontSize,
    String? fontWeight,
    String? fontFamily,
    HexColor? fontColor,
  }) {
    TextStyle retTextStyle;

    switch (fontFamily) {
      case "HN":
        retTextStyle = CustomFonts.helveticaNeue();
        break;
      case "ARMTB":
        retTextStyle = CustomFonts.arialRoundedMTBold();
        break;
      default:
        retTextStyle = CustomFonts.arialRoundedMTBold();
        break;
    }

    retTextStyle = retTextStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight == null ? null : fontWeightMapping[fontWeight],
      color: fontColor,
    );

    return retTextStyle;
  }

   /// Global/App level color schemes.
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color foregroundColor = Colors.white;
  static const Color msgColor = Color(0xFF838386);
  static const Color veticBrandingColor = Color(0xFFEC4F68);

  static const Color lightSky = Color(0xFFBFDBFE);
  static const Color textColor = Colors.black;
  static const Color lightNavyBlue = Color(0xFF354259);
  static const Color textColorGrey = Color(0xFFA0AABB);
  static const Color buttonBackground = textColor;
  static const Color successBackground = Color(0xFF193A6A);
  static const Color offerBackground1 = Color(0xFFFFE2C7);
  static const Color offerBackground2 = Color(0xFFEDEDED);
  static const Color confirmColor = Color(0xFFDCFFD7);
  static const Color pendingColor = Color(0xFFFFE99A);
  static const Color skyBlue = Color(0xFF6BACF0);
  static const Color green = Color(0xFF19AC44);
  static const Color newGrey = Color(0xFFE8EBF0);
  static final Color grey = const Color(0xFF193A6A).withValues(alpha: 0.3);
  static const Color altGreen = Color(0xFFAAFFA8);
  static const Color lightGreen = Color(0xFF3FCF87);
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color offWhite = Color(0xFFF8F9FA);
  static const Color greyBorder = Color(0x1A296226);
  static const Color pink = Color(0xFFFCA2A2);
  static const Color coralPink = Color(0xFFF05B72);
  static const Color red = Color(0xFFF94F3E);
  static const Color greyPoint = Color(0xFFD9D9D9);
  static const Color buttonColor = Color(0xFF193A6A);
  static const Color altBlue = Color(0xFF1A3A69);
  static const Color lightBlue = Color(0xFFE4EDFD);
  static final Color lightestBlue = const Color(0xFF97A7E5).withValues(alpha: .15);
  static const Color lightBlueBorder = Color(0xFFBFDBFE);
  static const Color yellow = Color(0xFFFFB543);
  static const Color newBlue = Color(0xFF6BA1F1);
  static const Color blueOrder = Color(0xFF78C1F3);
  static const Color newGreen = Color(0xFF239A3D);
  static const Color borderLite = Color(0xFFEAEAEA);
  static final Color greyButton = const Color(0xFF354259).withValues(alpha: 0.1);
  static const Color inviteBtnColor = Color(0xFF199016);
  static const Color greyCircleColor = Color(0xFFD9D9D9);
  static const Color bookingConfirmationCardColor = Color(0xFFDBF2FF);
  static const Color editBtnColor = Color(0xFF354259);
  static final Color loadingColourBg = const Color(0xFFDBDBDB).withValues(alpha: 1);
  static const Color loadingColourIn = Color(0xFFF5F5F5);
  static const Color orange = Color(0xFFE58D43);
  static const Color blue = Color(0xFF2675E2);
  static const Color lightSky2 = Color(0xFFEFF6FF);
  static const Color greyColor = Color(0xFFF4F4F4);
  static const Color expiredColor = Color(0xFFF04E4E);
  static const Color nonMemberCard = Color(0XFFE6F4F8);
  static const Color darkGreen = Color(0XFF177115);
  static const Color creamColor = Color(0XFFFFF5E9);
  static const Color orderConfirmationColor = Color(0XFF19AC44);
  static const Color imageBackgroundColor = Color(0xFFF4F6FA);
  static const Color errorMsgColor = Color(0xFFFF0303);
  static const Color removeCouponColor = Color(0xFFF79540);
  static const Color chooseAddressColor = Color(0xFFFFEFEF);
  static const Color addButtonBackGroundColor = Color(0xFFF0F6FF);
  static const Color viewOderColor = Color(0xFFF1FBFF);
  static const Color pendingOrderColor = Color(0xFFFFD100);
  static const Color defaultAddressColor = Color(0xFF0172BE);
  static const Color notifyMeColor = Color(0xFFEEF6FF);
  static const Color saveTextColor = Color(0xFF493AA3);
  static const Color saveTextBackGroundColor = Color(0xFFE7E3FF);
  static const Color getItColor = Color(0xFFF09200);
  static const Color dullWhite = Color(0xFFF2F4F6);
  static const Color pdpCouponBackground = Color(0xFFF2F4F6);
  static const Color petProfileColor = Color(0xFF475467);
  static final Color petCardBorder = petProfileColor.withValues(alpha: 0.15);
  static const Color petProfileRed = Color(0xFFF90000);
  static final Color petProfileBorderColor = const Color(0xFF111827).withValues(alpha: 0.1);
  static final Color servicesCardColor = const Color(0xFFEAFFE9);
  static const Color fteGreenColor = Color(0xFFF6FFF3);

  static const Color pendingPaymentBackgroundColor = Color(0xFFFFDE68);
  static const Color failedPaymentBackgroundColor = Color(0xFFFFE9E9);
  static const Color failedPaymentTextColor = Color(0xFFEB3125);

  static const Color slotCardColor = Color(0xFFFBFBFB);
  static const Color slotMessageColor = Color(0xFFCD6C20);
  static const Color slotSecondaryMessageColor = Color(0xFFFFF6EF);
  static const Color slotTimeCardBgColor = Color(0xFFEFF5FF);
  static const Color slotBottomMsgColor = Color(0xFF1E1E1E);
  static const Color newGreenColor = Color(0xFF239A3D);
  static const Color newYellowColor = Color(0xFFF0C017);
  static const Color shellYellowColor = Color(0xFFDFC800);
  static const Color dotGrey = Color(0xFFE6E6E6);
  static const Color nuGrey = Color(0xFF6C7685);
  static final Color nuGreyBorderOp10p = nuGrey.withValues(alpha: 0.1);
  static final Color nuGreyBorderOp20p = nuGrey.withValues(alpha: 0.2);
  static const Color shellGreenColor = Color(0xFFF4FFEF);
  static const Color darkGreyColor = Color(0xFF595959);
  static const Color nuLightGreyColor = Color(0xFFE2E2E2);
  static const Color nuSemiDarkGreyColor = Color(0xFFADADAE);

  static const Color lotusRedColor = Color(0xFF804140);
  static const Color veryLightGreenCyanColor = Color(0xFFE9FFEE);

  static const Color nonServiceableColor = Color(0xFFFF0004);
  static const Color nonServiceableTextBackgroundColor = Color(0xFFFFE3E3);
  static const Color nonServiceableTextColor = Color(0xFFF73353);
  static const Color cloudMistColor = Color(0xFFF8F8F8);
  static const Color darkGreenColor = Color(0xFF026520);
  static const Color graphiteGreyColor = Color(0xFF667085);
  static const Color charcoalGrey = Color(0xFF535355);
  static const Color mintWhiteColor = Color(0xFFFBFFFC);
  static const Color iceBlueColor = Color(0xFFF5FDFF);
  static const Color deepGreenColor = Color(0xFF02632B);
  static const Color mintCreamColor = Color(0xFFDDFFEC);

  static const Color labReportStatusChipCardColor = Color(0xFF535355);

  static const Color prescriptionDateColor = Color(0xFFFF7D7F);

  static const Color concreteGrey = Color(0xFF7A7A7A);

  static const Color nickelGrey = Color(0xFF7B7B7B);

  static const Color reasonComponentBackground = Color(0xFFF4F4F4);

  static const Color mediumGrey = Color(0xFF666666);

  static const Color slotNoteColor = Color(0xFF383F47);

  static const Color dimGrayColor = Color(0xFF6E6E6E);
  static const Color emraldGreen = Color(0xFF018918);

  static const Color palePink = Color(0xFFFFF5F7);
  static const Color slateGrayColor = Color(0xFF808DA0);
  static const Color veryLightGrayColor = Color(0xFFF6F6F6);
  static const Color paleMintGreenColor = Color(0xFFE6FFEB);
  static const Color crimsonRedColor = Color(0xFFE10101);
  static const Color deepGreen = Color(0xFF01891F);
  static const Color lightGrayColor = Color(0xFFEAEAEB);
  static const Color limeGreenColor = Color(0xFF00821D);
  static const Color dustyGray = Color(0xFF8F8D8D);
  static const Color babyPink = Color(0xFFFFF6FA);
  static const Color softGray = Color(0xF9FAFAFA);
  
  static const Color ivory = Color(0xFFFFFDEE);

  static const List<Color> radialGradientBlack = [
    Color(0xFF1A1918),
    Color(0xFF3A3A3A),
    Color(0xFF1D1C1B),
  ];
  static const List<Color> membershipGradient = [
    Color(0xFFEFFDD8),
    Color(0xFFF1FAFF),
    Color(0xFFE5EDFF),
  ];
  static const List<Color> radialGradientBlue = [
    Color(0xFF162541),
    Color(0xFF2D415F),
    Color(0xFF16253C),
  ];

  static const List<Color> giftOverlayCartImageGradient = [
    Color(0xFFD24FAC),
    Color(0xFF9838C1),
  ];

  static final fontWeightMapping = {
    "100": FontWeight.w100,
    "200": FontWeight.w200,
    "300": FontWeight.w300,
    "400": FontWeight.w400,
    "500": FontWeight.w500,
    "600": FontWeight.w600,
    "700": FontWeight.w700,
    "800": FontWeight.w800,
    "900": FontWeight.w900,
    "w100": FontWeight.w100,
    "w200": FontWeight.w200,
    "w300": FontWeight.w300,
    "w400": FontWeight.w400,
    "w500": FontWeight.w500,
    "w600": FontWeight.w600,
    "w700": FontWeight.w700,
    "w800": FontWeight.w800,
    "w900": FontWeight.w900,
    "normal": FontWeight.w400,
    "regular": FontWeight.w400,
    "light": FontWeight.w300,
    "medium": FontWeight.w500,
    "semiBold": FontWeight.w600,
    "bold": FontWeight.w700,
  };

  static final boxFitMapping = {
    "fill": BoxFit.fill,
    "cover": BoxFit.cover,
    "contain": BoxFit.contain,
    "fit_height": BoxFit.fitHeight,
    "fit_width": BoxFit.fitWidth,
    "none": BoxFit.none,
    "scale_down": BoxFit.scaleDown,
  };

  static final alignmentMapping = {
    "top_left": Alignment.topLeft,
    "top_center": Alignment.topCenter,
    "top_right": Alignment.topRight,
    "center_left": Alignment.centerLeft,
    "center": Alignment.center,
    "center_right": Alignment.centerRight,
    "bottom_left": Alignment.bottomLeft,
    "bottom_center": Alignment.bottomCenter,
    "bottom_right": Alignment.bottomRight,
  };

  static final textAlignMapping = {
    "start": TextAlign.start,
    "left": TextAlign.left,
    "center": TextAlign.center,
    "end": TextAlign.end,
    "justify": TextAlign.justify,
    "right": TextAlign.right,
  };
}

class AppPadding {
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s13 = 13.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s21 = 21.0;
  static const double s48 = 48.0;
}

class SizeConfig {
  const SizeConfig._();

  static late Size screenSize;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;

  static void initSizeConfig(BuildContext context, {double designWidth = 360}) {
    screenSize = MediaQuery.sizeOf(context);
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;

    // Calculate a scaling factor based on the design width
    final double scalingFactor = screenWidth / designWidth;

    // Update multipliers with scaling factor
    textMultiplier *= scalingFactor;
    imageSizeMultiplier *= scalingFactor;
    heightMultiplier *= scalingFactor;
  }
}
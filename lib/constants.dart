import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'device.dart';


class Constants{

  static double header =  Device.get().isPhone?16:24;
  static double subHeader =  Device.get().isPhone?14:20;
  static double title =  Device.get().isPhone?20:28;
  static double wSideBoxWidth = Device.get().isPhone?2:10;

  static Size loginButtonSize = Device.get().isPhone?const Size(180, 50):const Size(240, 65);

  static double toolbarHeight = Device.get().isPhone?60:90;
  static double bottomNavigationHeight = Device.get().isPhone?60:75;
  static double iconSize = Device.get().isPhone?25:35;
  static double iconSizeCard = Device.get().isPhone?20:30;

  static String pieRadius = Device.get().isPhone?"100":"200";
  static double pieContainerHeight = Device.get().isPhone?250:500;

   final detailsBodyStyle = GoogleFonts.lato(fontSize: subHeader,fontWeight: FontWeight.w600);

   static double sizeBoxHeight = Device.get().isPhone?10:30;
   static double followUsGap = Device.get().isPhone?120:240;
   static double loginFormWidth = Device.get().isPhone?double.infinity:600;

  static double taxiCardTop = Device.get().isPhone?30:40;

}
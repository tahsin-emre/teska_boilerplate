import 'package:flutter/material.dart';
import 'package:teska_boilerplate/product/utils/constants/app_sizes.dart';

extension _RadiusExtension on double {
  Radius toRadius() => Radius.circular(this);
}

final class AppRadius {
  // All Sides
  static const BorderRadius zero = BorderRadius.zero;
  static final all2 = BorderRadius.all(
    AppSizes.spacing2.toRadius(),
  );
  static final all4 = BorderRadius.all(
    AppSizes.spacing4.toRadius(),
  );
  static final all6 = BorderRadius.all(
    AppSizes.spacing6.toRadius(),
  );
  static final all8 = BorderRadius.all(
    AppSizes.spacing8.toRadius(),
  );
  static final all10 = BorderRadius.all(
    AppSizes.spacing10.toRadius(),
  );
  static final all12 = BorderRadius.all(
    AppSizes.spacing12.toRadius(),
  );
  static final all16 = BorderRadius.all(
    AppSizes.spacing16.toRadius(),
  );
  static final all20 = BorderRadius.all(
    AppSizes.spacing20.toRadius(),
  );
  static final all24 = BorderRadius.all(
    AppSizes.spacing24.toRadius(),
  );
  static final all28 = BorderRadius.all(
    AppSizes.spacing28.toRadius(),
  );
  static final all32 = BorderRadius.all(
    AppSizes.spacing32.toRadius(),
  );
  static final all40 = BorderRadius.all(
    AppSizes.spacing48.toRadius(),
  );
  static final all48 = BorderRadius.all(
    AppSizes.spacing48.toRadius(),
  );
  static final all56 = BorderRadius.all(
    AppSizes.spacing56.toRadius(),
  );
  static final all64 = BorderRadius.all(
    AppSizes.spacing64.toRadius(),
  );
  static final all72 = BorderRadius.all(
    AppSizes.spacing72.toRadius(),
  );
  static final all80 = BorderRadius.all(
    AppSizes.spacing80.toRadius(),
  );
  static final all88 = BorderRadius.all(
    AppSizes.spacing88.toRadius(),
  );
  static final all96 = BorderRadius.all(
    AppSizes.spacing96.toRadius(),
  );
  static final all100 = BorderRadius.all(
    AppSizes.spacing100.toRadius(),
  );

  // Only topLeft bottomLeft
  static final topLeft2 = BorderRadius.only(
    topLeft: AppSizes.spacing2.toRadius(),
  );
  static final topLeft4 = BorderRadius.only(
    topLeft: AppSizes.spacing4.toRadius(),
  );
  static final topLeft6 = BorderRadius.only(
    topLeft: AppSizes.spacing6.toRadius(),
  );
  static final topLeft8 = BorderRadius.only(
    topLeft: AppSizes.spacing8.toRadius(),
  );
  static final topLeft10 = BorderRadius.only(
    topLeft: AppSizes.spacing10.toRadius(),
  );
  static final topLeft12 = BorderRadius.only(
    topLeft: AppSizes.spacing12.toRadius(),
  );
  static final topLeft16 = BorderRadius.only(
    topLeft: AppSizes.spacing16.toRadius(),
  );
  static final topLeft20 = BorderRadius.only(
    topLeft: AppSizes.spacing20.toRadius(),
  );
  static final topLeft24 = BorderRadius.only(
    topLeft: AppSizes.spacing24.toRadius(),
  );
  static final topLeft28 = BorderRadius.only(
    topLeft: AppSizes.spacing28.toRadius(),
  );
  static final topLeft32 = BorderRadius.only(
    topLeft: AppSizes.spacing32.toRadius(),
  );
  static final topLeft40 = BorderRadius.only(
    topLeft: AppSizes.spacing48.toRadius(),
  );
  static final topLeft48 = BorderRadius.only(
    topLeft: AppSizes.spacing48.toRadius(),
  );
  static final topLeft56 = BorderRadius.only(
    topLeft: AppSizes.spacing56.toRadius(),
  );
  static final topLeft64 = BorderRadius.only(
    topLeft: AppSizes.spacing64.toRadius(),
  );
  static final topLeft72 = BorderRadius.only(
    topLeft: AppSizes.spacing72.toRadius(),
  );
  static final topLeft80 = BorderRadius.only(
    topLeft: AppSizes.spacing80.toRadius(),
  );
  static final topLeft88 = BorderRadius.only(
    topLeft: AppSizes.spacing88.toRadius(),
  );
  static final topLeft96 = BorderRadius.only(
    topLeft: AppSizes.spacing96.toRadius(),
  );
  static final topLeft100 = BorderRadius.only(
    topLeft: AppSizes.spacing100.toRadius(),
  );

  // Only bottomRight

  static final bottomRight2 = BorderRadius.only(
    bottomRight: AppSizes.spacing2.toRadius(),
  );
  static final bottomRight4 = BorderRadius.only(
    bottomRight: AppSizes.spacing4.toRadius(),
  );
  static final bottomRight6 = BorderRadius.only(
    bottomRight: AppSizes.spacing6.toRadius(),
  );
  static final bottomRight8 = BorderRadius.only(
    bottomRight: AppSizes.spacing8.toRadius(),
  );
  static final bottomRight10 = BorderRadius.only(
    bottomRight: AppSizes.spacing10.toRadius(),
  );
  static final bottomRight12 = BorderRadius.only(
    bottomRight: AppSizes.spacing12.toRadius(),
  );
  static final bottomRight16 = BorderRadius.only(
    bottomRight: AppSizes.spacing16.toRadius(),
  );
  static final bottomRight20 = BorderRadius.only(
    bottomRight: AppSizes.spacing20.toRadius(),
  );
  static final bottomRight24 = BorderRadius.only(
    bottomRight: AppSizes.spacing24.toRadius(),
  );
  static final bottomRight28 = BorderRadius.only(
    bottomRight: AppSizes.spacing28.toRadius(),
  );
  static final bottomRight32 = BorderRadius.only(
    bottomRight: AppSizes.spacing32.toRadius(),
  );
  static final bottomRight40 = BorderRadius.only(
    bottomRight: AppSizes.spacing48.toRadius(),
  );
  static final bottomRight48 = BorderRadius.only(
    bottomRight: AppSizes.spacing48.toRadius(),
  );
  static final bottomRight56 = BorderRadius.only(
    bottomRight: AppSizes.spacing56.toRadius(),
  );
  static final bottomRight64 = BorderRadius.only(
    bottomRight: AppSizes.spacing64.toRadius(),
  );
  static final bottomRight72 = BorderRadius.only(
    bottomRight: AppSizes.spacing72.toRadius(),
  );
  static final bottomRight80 = BorderRadius.only(
    bottomRight: AppSizes.spacing80.toRadius(),
  );
  static final bottomRight88 = BorderRadius.only(
    bottomRight: AppSizes.spacing88.toRadius(),
  );
  static final bottomRight96 = BorderRadius.only(
    bottomRight: AppSizes.spacing96.toRadius(),
  );
  static final bottomRight100 = BorderRadius.only(
    bottomRight: AppSizes.spacing100.toRadius(),
  );

  // Only bottomLeft
  static final bottomLeft2 = BorderRadius.only(
    bottomLeft: AppSizes.spacing2.toRadius(),
  );
  static final bottomLeft4 = BorderRadius.only(
    bottomLeft: AppSizes.spacing4.toRadius(),
  );
  static final bottomLeft6 = BorderRadius.only(
    bottomLeft: AppSizes.spacing6.toRadius(),
  );
  static final bottomLeft8 = BorderRadius.only(
    bottomLeft: AppSizes.spacing8.toRadius(),
  );
  static final bottomLeft10 = BorderRadius.only(
    bottomLeft: AppSizes.spacing10.toRadius(),
  );
  static final bottomLeft12 = BorderRadius.only(
    bottomLeft: AppSizes.spacing12.toRadius(),
  );
  static final bottomLeft16 = BorderRadius.only(
    bottomLeft: AppSizes.spacing16.toRadius(),
  );
  static final bottomLeft20 = BorderRadius.only(
    bottomLeft: AppSizes.spacing20.toRadius(),
  );
  static final bottomLeft24 = BorderRadius.only(
    bottomLeft: AppSizes.spacing24.toRadius(),
  );
  static final bottomLeft28 = BorderRadius.only(
    bottomLeft: AppSizes.spacing28.toRadius(),
  );
  static final bottomLeft32 = BorderRadius.only(
    bottomLeft: AppSizes.spacing32.toRadius(),
  );
  static final bottomLeft40 = BorderRadius.only(
    bottomLeft: AppSizes.spacing48.toRadius(),
  );
  static final bottomLeft48 = BorderRadius.only(
    bottomLeft: AppSizes.spacing48.toRadius(),
  );
  static final bottomLeft56 = BorderRadius.only(
    bottomLeft: AppSizes.spacing56.toRadius(),
  );
  static final bottomLeft64 = BorderRadius.only(
    bottomLeft: AppSizes.spacing64.toRadius(),
  );
  static final bottomLeft72 = BorderRadius.only(
    bottomLeft: AppSizes.spacing72.toRadius(),
  );
  static final bottomLeft80 = BorderRadius.only(
    bottomLeft: AppSizes.spacing80.toRadius(),
  );
  static final bottomLeft88 = BorderRadius.only(
    bottomLeft: AppSizes.spacing88.toRadius(),
  );
  static final bottomLeft96 = BorderRadius.only(
    bottomLeft: AppSizes.spacing96.toRadius(),
  );
  static final bottomLeft100 = BorderRadius.only(
    bottomLeft: AppSizes.spacing100.toRadius(),
  );

  // Only topRight
  static final topRight2 = BorderRadius.only(
    topRight: AppSizes.spacing2.toRadius(),
  );
  static final topRight4 = BorderRadius.only(
    topRight: AppSizes.spacing4.toRadius(),
  );
  static final topRight6 = BorderRadius.only(
    topRight: AppSizes.spacing6.toRadius(),
  );
  static final topRight8 = BorderRadius.only(
    topRight: AppSizes.spacing8.toRadius(),
  );
  static final topRight10 = BorderRadius.only(
    topRight: AppSizes.spacing10.toRadius(),
  );
  static final topRight12 = BorderRadius.only(
    topRight: AppSizes.spacing12.toRadius(),
  );
  static final topRight16 = BorderRadius.only(
    topRight: AppSizes.spacing16.toRadius(),
  );
  static final topRight20 = BorderRadius.only(
    topRight: AppSizes.spacing20.toRadius(),
  );
  static final topRight24 = BorderRadius.only(
    topRight: AppSizes.spacing24.toRadius(),
  );
  static final topRight28 = BorderRadius.only(
    topRight: AppSizes.spacing28.toRadius(),
  );
  static final topRight32 = BorderRadius.only(
    topRight: AppSizes.spacing32.toRadius(),
  );
  static final topRight40 = BorderRadius.only(
    topRight: AppSizes.spacing48.toRadius(),
  );
  static final topRight48 = BorderRadius.only(
    topRight: AppSizes.spacing48.toRadius(),
  );
  static final topRight56 = BorderRadius.only(
    topRight: AppSizes.spacing56.toRadius(),
  );
  static final topRight64 = BorderRadius.only(
    topRight: AppSizes.spacing64.toRadius(),
  );
  static final topRight72 = BorderRadius.only(
    topRight: AppSizes.spacing72.toRadius(),
  );
  static final topRight80 = BorderRadius.only(
    topRight: AppSizes.spacing80.toRadius(),
  );
  static final topRight88 = BorderRadius.only(
    topRight: AppSizes.spacing88.toRadius(),
  );
  static final topRight96 = BorderRadius.only(
    topRight: AppSizes.spacing96.toRadius(),
  );
  static final topRight100 = BorderRadius.only(
    topRight: AppSizes.spacing100.toRadius(),
  );
}

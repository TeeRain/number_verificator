import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_verificator/config/theme/colors.dart';
import 'package:number_verificator/config/theme/fonts.dart';

void showPicker({
  required BuildContext context,
  required void Function(Country) onSelect,
}) =>
    showCountryPicker(
      context: context,
      onSelect: onSelect,
      countryListTheme: _MyCountryPickerThemeData(),
      showPhoneCode: true,
    );

class _MyCountryPickerThemeData extends CountryListThemeData {
  @override
  double? get flagSize => 25;

  // @override
  // TextStyle? get titleStyle => primaryInterStyle;

  // @override
  // TextStyle? get numberStyle => codeInterStyle;

  @override
  TextStyle? get searchTextStyle => codeInterStyle;

  @override
  TextStyle? get textStyle =>
      GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500);

  @override
  InputDecoration? get inputDecoration => InputDecoration(
        contentPadding: const EdgeInsets.all(14),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16.0),
        ),
        filled: true,
        fillColor: containerColor,
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: primaryColor,
        iconColor: primaryColor,
        hintText: 'Search',
      );

  @override
  BorderRadius? get borderRadius => const BorderRadius.vertical(
        top: Radius.circular(25.0),
      );

  @override
  Color? get backgroundColor => bgColor;
}

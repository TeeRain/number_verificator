import 'package:flutter/material.dart';
import 'package:number_verificator/config/theme/fonts.dart';

class CodeSelector extends StatelessWidget {
  final String countryCode;
  final String phoneCode;
  const CodeSelector(
      {super.key, required this.countryCode, required this.phoneCode});

  @override
  Widget build(BuildContext context) {
    String countryCodeToEmoji(String countryCode) {
      final int firstLetter =
          countryCode.toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
      final int secondLetter =
          countryCode.toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;
      return String.fromCharCode(firstLetter) +
          String.fromCharCode(secondLetter);
    }

    return Row(
      children: [
        countryCode.isNotEmpty
            ? Text(countryCodeToEmoji(countryCode),
                style: const TextStyle(fontSize: 20))
            : const Icon(Icons.flag, size: 20),
        Text('+$phoneCode', style: codeInterStyle)
      ],
    );
  }
}

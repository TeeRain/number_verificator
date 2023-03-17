import 'package:flutter/material.dart';
import 'package:number_verificator/config/theme/colors.dart';

class NumberDialog extends StatelessWidget {
  final String phoneCode;
  final String countryCode;
  final bool isFull;
  final String number;

  const NumberDialog(
      {super.key,
      required this.countryCode,
      required this.phoneCode,
      required this.isFull,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_forward,
        color: primaryColor,
      ),
      onPressed: isFull && countryCode.isNotEmpty
          ? () => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Phone number"),
                  content: Text("Your phone number is: +$phoneCode $number"),
                );
              })
          : null,
    );
  }
}

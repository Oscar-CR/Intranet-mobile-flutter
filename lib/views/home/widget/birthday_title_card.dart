import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';

class BirthdayTitleCard extends StatefulWidget {
  const BirthdayTitleCard({Key? key})
      : super(key: key);


  @override
  State<BirthdayTitleCard> createState() => _BirthdayTitleCardState();
}

class _BirthdayTitleCardState extends State<BirthdayTitleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: const Center(
        child: Text(
          StringIntranetConstants.homeBirthdayTitle,
          style: TextStyle(
            fontSize: 18.00,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

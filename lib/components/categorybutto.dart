import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume_admin/utils/colors.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? colortext : hintcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                if (isSelected)
                  SvgPicture.asset(
                    'assets/images/tickk.svg',
                    // Adjust the width and height as needed
                    width: 16,
                    height: 16,
                  ),
                SizedBox(width: isSelected ? 8 : 0), // Add some spacing if the tick is shown
                Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? Colors.white : colortext,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.08,
                    letterSpacing: 0.96,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

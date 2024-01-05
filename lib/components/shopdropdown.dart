// Assuming you have a Shop model similar to City
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hume_admin/models/shops.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShopDropdownField extends StatelessWidget {
  const ShopDropdownField({
    Key? key,
    this.imageIcon,
    required this.selectedValue,
    required this.items,
    required this.icon,
    required this.onChange,
  }) : super(key: key);

  final imageIcon;
  final dynamic selectedValue;
  final List<Shop> items;
  final Widget icon;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: hintcolor,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SvgPicture.asset(
                    imageIcon,
                    height: 18,
                    width: 18,
                  ),
                ),
                Text(
                  'Select Shop',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            items: items
                .map(
                  (item) => DropdownMenuItem<Shop>(
                    value: item,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: NetworkImage(item
                                      .logoImageUrl!), 
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              item.name.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              onChange(value);
            },
            // Add other properties here as needed
          ),
        ),
      ),
    );
  }
}

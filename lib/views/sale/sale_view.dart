// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/sale/sale_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  List<String> shops = ['Shop 1', 'Shop 2', 'Shop 3'];
  String selectedShop = 'Select a shop';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaleController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          title: TitleTopBar(
            name: 'Sales',
            ontap: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                height: 55,
                decoration: BoxDecoration(
                  color: hintcolor,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose the shop',style: TextStyle(color: Colors.grey),),
                    PopupMenuButton<String>(
                      onSelected: (String value) {},
                      itemBuilder: (BuildContext context) {
                        return shops.map((String shop) {
                          return PopupMenuItem<String>(
                            value: shop,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(shop),
                                SvgPicture.asset('assets/images/dropdown.svg'),
                              ],
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TableCalendar(
                        selectedDayPredicate: (day) =>
                            isSameDay(day, controller.today),
                        firstDay: DateTime.utc(2023, 1, 1),
                        lastDay: DateTime.now(),
                        focusedDay: controller.today,
                        rangeStartDay: controller.rangeStart,
                        rangeEndDay: controller.rangeEnd,
                        rangeSelectionMode: RangeSelectionMode.enforced,
                        // onDaySelected: saleController.onDaySelected,
                        onRangeSelected: controller.onRangeSelected,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                              color: Color.fromARGB(255, 56, 125, 181),
                              fontSize: 23),
                        ),
                        calendarStyle: CalendarStyle(
                          // we
                          defaultTextStyle:
                              const TextStyle(color: Colors.black),
                          todayDecoration: BoxDecoration(
                              color: maincolor.withOpacity(0.5),
                              shape: BoxShape.circle),
                          selectedDecoration: const BoxDecoration(
                              color: maincolor, shape: BoxShape.circle),
                          markerDecoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          rangeStartDecoration: BoxDecoration(
                              color: maincolor, shape: BoxShape.circle),
                          rangeEndDecoration: BoxDecoration(
                              color: maincolor, shape: BoxShape.circle),
                          rangeHighlightColor: maincolor.withOpacity(0.2),
                          isTodayHighlighted: true,
                          outsideDaysVisible: false,
                        ),
                        availableCalendarFormats: const {
                          CalendarFormat.month: 'Month',
                          // CalendarFormat.week: 'Week',
                        },
                        onPageChanged: controller.onFormatChanged,
                        calendarFormat: controller.format,
                        onFormatChanged: (CalendarFormat format) {
                          setState(() {
                            format == CalendarFormat.week
                                ? controller.format1 = 'week'
                                : controller.format1 = 'month';
                            controller.format = format;
                          });
                        },
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        daysOfWeekVisible: true,

                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                              color: Colors.white, fontStyle: FontStyle.italic),
                          weekendStyle: TextStyle(
                              color: Colors.white, fontStyle: FontStyle.italic),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: [
                            Text('Total Sales',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: maincolor)),
                            SizedBox(height: 30),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              decoration: BoxDecoration(
                                  color: colortext,
                                  borderRadius: BorderRadius.circular(13)),
                              child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '0 AED',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_translator/google_translator.dart';
// import 'package:hume_admin/utils/colors.dart';

// class InfoCard extends StatelessWidget {
//   const InfoCard(
//       {super.key,
//       this.name,
//       this.ontap,
//       this.shopname,
//       this.orderno,
//       this.price});
//   final name;
//   final ontap;
//   final shopname;
//   final orderno;
//   final price;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.95,
//       height: MediaQuery.of(context).size.width * 0.5,
//       decoration: BoxDecoration(
//         color: cardcolor,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: const Color.fromARGB(255, 193, 184, 184),
//           width: 1.0,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             InkWell(
//               onTap: ontap,
//               child: Container(
//                 padding: const EdgeInsets.all(14.0),
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 height: MediaQuery.of(context).size.width * 0.2,
//                 decoration: BoxDecoration(
//                   color: white,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               'assets/images/order.svg',
//                               height: 23,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   '  Order NO  ',
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w700,
//                                       color: colortext),
//                                 ),
//                                 Text(
//                                   orderno,
//                                   style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w700,
//                                       color: colortext),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               'See Product    ',
//                               style: TextStyle(
//                                   color: colortext,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             SvgPicture.asset('assets/images/arrow.svg')
//                           ],
//                         )
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               'assets/images/home.svg',
//                               height: 23,
//                             ),
//                             Text(
//                               shopname,
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.w700),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Row(
//               children: [
//                 Text(
//                   '       Requested',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 SizedBox(
//                   width: 23,
//                 ).tr,
//                 Text('22/11/2023', style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Row(
//               children: [
//                 Text(
//                   '        Total Price',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 SizedBox(
//                   width: 23,
//                 ),
//                 Text(price,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w700)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

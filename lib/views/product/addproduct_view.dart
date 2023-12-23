// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hume_admin/components/addbanner_box.dart';
import 'package:hume_admin/components/categorybutto.dart';
import 'package:hume_admin/components/dropdown.dart';
import 'package:hume_admin/components/icon_button.dart';
import 'package:hume_admin/components/input_field.dart';
import 'package:hume_admin/components/largebutton.dart';
import 'package:hume_admin/components/orderbutton.dart';
import 'package:hume_admin/components/sizebox.dart';
import 'package:hume_admin/components/topbar.dart';
import 'package:hume_admin/utils/colors.dart';
import 'package:hume_admin/views/addbaner/addbanner_view.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: TitleTopBar(
          name: 'Add Product',
          ontap: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InputField(
                    hint: 'product name',
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InputField(
                    hint: 'price',
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(14.0),
                width: MediaQuery.of(context).size.width * 0.93,
                height: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  color: hintcolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconsButton(
                          width: MediaQuery.of(context).size.width * 0.59,
                          imgicon: SvgPicture.asset('assets/images/upload.svg'),
                          fontSize: 14.0,
                          title: 'Upload',
                          height: 50.0,
                          textcolor: white,
                          color: maincolor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Uploaded images',style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                     SizedBox(height: 12,),
                    Row(children: [SvgPicture.asset('assets/images/image.svg'),
                      Text('  Image .jpg',style: TextStyle(color: Colors.grey,fontSize: 18),),
                    
                    
                    ],)
                  ],
                  
                ),
              ),
              DropDown(),
              InputField(
                hint: 'Discription',
                width: MediaQuery.of(context).size.width * 0.94,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    'Sizes (Optional,)',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  SizeContainer(
                    text: '2',
                  ),
                  SizeContainer(
                    text: '2',
                  ),
                  SizeContainer(
                    text: '2',
                  ),
                  SizeContainer(
                    text: '2',
                  ),
                  SizeContainer(
                    text: '2',
                  ),
                  SizeContainer(
                    text: '2',
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Choose product Catigory',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.21,
        
                    text: 'Clothes',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.21,
        
                    text: 'Devices',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.39,
        
                    text: 'Personal services',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                ],
              ),
              Row(
                children: [
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.35,
        
                    text: 'Home & kitchen',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.23,
                    text: 'Furniture',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.21,
        
                    text: 'Foods',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                ],
              ),
              Row(
                children: [
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.35,
        
                    text: 'Bags & shoes',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.25,
        
                    text: 'Makeup',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.21,
        
                    text: 'Perfumes',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                ],
              ),
              Row(
                children: [
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.39,
        
                    text: 'Hair & skin products',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                  CategoryButton(
                    width: MediaQuery.of(context).size.width * 0.39,
        
                    text: 'Accessories',
                    textcolor: maincolor,
                    color: hintcolor,
        
                    // color: ,
                  ),
                ],
              )
            ],
          ),
        )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14),
        child: LargeButton(
          title: 'Sell Product',
          onPressed: () {},
          textcolor: white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webullish/utils/app_colors.dart';

class MyDropDownMenu extends StatelessWidget {
  Function(String?) onChanged;
  List myList;
  String? text;

  MyDropDownMenu({required this.onChanged,required this.myList,this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:AppColors.ancientColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: DropdownButtonFormField<String>(
        hint: Text(text ?? 'country',style: TextStyle(color:AppColors.grey),),
        dropdownColor: Colors.transparent,
        icon: Icon(Icons.arrow_drop_down_sharp,color: AppColors.whiteColor,size: 30,),
        items: myList.map((e) {
          return DropdownMenuItem<String>(
            child: Text(e,style: TextStyle(
              color: Colors.white
            ),),
            value: e,
          );
        }).toList(),
        onChanged:onChanged
        ,
        validator: (value) {
          if (value == null) {
            return 'Please select an option';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        ),
      ),
    );
  }
}

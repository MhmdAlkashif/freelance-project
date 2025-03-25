import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DottedBtnWidget extends StatelessWidget {
  const DottedBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: DottedBorder(
        color: HexColor("#636363"),
        strokeWidth: 2,
        dashPattern: [6, 3],

        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        child: Container(
          width: double.infinity,
          height: 46,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("إضافة مادة"),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

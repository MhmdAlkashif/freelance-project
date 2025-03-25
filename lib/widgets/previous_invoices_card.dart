import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PreviousInvoicesCard extends StatelessWidget {
  const PreviousInvoicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الفواتير السابقة",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#000000"),
                  ),
                ),
                Text(
                  "عرض الجميع",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#636363"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border(
                top: BorderSide(width: 6, color: HexColor("#3BADFC")),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Light shadow
                  blurRadius: 5, // Soft blur
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                _dataRowWidget(name: "حازم لؤي الشيخ سعيد", price: "32 د.ع"),
                _dataRowWidget(name: "محمد سبحاني", price: "32 د.ع"),
                _dataRowWidget(name: "علي سليمان", price: "32 د.ع"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataRowWidget({required String name, required String price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#3BADFC"),
                  borderRadius: BorderRadius.circular(6.0),
                ),

                child: Image.asset("assets/images/receipt_long.png"),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12.0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#636363"),
                  ),
                ),
              ),
            ],
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: HexColor("#636363"),
            ),
          ),
        ],
      ),
    );
  }
}

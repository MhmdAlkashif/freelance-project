import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostSellingCard extends StatelessWidget {
  const MostSellingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الأكثر مبيعاً",
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
                _dataRowWidget(quantity: "درزن", quantityCount: "5"),
                _dataRowWidget(quantity: "قطعة", quantityCount: "250"),
                _dataRowWidget(quantity: "كارتون", quantityCount: "100"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dataRowWidget({
    required String quantity,
    required String quantityCount,
  }) {
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

                child: SvgPicture.asset("assets/images/trending_up.svg"),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12.0),
                child: Text(
                  "طابعة",
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
            quantity,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: HexColor("#636363"),
            ),
          ),
          Text(
            quantityCount,

            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: HexColor("#636363"),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DocumentsCard extends StatelessWidget {
  const DocumentsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 24, bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, top: 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "السندات",
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
            width: double.infinity,

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "لا يوجد سندات!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HexColor("#636363"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Image.asset(
                      "assets/images/EmptyState.png",
                      width: 154,
                      height: 122,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

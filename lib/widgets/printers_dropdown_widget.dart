import 'package:flutter/material.dart';
import 'package:freelance_project/models/printers_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class PrintersDropdownWidget extends StatefulWidget {
  const PrintersDropdownWidget({super.key});

  @override
  State<PrintersDropdownWidget> createState() => _PrintersDropdownWidgetState();
}

class _PrintersDropdownWidgetState extends State<PrintersDropdownWidget> {
  PrinterItem? selectedPrinter;
  bool isDropdownOpened = false;

  List<PrinterItem> printers = [];

  TextEditingController searchController = TextEditingController();

  Widget _singleDropdownItem() {
    return Wrap(
      children: [
        Text(
          "150",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Text(
            "طابعة ملصقات MOHD",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),

        Text(
          "450.000 د.ع",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  @override
  void initState() {
    printers = List.generate(
      10,
      (index) => PrinterItem(value: "Printer", widget: _singleDropdownItem()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<PrinterItem>(
          customButton: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "طابعة ملصقات MOHD",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 8),
                Icon(
                  !isDropdownOpened
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: Colors.black,
                ),
              ],
            ),
          ),

          onMenuStateChange: (isOpen) {
            setState(() {
              isDropdownOpened = isOpen;
            });
          },
          value: selectedPrinter,
          hint: Text(
            "طابعة ملصقات MOHD",
            style: TextStyle(color: Colors.black),
          ),
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(),
            width: double.infinity,
            height: 48,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
          ),
          menuItemStyleData: const MenuItemStyleData(height: 48),

          dropdownStyleData: DropdownStyleData(
            isOverButton: true,
            decoration: BoxDecoration(color: Colors.white),
            maxHeight: 250,
            offset: const Offset(5, -50),
            elevation: 0,
            padding: EdgeInsets.zero,
            scrollPadding: const EdgeInsetsDirectional.only(end: 8, top: 8),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(8),
            ),
          ),

          dropdownSearchData: DropdownSearchData(
            searchController: TextEditingController(),
            searchInnerWidgetHeight: 50,
            searchInnerWidget: SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "ابحث هنا",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        searchController.clear();
                        setState(() {});
                      },
                      child: Image.asset(
                        "assets/images/iconamoon_scanner.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          isExpanded: true,
          onChanged: (PrinterItem? newValue) {
            setState(() {
              selectedPrinter = newValue;
            });
          },
          items:
              printers.map((PrinterItem printer) {
                return DropdownMenuItem<PrinterItem>(
                  value: printer,
                  child: printer.widget,
                );
              }).toList(),
        ),
      ),
    );
  }
}

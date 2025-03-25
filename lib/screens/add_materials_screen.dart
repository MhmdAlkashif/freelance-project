import 'package:flutter/material.dart';
import 'package:freelance_project/widgets/printers_dropdown_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../widgets/dotted_btn_widget.dart';

class AddMaterialsScreen extends StatefulWidget {
  const AddMaterialsScreen({super.key});

  @override
  State<AddMaterialsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AddMaterialsScreen> {
  List<String> items = List.generate(5, (index) => "Item ${index + 1}");

  final List<int> _counters = List.generate(
    3,
    (index) => 1000,
  );

  void _increment(int index) {
    setState(() {
      _counters[index]++;
    });
  }

  void _decrement(int index) {
    setState(() {
      if (_counters[index] > 0) _counters[index]--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.white,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("إضافة مواد الفاتورة"),
          elevation: 0.0,

          flexibleSpace: Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 30,
              start: 30,
              top: 100,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _backWidget(),
                Text(
                  "إضافة مواد الفاتورة",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                _notificationNudgeWidget(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: _slidableWidget(index),
                );
              },
            ),
            DottedBtnWidget(),

            _buttonsWidget(),
          ],
        ),
      ),
    );
  }

  Widget _slidableWidget(int index) {
    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: BehindMotion(),
        children: [
          SlidableAction(
            flex: 2,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            onPressed: (context) {},
            backgroundColor: Colors.grey.shade800,
            foregroundColor: Colors.white,
            label: 'المزيد',
          ),
          SlidableAction(
            flex: 2,
            padding: EdgeInsets.zero,
            spacing: 1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            onPressed: (context) {},
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          ),
        ],
      ),

      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: BehindMotion(),
        children: [
          SlidableAction(
            padding: EdgeInsets.zero,
            spacing: 1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            onPressed: (context) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Card(
        color: HexColor("#F7F7F7"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '150',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: PrintersDropdownWidget()),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'السعر:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' 450.000 د.ع',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _increment(index),
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

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(_counters[index].toString()),
                        ),
                        GestureDetector(
                          onTap: () => _decrement(index),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backWidget() {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HexColor("#F7F7F7"),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: HexColor("#636363"),
          ),
        ),
      ),
    );
  }

  Widget _notificationNudgeWidget() {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: HexColor("#F7F7F7"),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            SvgPicture.asset(
              "assets/images/notifications_active.svg",
              width: 24,
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonsWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 60, bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 152,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor("#3BADFC"),
                foregroundColor: Colors.white,
                textStyle: TextStyle(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                print("Elevated Button Pressed");
              },
              child: Text("التالي"),
            ),
          ),
          SizedBox(width: 23),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 23.0),
            child: SizedBox(
              width: 152,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: HexColor("#3BADFC"), width: 1),
                  foregroundColor: HexColor("#3BADFC"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("إلغاء"),
              ),
            ),
          ),

  
        ],
      ),
    );
  }
}

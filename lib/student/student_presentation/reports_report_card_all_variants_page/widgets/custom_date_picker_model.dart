import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schulupparent/student/core/utils/size_utils.dart';
import 'package:schulupparent/student/student_presentation/reports_report_card_all_variants_page/controller/reports_report_card_all_variants_controller.dart';

class CustomDatePickerModal extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePickerModal({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<CustomDatePickerModal> createState() => _CustomDatePickerModalState();
}

class _CustomDatePickerModalState extends State<CustomDatePickerModal> {
  late int selectedYear;
  late int selectedMonth;
  late int selectedDay;

  ReportsReportCardAllVariantsController controller =
      Get.find<ReportsReportCardAllVariantsController>();

  late FixedExtentScrollController yearController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController dayController;

  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec',
  ];

  @override
  void initState() {
    super.initState();
    selectedYear = widget.initialDate.year;
    selectedMonth = widget.initialDate.month;
    selectedDay = widget.initialDate.day;

    // Initialize controllers
    final years = _generateYears();
    yearController = FixedExtentScrollController(
      initialItem: years.indexOf(selectedYear),
    );
    monthController = FixedExtentScrollController(
      initialItem: selectedMonth - 1,
    );
    dayController = FixedExtentScrollController(initialItem: selectedDay - 1);
  }

  @override
  void dispose() {
    yearController.dispose();
    monthController.dispose();
    dayController.dispose();
    super.dispose();
  }

  List<int> _generateYears() {
    final currentYear = DateTime.now().year;
    return List.generate(10, (index) => currentYear + 5 - index);
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    final years = _generateYears();
    final days = List.generate(
      _getDaysInMonth(selectedYear, selectedMonth),
      (i) => i + 1,
    );

    return Container(
      //height: 480,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.shrink(),
                Text(
                  'Jump to a Date',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 20, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Picker labels
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Year',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Month',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Day',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          // Pickers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 150,
              child: Stack(
                children: [
                  // Selection highlight
                  Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 70,
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE5CC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 70,
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE5CC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 70,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE5CC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  // Scrollable pickers
                  Row(
                    children: [
                      // Year picker
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          controller: yearController,
                          itemExtent: 40,
                          physics: FixedExtentScrollPhysics(),
                          diameterRatio: 2.0,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              selectedYear = years[index];
                              // Adjust day if needed
                              final maxDays = _getDaysInMonth(
                                selectedYear,
                                selectedMonth,
                              );
                              if (selectedDay > maxDays) {
                                selectedDay = maxDays;
                                dayController.jumpToItem(selectedDay - 1);
                              }
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: years.length,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  years[index].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Month picker
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          controller: monthController,
                          itemExtent: 40,
                          physics: FixedExtentScrollPhysics(),
                          diameterRatio: 2.0,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              selectedMonth = index + 1;
                              // Adjust day if needed
                              final maxDays = _getDaysInMonth(
                                selectedYear,
                                selectedMonth,
                              );
                              if (selectedDay > maxDays) {
                                selectedDay = maxDays;
                                dayController.jumpToItem(selectedDay - 1);
                              }
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: months.length,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  months[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Day picker
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          controller: dayController,
                          itemExtent: 40,
                          physics: FixedExtentScrollPhysics(),
                          diameterRatio: 2.0,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              selectedDay = days[index];
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: days.length,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  days[index].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Jump to Date button
          Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final newDate = DateTime(
                    selectedYear,
                    selectedMonth,
                    selectedDay,
                  );
                  widget.onDateSelected(newDate);
                  setState(() {
                    controller.datex = newDate;
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFF8D2A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Jump to Date',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Usage example:
void showCustomDatePicker(
  BuildContext context,
  DateTime currentDate,
  Function(DateTime) onDateSelected,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (context) => CustomDatePickerModal(
          initialDate: currentDate,
          onDateSelected: onDateSelected,
        ),
  );
}

// Example implementation in your widget:
/*
GestureDetector(
  onTap: () {
    showCustomDatePicker(
      context,
      controller.date.value,
      (newDate) {
        controller.date.value = newDate;
      },
    );
  },
  child: Row(
    spacing: 5,
    children: [
      Text(
        formatDate(controller.date.value),
        style: CustomTextStyles.bodySmallWhiteA700_1.copyWith(fontSize: 12),
      ),
      CustomImageView(
        imagePath: ImageConstant.imgIconsTinyDown,
      ),
    ],
  ),
),
*/

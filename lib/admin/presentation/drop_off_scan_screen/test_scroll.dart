import 'package:flutter/material.dart';

class MonthListView extends StatefulWidget {
  @override
  _MonthListViewState createState() => _MonthListViewState();
}

class _MonthListViewState extends State<MonthListView> {
  final ScrollController _scrollController = ScrollController();
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  
  int selectedMonth = DateTime.now().month - 1; // Current month (0-indexed)

  @override
  void initState() {
    super.initState();
    // Scroll to current month after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToMonth(selectedMonth);
    });
  }

  void scrollToMonth(int index) {
    // Calculate the position to scroll to
    // itemWidth (120) + spacing (16)
    double position = index * 136.0;
    
    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Month Selector'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 60,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: months.length,
              itemBuilder: (context, index) {
                bool isSelected = index == selectedMonth;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMonth = index;
                    });
                    scrollToMonth(index);
                  },
                  child: Container(
                    width: 120,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      months[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Selected: ${months[selectedMonth]}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Usage in your main app
void main() {
  runApp(MaterialApp(
    home: MonthListView(),
    debugShowCheckedModeBanner: false,
  ));
}
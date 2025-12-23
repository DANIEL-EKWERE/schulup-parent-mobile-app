// Model
class StudentTerm {
  final int termID;
  final String name;
  final bool isActive;

  StudentTerm({
    required this.termID,
    required this.name,
    required this.isActive,
  });

  factory StudentTerm.fromJson(Map<String, dynamic> json) {
    return StudentTerm(
      termID: json['termID'],
      name: json['name'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'termID': termID,
      'name': name,
      'isActive': isActive,
    };
  }
}

// Response Model
class TermsResponse {
  final bool success;
  final String message;
  final List<StudentTerm> data;

  TermsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TermsResponse.fromJson(Map<String, dynamic> json) {
    return TermsResponse(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((term) => StudentTerm.fromJson(term))
          .toList(),
    );
  }
}

// // Controller
// class TermsController extends GetxController {
//   final ApiClient _apiService = ApiClient(Duration(seconds: 60));
  
  // RxList<Term> terms = <Term>[].obs;
  // Rx<Term?> selectedTerm = Rx<Term?>(null);
  // RxBool isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchTerms();
//   }

  // Future<void> fetchTerms() async {
  //   try {
  //     isLoading.value = true;

  //     final response = await _apiService.get('/api/terms'); // Your endpoint

  //     if (response.statusCode == 200) {
  //       final jsonData = jsonDecode(response.body);
  //       final termsResponse = TermsResponse.fromJson(jsonData);
        
  //       terms.value = termsResponse.data;
        
  //       // Automatically select the active term
  //       selectedTerm.value = terms.firstWhere(
  //         (term) => term.isActive,
  //         orElse: () => terms.first,
  //       );

  //       isLoading.value = false;
  //     } else {
  //       isLoading.value = false;
  //       Get.snackbar(
  //         'Error',
  //         'Failed to load terms',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar(
  //       'Error',
  //       'Failed to load terms: ${e.toString()}',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

//   void selectTerm(Term term) {
//     selectedTerm.value = term;
//     // You can trigger other actions here, like fetching report card for this term
//     print('Selected term: ${term.name} (ID: ${term.termID})');
//   }
// }

// // UI Widget - Dropdown
// class TermDropdown extends StatelessWidget {
//   final controller = Get.put(TermsController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }

//       if (controller.terms.isEmpty) {
//         return Text('No terms available');
//       }

//       return DropdownButtonFormField<Term>(
//         value: controller.selectedTerm.value,
//         decoration: InputDecoration(
//           labelText: 'Select Term',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           prefixIcon: Icon(Icons.calendar_today),
//         ),
//         items: controller.terms.map((term) {
//           return DropdownMenuItem<Term>(
//             value: term,
//             child: Row(
//               children: [
//                 Text(term.name),
//                 if (term.isActive) ...[
//                   SizedBox(width: 8),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       'Active',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           );
//         }).toList(),
//         onChanged: (Term? term) {
//           if (term != null) {
//             controller.selectTerm(term);
//           }
//         },
//       );
//     });
//   }
// }

// // Alternative UI - List with Radio Buttons
// class TermsList extends StatelessWidget {
//   final controller = Get.put(TermsController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return Center(child: CircularProgressIndicator());
//       }

//       if (controller.terms.isEmpty) {
//         return Center(child: Text('No terms available'));
//       }

//       return ListView.builder(
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemCount: controller.terms.length,
//         itemBuilder: (context, index) {
//           final term = controller.terms[index];
//           final isSelected = controller.selectedTerm.value?.termID == term.termID;

//           return Card(
//             elevation: isSelected ? 4 : 1,
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             color: isSelected ? Color(0xFFFF8C42).withOpacity(0.1) : null,
//             child: ListTile(
//               leading: Radio<Term>(
//                 value: term,
//                 groupValue: controller.selectedTerm.value,
//                 onChanged: (Term? value) {
//                   if (value != null) {
//                     controller.selectTerm(value);
//                   }
//                 },
//                 activeColor: Color(0xFFFF8C42),
//               ),
//               title: Text(
//                 term.name,
//                 style: TextStyle(
//                   fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                 ),
//               ),
//               trailing: term.isActive
//                   ? Container(
//                       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         'Active',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                         ),
//                       ),
//                     )
//                   : null,
//               onTap: () => controller.selectTerm(term),
//             ),
//           );
//         },
//       );
//     });
//   }
// }

// // Alternative UI - Chips
// class TermsChips extends StatelessWidget {
//   final controller = Get.put(TermsController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return Center(child: CircularProgressIndicator());
//       }

//       if (controller.terms.isEmpty) {
//         return Text('No terms available');
//       }

//       return Wrap(
//         spacing: 8,
//         runSpacing: 8,
//         children: controller.terms.map((term) {
//           final isSelected = controller.selectedTerm.value?.termID == term.termID;

//           return FilterChip(
//             selected: isSelected,
//             label: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(term.name),
//                 if (term.isActive) ...[
//                   SizedBox(width: 4),
//                   Icon(Icons.check_circle, size: 14, color: Colors.green),
//                 ],
//               ],
//             ),
//             selectedColor: Color(0xFFFF8C42),
//             checkmarkColor: Colors.white,
//             labelStyle: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//             ),
//             onSelected: (bool selected) {
//               controller.selectTerm(term);
//             },
//           );
//         }).toList(),
//       );
//     });
//   }
// }

// // Usage Example in Your Screen
// class ReportCardScreen extends StatelessWidget {
//   final termsController = Get.put(TermsController());
//   final reportController = Get.put(ReportCardController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Report Card')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select Term',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
            
//             // Use any of the three UI options:
//             TermDropdown(),  // Dropdown
//             // TermsChips(),  // Chips
//             // Expanded(child: TermsList()),  // List
            
//             SizedBox(height: 24),
            
//             // Download button with selected term
//             Obx(() {
//               final selectedTerm = termsController.selectedTerm.value;
//               if (selectedTerm == null) {
//                 return SizedBox.shrink();
//               }

//               return ElevatedButton.icon(
//                 onPressed: () {
//                   // Update your endpoint with termID
//                   reportController.reportCardEndpoint = 
//                     'https://your-api.com/api/report-card?termID=${selectedTerm.termID}';
//                   reportController.downloadAndOpen();
//                 },
//                 icon: Icon(Icons.download),
//                 label: Text('Download ${selectedTerm.name} Report'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFFFF8C42),
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
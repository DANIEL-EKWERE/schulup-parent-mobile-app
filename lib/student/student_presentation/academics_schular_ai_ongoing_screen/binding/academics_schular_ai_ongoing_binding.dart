// TODO Implement this library.
import 'package:schulupparent/student/student_presentation/academics_schular_ai_conversation_bottomsheet/controller/academics_schular_ai_conversation_controller.dart';

import '../../../core/app_export.dart';
import '../controller/academics_schular_ai_ongoing_controller.dart';

/// A binding class for the AcademicsSchularAiOngoingScreen.
///
/// This class ensures that the AcademicsSchularAiOngoingController is created when the
/// AcademicsSchularAiOngoingScreen is first loaded.
class StudentAcademicsSchularAiOngoingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentAcademicsSchularAiOngoingController());
    Get.put(AcademicsSchularAiConversationController(), permanent: true);
  }
}

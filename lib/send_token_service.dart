import 'package:get/get.dart';
import 'package:schulupparent/parent/data/apiClient/api_client.dart';

class SendTokenService extends GetxService {
  // This class is intentionally left empty as the token refresh listener
  // has been moved to main.dart for better lifecycle management.
ApiClient apiClient = ApiClient(Duration(seconds: 60 * 5));
  

void registerToken(String token) async {
    // try {
    //   var response = await apiClient.postData('/register-token', {'token': token});
    //   if (response.statusCode == 200) {
    //     print('Token registered successfully');
    //   } else {
    //     print('Failed to register token: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error registering token: $e');
    // }
  }

}
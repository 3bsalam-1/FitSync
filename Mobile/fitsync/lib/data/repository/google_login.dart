import 'package:fitsync/data/models/response_model.dart';
import 'package:fitsync/data/repository/api.dart';
import 'package:fitsync/shared/const/base_url.dart';

class ContinueWithGoogle {
  Future<ResponseModel> continueWithGoogle({
    required String name,
    required String email,
    required String avatar,
  }) async {
    Map<String, dynamic> data = await Api().post(
        url: "$baseUrl/api/auth/ContinueWithGoogle",
        body: {"name": name, "email": email, "avatar": avatar});
    
    return ResponseModel.fromJson(data);
  }
}

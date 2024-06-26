import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../services/pref.dart';

class LocationCubit extends Cubit<String?> {
  LocationCubit() : super(null);
  String country = '';

  void getLocation() async {
    try {
      http.Response response = await http.get(
        Uri.parse('http://ip-api.com/json'),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      country = data['city'];
      Prefs.setString('location', country);
      emit(country);
    } catch (e) {
      checkLocation();
    }
  }

  void checkLocation() {
    if (state == null) {
      if (Prefs.getString('location') != null) {
        emit(Prefs.getString('location'));
      } else {
        emit('Cairo');
      }
    }
  }
}

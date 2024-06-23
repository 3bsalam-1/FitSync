import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libre_translate/libre_translate.dart';

class TranslatelangCubit extends Cubit<String> {
  TranslatelangCubit() : super('en');

  Future<String> toArabic(String text) async {
    final client = LibreTranslateClient(
      base: Uri.https('translate.terraprint.co'),
    );
    String translate = await client.translate(
          text,
          source: 'en',
          target: 'ar',
        );
    return translate;
  }

  void setLanguage(String lan) {
    emit(lan);
  }
}

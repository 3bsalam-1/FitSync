import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits_logic/global/translate_lang_cubit.dart';

Widget customTranslateText(String text, {required TextStyle style}) {
  return BlocBuilder<TranslatelangCubit, String>(
    builder: (context, state) {
      final provider = context.read<TranslatelangCubit>();
      return FutureBuilder(
          future: provider.toArabic(text),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(
                text,
                style: style,
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Text(
                  state == 'ar' ? snapshot.data!.toString() : text,
                  style: style,
                );
              } else {
                return Text(
                  text,
                  style: style,
                );
              }
            } else {
              return Text(
                text,
                style: style,
              );
            }
          });
    },
  );
}

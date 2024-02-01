import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedListView extends Cubit<bool> {
  AnimatedListView() : super(false);

  void startAnimation() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        emit(true);
      },
    );
  }

  void stopAnimation() => emit(false);
}

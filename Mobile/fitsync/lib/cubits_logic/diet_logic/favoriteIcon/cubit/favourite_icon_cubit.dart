import 'package:bloc/bloc.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'favourite_icon_state.dart';

class FavouriteIconCubit extends Cubit<FavouriteIconState> {
  FavouriteIconCubit() : super(FavouriteIconInitial());

  

  changeIconColor(){
    emit(FavouriteIconInitial());
    
  }




}

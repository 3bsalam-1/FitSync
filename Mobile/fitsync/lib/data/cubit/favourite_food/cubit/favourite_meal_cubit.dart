import 'package:bloc/bloc.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/food/favourite_food.dart';
import 'package:fitsync/data/repository/login_res/user_auth_repo.dart';

//import 'package:fitsync/services/pref.dart';
import 'package:meta/meta.dart';

part 'favourite_meal_state.dart';

class FavouriteMealCubit extends Cubit<FavouriteMealState> {
  FavouriteMealCubit() : super(FavouriteMealInitial());

  final auth = UserAuthRepo();
  final favoriteRepo = FavoritefoodRepo();
  List<FoodModel>? favoriteMeals=[];
  //bool isFavorite = false;
  bool viewAllFavorites = false;
  bool isEmpty =true;
  //List<bool> isFavourite =  List<bool>.filled(300, false); 


  void addfoodTofavorites({
    required FoodModel meals,
    //required String userId,
  }) {
   // isFavorite = true;
    isEmpty=false;
    emit(FavoriteMealAdded());
    // auth
    //     .userLogin(
    //   email: Prefs.getString("email")!,
    //   password: Prefs.getString("password")!,
    // )
    //     .then((value) {
      favoriteRepo
          .addfoodToFavorites(
        foods: meals,
      //  userId: userId,
      )
          .then((response) {

          getAllFavoriteMeals();
          emit(FavoriteMealAdded());

      });

    //});
  }

  void getAllFavoriteMeals() {
    favoriteRepo.getFoodFavorites().then((response) {
      favoriteMeals = response;
      emit(FavoriteMealGetAll());
    });
  }

   void removefoodfromfavorites({
    required FoodModel meals,
    //required String userId,
  }) {
   // isFavorite = true;
   // isEmpty=false;
   // emit(FavoriteMealAdded());

    // auth
    //     .userLogin(
    //   email: Prefs.getString("email")!,
    //   password: Prefs.getString("password")!,
    // )
    //     .then((value) {
      favoriteRepo
          .removefoodfromFavorites(
        foods: meals,
      //  userId: userId,
      )
          .then((response) {

          getAllFavoriteMeals();
          emit(FavoriteMealAdded());

      });

    //});
  }

  bool isData(){
     favoriteRepo.getFoodFavorites().then((response) {
      favoriteMeals = response;
      emit(FavoriteMealGetAll());
    });
    if(favoriteMeals!.isEmpty)
    return true;
    else return false;

  }

  bool isFavoriteMeal(FoodModel foods) { bool isFavorite=false;
    for (var element in favoriteMeals!) {
      if (element.convertToString() == foods.convertToString()) {
        isFavorite = true;
        //isFavourite[index]=true;
        emit(FavoriteMealGetAll());
        break;

      }
    }
    // if(isFavorite==false) {
    //   isFavourite[index]=false;
    // }

    emit(FavoriteMealGetAll());
    return isFavorite;
  }

  // void setFavoriteToInitial() {
  //   isFavorite = false;
  //   emit(FavouriteMealInitial());
  // }

  void changeColor(){
    emit(ChangeColor());
  }

  void showAllSavedMeals() {
    viewAllFavorites = !viewAllFavorites;
    emit(FavoriteMealGetAll());
  }
}

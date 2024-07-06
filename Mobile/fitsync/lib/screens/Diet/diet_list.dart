import 'dart:ffi';

import 'package:fitsync/data/cubit/favourite_food/cubit/favourite_meal_cubit.dart';
import 'package:fitsync/data/models/food_model.dart';
import 'package:fitsync/data/repository/food/all_food.dart';
import 'package:fitsync/screens/Diet/filter_diet_screen.dart';
import 'package:fitsync/shared/colors/colors.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_filter_button.dart';
import 'package:fitsync/shared/widgets/diet_comp/custom_saved_recipes.dart';
import 'package:fitsync/shared/widgets/global/animated_navigator.dart';
import 'package:fitsync/shared/widgets/global/custom_translate_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

bool isColor = false;

class DietListScreen extends StatefulWidget {
  const DietListScreen({super.key});

  @override
  State<DietListScreen> createState() => _DietListScreenState();
}

class _DietListScreenState extends State<DietListScreen> {
  late Future<List<FoodModel>> _futureItems;
  List<FoodModel> _allItems = [];
  List<FoodModel> _filteredItems = [];
  List<FoodModel> filterItems = [];
  List<FoodModel> items = [];

  @override
  void initState() {
    super.initState();
    _futureItems = _fetchItems();
    //filterItemsfunction();
  }

  Future<List<FoodModel>> _fetchItems() async {
    AllFood food = AllFood();
    _allItems = await food.getAllFood();
    items = _allItems;
    _filteredItems = _allItems;
    return _allItems;
  }

  void _searchItems(String query) {
    final filteredItems = query.isEmpty
        ? _allItems
        : _allItems
            .where(
                (item) => item.Name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    setState(() {
      _filteredItems = filteredItems;
    });
  }

  void filterItemsfunction() {
    _filteredItems = items;
    if (filter1.isNotEmpty) {
      if (filter1.length == 4) {
        filterItems = _filteredItems
            .where((item) => foodType == ""
                ? item.Catagory.toLowerCase()
                        .contains(filter1[0].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[1].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[2].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                            .contains(filter1[3].toLowerCase()) &&
                        item.Nutrient.toLowerCase()
                            .contains(nutrientType.toLowerCase()) &&
                        item.Diet.toLowerCase().contains(dietType.toLowerCase())
                : item.Catagory.toLowerCase()
                        .contains(filter1[0].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[1].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[2].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                            .contains(filter1[3].toLowerCase()) &&
                        item.Veg_non.toLowerCase()
                            .contains(foodType.toLowerCase()) &&
                        item.Nutrient.toLowerCase()
                            .contains(nutrientType.toLowerCase()) &&
                        item.Diet.toLowerCase().contains(dietType.toLowerCase()))
            .toList();
      } else if (filter1.length == 5) {
        filterItems = _filteredItems
            .where((item) => foodType == ""
                ? item.Catagory.toLowerCase().contains(filter1[0].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[1].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[2].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[3].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                            .contains(filter1[4].toLowerCase()) &&
                        item.Nutrient.toLowerCase()
                            .contains(nutrientType.toLowerCase()) &&
                        item.Diet.toLowerCase().contains(dietType.toLowerCase())
                : item.Catagory.toLowerCase()
                        .contains(filter1[0].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[1].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[2].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[3].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                            .contains(filter1[4].toLowerCase()) &&
                        item.Veg_non.toLowerCase()
                            .contains(foodType.toLowerCase()) &&
                        item.Nutrient.toLowerCase()
                            .contains(nutrientType.toLowerCase()) &&
                        item.Diet.toLowerCase().contains(dietType.toLowerCase()))
            .toList();
      } else if (filter1.length == 8) {
        filterItems = _filteredItems
            .where((item) => foodType == ""
                ? item.Catagory.toLowerCase().contains(filter1[0].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[1].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[2].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[3].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[4].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[5].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[6].toLowerCase()) ||
                    item.Catagory.toLowerCase().contains(filter1[7].toLowerCase()) &&
                        item.Nutrient.toLowerCase()
                            .contains(nutrientType.toLowerCase()) &&
                        item.Diet.toLowerCase().contains(dietType.toLowerCase())
                : item.Catagory.toLowerCase().contains(filter1[0].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[1].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[2].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[3].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[4].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[5].toLowerCase()) ||
                    item.Catagory.toLowerCase()
                        .contains(filter1[6].toLowerCase()) ||
                    item.Catagory.toLowerCase().contains(filter1[7].toLowerCase()) &&
                        item.Veg_non.toLowerCase().contains(foodType.toLowerCase()) &&
                        item.Nutrient.toLowerCase().contains(nutrientType.toLowerCase()) &&
                        item.Diet.toLowerCase().contains(dietType.toLowerCase()))
            .toList();
      }
    } else {
      filterItems = _filteredItems
          .where(
              (item) => //item.Catagory.toLowerCase().contains("".toLowerCase())||
                  item.Veg_non.toLowerCase().contains(foodType.toLowerCase()) &&
                  item.Nutrient.toLowerCase()
                      .contains(nutrientType.toLowerCase()) ||
                  item.Diet.toLowerCase().contains(dietType.toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredItems = filterItems;
      _allItems = filterItems;
    });
  }

  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteMealCubit>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: IconButton(
              onPressed: () {
                AnimatedNavigator().pop(context);
              },
              icon: const Icon(
                Icons.arrow_circle_left,
                color: purple3,
                size: 40,
              )),
        ),
        title: customTranslateText(
          'Diet List',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: black3,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                isColor = true;
                filter1 = [];
                foodType = "";
                nutrientType = "";
                dietType = "";
                _searchController.clear();

                AnimatedNavigator().push(
                  context,
                  FilterDietScreen(
                    filterFunc: filterItemsfunction,
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      spreadRadius: 1,
                      color: gray4.withOpacity(0.08),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/Icons/filter_icon.png',
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 24),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * (388 / 428),
                height: MediaQuery.of(context).size.height * (55 / 926),
                child: TextFormField(
                    controller: _searchController,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: black,
                    ),
                    onChanged: _searchItems,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      hintText: "Search",
                      hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: gray4,
                      ),
                      prefixIcon: const Icon(
                        IconlyLight.search,
                        color: gray4,
                        size: 24,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: purple4, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: gray3, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // border:
                    )),
              ),
            ),
            FutureBuilder(
                // future: AllFood().getAllFood(),
                future: _futureItems,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                   //  List<FoodModel> _filteredItems = snapshot.data!;
                    // filterItemsfunction();

                    return Expanded(
                      child: ListView.separated(
                        itemCount: _filteredItems.length,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          
                          return
                            BlocBuilder<FavouriteMealCubit, FavouriteMealState>(
                              builder: (context, state) {
                                return CustomSavedRecipesWidget(
                                                      diet: _filteredItems[index],
                                                      imageUrl:
                                                          "assets/images/diet/diet/${_filteredItems[index].Name.replaceAll("/", "").replaceAll("&amp;", "&")}.jpg",
                                                      label1: _filteredItems[index].Name.replaceAll("/", "").replaceAll("&amp;", "&").length > 20
                                                          ? _filteredItems[index].Name.replaceAll("/", "").replaceAll("&amp;", "&").substring(0, 18) +
                                                              "..."
                                                          : _filteredItems[index].Name.replaceAll("/", "").replaceAll("&amp;", "&"),
                                                      label2: "Healthy\nFits in Budget",
                                                      onPressed: () {
                                                        cubit.changeColor();
                                                        //if(context.read<FavouriteMealCubit>().favoriteMeals.isNotEmpty)
                                                       // context.read<FavouriteMealCubit>().isFavoriteMeal(_filteredItems[index]);
                                                        if(!cubit.isFavoriteMeal(_filteredItems[index])) {
                                                          cubit.addfoodTofavorites(meals: _filteredItems[index]);
                                                         // context.read<FavouriteMealCubit>().addfoodToFavorites(meals: _filteredItems[index], userId: "1234");
                                                         // context.read<FavouriteMealCubit>().isFavorite=true;
                                                         
                                                        }
                                                        else{
                                                          cubit.removefoodfromfavorites(meals: _filteredItems[index]);
                                                          cubit.changeColor();
                                                        }
                                                       // print("the favourite is ${cubit.isFavoriteMeal(_filteredItems[index],index)}");
                            
                                                      },
                                                      iconColor:  cubit.isFavoriteMeal(_filteredItems[index]),
                                                    );
                              },
                            );}
                      ),
                    );
                  } else {
                    return const Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const rountName = '/category-meals';
//  final String categoryId;
//  final String categoryTitle;
//
//  CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as
    Map <String,String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle,
          ),
        ),
        body: ListView.builder(itemBuilder: (ctx,index) {
          return MealItem(id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              imageUrl: categoryMeal[index].imageUrl,
              duration: categoryMeal[index].duration,
              complexity: categoryMeal[index].complexity,
              affordability: categoryMeal[index].affordability);
        }, itemCount: categoryMeal.length,),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals_recipe/data/dummy_data.dart';
import 'package:meals_recipe/models/category.dart';
import 'package:meals_recipe/screens/meals.dart';
import 'package:meals_recipe/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  void _selectCategory(BuildContext context, Category category) {
    final filteredmeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(meals: filteredmeals, title: category.title),
      ),
    );
  }

  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Your Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                })
        ],
      ),
    );
  }
}

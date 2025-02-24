import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/dummy_data.dart';

//this provider has never been used in the app
//its for educational purposes only
final mealsProvider = Provider((ref) => dummyMeals);

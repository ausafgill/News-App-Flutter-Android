import 'package:flutter/material.dart';

import '../models/category_model.dart';

List<CategoryModel> getCategory() {
  List<CategoryModel> categoryList = [];
  CategoryModel categoryModel = CategoryModel();
//1
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80';

  categoryList.add(categoryModel);
  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80';
  categoryList.add(categoryModel);
  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'General';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1501504905252-473c47e087f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80';
  categoryList.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80';
  categoryList.add(categoryModel);
  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1614935151651-0bea6508db6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=925&q=80';
  categoryList.add(categoryModel);

  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80';
  categoryList.add(categoryModel);

  //7
  categoryModel = CategoryModel();
  categoryModel.categoryName = 'Technology';
  categoryModel.imageUrl =
      'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80';
  categoryList.add(categoryModel);

  return categoryList;
}

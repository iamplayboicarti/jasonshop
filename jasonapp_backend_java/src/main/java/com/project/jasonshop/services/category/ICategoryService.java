package com.project.jasonshop.services.category;

import com.project.jasonshop.dtos.CategoryDTO;
import com.project.jasonshop.models.Category;

import java.util.List;

public interface ICategoryService {
    Category createCategory(CategoryDTO category);
    Category getCategoryById(long id);
    List<Category> getAllCategories();
    Category updateCategory(long categoryId, CategoryDTO category);
    Category deleteCategory(long id) throws Exception;

}

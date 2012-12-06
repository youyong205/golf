package com.golf.service;

import java.util.List;

import com.golf.entity.Category;
import com.golf.entity.SmallCategory;
import com.golf.tools.PagedTool;

public interface CategoryService {

	public List<Category> queryAllCategories(int type);
	
	public List<Category> queryPagedCategories(PagedTool tool,int type);

	public int insertCategory(Category category);

	public int updateCategory(Category category);

	public int deleteCategory(int categoryId);

	public Category findCategory(int categoryId);

	public List<SmallCategory> queryAllSmallCategoryByTypeCategoryId(int type,int categoryId);

	public SmallCategory findSmallCategory(int smallCategoryId);

	public int insertSmallCategory(SmallCategory smallCategory);

	public int updateSmallCategory(SmallCategory smallCategory);

	public int deleteSmallCategory(int smallCategoryId);

	public List<SmallCategory> queryPagedSmallCategoryByTypeCategoryId(PagedTool pagedTool,int type, int categoryId);

}

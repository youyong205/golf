package com.golf.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;

import com.golf.dao.CategoryDao;
import com.golf.dao.SmallCategoryDao;
import com.golf.entity.Category;
import com.golf.entity.SmallCategory;
import com.golf.service.CategoryService;

public class CategoryServiceImpl implements InitializingBean, CategoryService {

	private CategoryDao m_categoryDao;

	private SmallCategoryDao m_smallCategoryDao;

	private Map<Integer, Category> m_categories = new LinkedHashMap<Integer, Category>();

	private Map<Integer, SmallCategory> m_smallCategories = new LinkedHashMap<Integer, SmallCategory>();

	@SuppressWarnings("unchecked")
	@Override
	public void afterPropertiesSet() throws Exception {
		List<Category> categories = m_categoryDao.findAllCategory();

		for (Category category : categories) {
			m_categories.put(category.getId(), category);
		}

		List<SmallCategory> smallCategories = m_smallCategoryDao.findAllSmallCategory();

		for (SmallCategory smallCategory : smallCategories) {
			int categoryId = smallCategory.getCategoryId();
			Category category = m_categories.get(categoryId);

			if (category != null) {
				smallCategory.setCategory(category);
			}
			m_smallCategories.put(smallCategory.getId(), smallCategory);
		}

	}

	@Override
	public int deleteCategory(int categoryId) {
		int id = m_categoryDao.delete(categoryId);
		if (id > 0) {
			m_categories.remove(categoryId);
		}
		return id;
	}

	@Override
	public int deleteSmallCategory(int smallCategoryId) {
		int id = m_smallCategoryDao.delete(smallCategoryId);
		if (id > 0) {
			m_smallCategories.remove(smallCategoryId);
		}
		return id;
	}

	@Override
	public Category findCategory(int categoryId) {
		Category category = m_categories.get(categoryId);
		if (category == null) {
			Category temp = m_categoryDao.findById(categoryId);
			if (temp != null) {
				m_categories.put(categoryId, temp);
			}
			return temp;
		}
		return category;
	}

	@Override
	public SmallCategory findSmallCategory(int smallCategoryId) {
		SmallCategory smallCategory = m_smallCategories.get(smallCategoryId);
		if (smallCategory == null) {
			smallCategory = m_smallCategoryDao.findById(smallCategoryId);
			if (smallCategory != null) {
				smallCategory.setCategory(findCategory(smallCategory.getCategoryId()));
				m_smallCategories.put(smallCategoryId, smallCategory);
			}
		}
		return smallCategory;
	}

	@Override
	public int insertCategory(Category category) {
		int id = m_categoryDao.insert(category);
		if (id > 0) {
			m_categories.put(category.getId(), category);
		}
		return id;
	}

	@Override
	public int insertSmallCategory(SmallCategory smallCategory) {
		int id = m_smallCategoryDao.insert(smallCategory);
		if (id > 0) {
			Category category = findCategory(smallCategory.getCategoryId());

			smallCategory.setCategory(category);
			m_smallCategories.put(id, smallCategory);
		}
		return id;
	}

	@Override
	public List<Category> queryAllCategories() {
		return new ArrayList<Category>(m_categories.values());
	}

	@Override
	public List<Category> queryAllCategories(int type) {
		ArrayList<Category> all = new ArrayList<Category>(m_categories.values());
		List<Category> result = new ArrayList<Category>();

		for (Category temp : all) {
			if (temp.getType() == type) {
				result.add(temp);
			}
		}
		return result;
	}

	@Override
	public List<SmallCategory> queryAllSmallCategory() {
		return new ArrayList<SmallCategory>(m_smallCategories.values());
	}

	@Override
	public List<SmallCategory> queryAllSmallCategoryByTypeCategoryId(int type, int categoryId) {
		List<SmallCategory> smallCategories = new ArrayList<SmallCategory>();

		for (SmallCategory smallCategory : m_smallCategories.values()) {
			Category category = findCategory(smallCategory.getCategoryId());

			if (category != null && category.getType() == type) {
				if (smallCategory.getCategoryId() == categoryId || categoryId == 0) {
					smallCategories.add(smallCategory);
				}
			}
		}
		Collections.sort(smallCategories, new SmallCategoryCompartor());
		return smallCategories;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		m_categoryDao = categoryDao;
	}

	public void setSmallCategoryDao(SmallCategoryDao smallCategoryDao) {
		m_smallCategoryDao = smallCategoryDao;
	}

	@Override
	public int updateCategory(Category category) {
		int id = m_categoryDao.update(category);
		if (id > 0) {
			m_categories.put(category.getId(), category);
		}
		return id;
	}

	@Override
	public int updateSmallCategory(SmallCategory smallCategory) {
		int id = m_smallCategoryDao.update(smallCategory);
		if (id > 0) {
			Category category = findCategory(smallCategory.getCategoryId());

			smallCategory.setCategory(category);
			m_smallCategories.put(smallCategory.getId(), smallCategory);
		}
		return id;
	}

	public static class SmallCategoryCompartor implements Comparator<SmallCategory> {

		@Override
		public int compare(SmallCategory arg0, SmallCategory arg1) {
			return arg0.getId() - arg1.getId();
		}

	}

}

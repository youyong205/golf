package com.golf.action;

import java.util.List;

import org.apache.log4j.Logger;

import com.golf.Config;
import com.golf.entity.SpecialNews;
import com.golf.service.AdwordsService;
import com.golf.service.SpecialNewsService;
import com.golf.tools.PagedTool;
import com.opensymphony.xwork2.ActionSupport;

public class SpecialNewsAction extends ActionSupport {

	private static final long serialVersionUID = 2801256599554299998L;

	private Logger m_logger = Logger.getLogger(SpecialNewsAction.class);

	private List<SpecialNews> m_specialNewss;

	private int m_specialNewsId;

	private SpecialNewsService m_specialNewsService;

	private SpecialNews m_specialNews = new SpecialNews();
	
	private PagedTool m_pagedTool = new PagedTool(Config.DEFAULT_PAGE_NUMBER);

	private AdwordsService m_adwordsService;
	
	public AdwordsService getAdwordsService() {
		return m_adwordsService;
	}

	public PagedTool getPagedTool() {
		return m_pagedTool;
	}

	public SpecialNews getSpecialNews() {
		return m_specialNews;
	}

	public List<SpecialNews> getSpecialNewss() {
		return m_specialNewss;
	}

	public void setAdwordsService(AdwordsService adwordsService) {
		m_adwordsService = adwordsService;
	}

	public void setId(int specialNewsId) {
		m_specialNewsId = specialNewsId;
	}

	public void setIndex(int index){
		m_pagedTool.setPageIndex(index);
	}

	public void setPagedTool(PagedTool pagedTool) {
		m_pagedTool = pagedTool;
	}

	public void setSpecialNews(SpecialNews specialNews) {
		m_specialNews = specialNews;
	}

	public void setSpecialNewsId(int specialNewsId) {
		m_specialNewsId = specialNewsId;
	}
	
	public void setSpecialNewsService(SpecialNewsService specialNewsService) {
		m_specialNewsService = specialNewsService;
	}
	public String specialNewsAddSubmit() {
		try {
			int id = m_specialNewsService.insertSpecialNews(m_specialNews);
			if (id > 0) {
				return SUCCESS;
			} else {
				return ERROR;
			}

		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String specialNewsDelete() {
		try {
			int count = m_specialNewsService.deleteSpecialNews(m_specialNewsId);
			if (count > 0) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}

	public String specialNewsList() {
		try {
			//m_pagedTool.setTotalNumber(m_specialNewsService.queryAllSpecialNewss().size());
			//m_specialNewss = m_specialNewsService.queryPagedSpecialNewss(m_pagedTool);
			m_specialNewss = m_specialNewsService.queryAllSpecialNewss();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String specialNewsUpdate() {
		try {
			m_specialNews = m_specialNewsService.findSpecialNews(m_specialNewsId);
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
		return SUCCESS;
	}

	public String specialNewsUpdateSubmit() {
		try {
			int count = m_specialNewsService.updateSpecialNews(m_specialNews);
			if (count > 0) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
	}
}
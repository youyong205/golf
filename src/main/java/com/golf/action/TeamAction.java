package com.golf.action;

import java.io.File;
import java.util.List;

import org.apache.log4j.Logger;

import com.golf.Config;
import com.golf.entity.ImageType;
import com.golf.entity.Team;
import com.golf.entity.TeamMemberImage;
import com.golf.entity.UploadFile;
import com.golf.service.ImageService;
import com.golf.service.TeamService;
import com.golf.tools.PagedTool;
import com.opensymphony.xwork2.ActionSupport;

public class TeamAction extends ActionSupport {

	private static final long serialVersionUID = 2801256599554299998L;

	private Logger m_logger = Logger.getLogger(TeamAction.class);

	private List<Team> m_teams;

	private int m_teamId;

	private TeamService m_teamService;

	private Team m_team = new Team();

	private TeamMemberImage m_teamMemberImage = new TeamMemberImage();

	private ImageService m_imageService;

	private UploadFile m_uploadFile = new UploadFile();

	private File m_upload;

	private PagedTool m_pagedTool = new PagedTool(Config.DEFAULT_PAGE_NUMBER);

	public PagedTool getPagedTool() {
		return m_pagedTool;
	}

	public Team getTeam() {
		return m_team;
	}

	public int getTeamId() {
		return m_teamId;
	}

	public TeamMemberImage getTeamMemberImage() {
		return m_teamMemberImage;
	}

	public List<Team> getTeams() {
		return m_teams;
	}

	private int insertImage() {
		return m_imageService.insert(m_upload, m_uploadFile, ImageType.TEAM);
	}

	public void setImageService(ImageService imageService) {
		m_imageService = imageService;
	}

	public void setIndex(int index) {
		m_pagedTool.setPageIndex(index);
	}

	public void setPagedTool(PagedTool pagedTool) {
		m_pagedTool = pagedTool;
	}

	public void setTeam(Team team) {
		m_team = team;
	}

	public void setTeamId(int teamId) {
		m_teamId = teamId;
	}

	public void setTeamMemberImage(TeamMemberImage teamMemberImage) {
		m_teamMemberImage = teamMemberImage;
	}

	public void setTeamService(TeamService teamService) {
		m_teamService = teamService;
	}

	public void setUpload(File file) {
		m_upload = file;
	}

	public void setUploadContentType(String contentType) {
		m_uploadFile.setContentType(contentType);
	}

	public void setUploadFileName(String filename) {
		m_uploadFile.setFilename(filename);
	}

	public String teamAddSubmit() {
		try {
			int id = m_teamService.insertTeam(m_team);
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

	public String teamDelete() {
		try {
			int count = m_teamService.deleteTeam(m_teamId);
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

	public String teamList() {
		try {
			// m_pagedTool.setTotalNumber(m_teamService.queryAllTeams().size());
			// m_teams = m_teamService.queryPagedTeams(m_pagedTool);
			m_teams = m_teamService.queryAllTeams();
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
		return SUCCESS;
	}

	public String teamUpdate() {
		try {
			m_team = m_teamService.findTeam(m_teamId);
			m_team.setLogo(m_imageService.findImage(m_team.getImageId()));
		} catch (Exception e) {
			m_logger.error(e.getMessage(), e);
			return ERROR;
		}
		return SUCCESS;
	}

	public String teamUpdateSubmit() {
		try {
			int count = m_teamService.updateTeam(m_team);
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

	public String updateTeamLogo() {
		try {
			int imageId = insertImage();
			if (imageId > 0) {
				int count = m_teamService.updateTeamLogo(m_teamId, imageId);
				if (count < 0) {
					return ERROR;
				} else {
					m_teamService.findTeam(m_teamId).setImageId(imageId);
					return SUCCESS;
				}
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			addActionError(e.getMessage());
			return ERROR;
		}
	}
}
package com.projectizer.db.services;

import java.util.List;

import com.projectizer.db.dao.LanguageDAO;
import com.projectizer.entities.Language;

public class LanguageService extends AbstractService {
	
	private final LanguageDAO languageDAO = new LanguageDAO();
	
	public List<Language> findAll() {
		return languageDAO.findAll();
	}

}

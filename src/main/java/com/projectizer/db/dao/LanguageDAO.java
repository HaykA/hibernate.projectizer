package com.projectizer.db.dao;

import java.util.List;

import com.projectizer.entities.Language;

public class LanguageDAO extends AbstractDAO {
	
	public List<Language> findAll() {
		return getEntityManager()
				.createNamedQuery("Language.findAll", Language.class)
				.getResultList();
	}
}

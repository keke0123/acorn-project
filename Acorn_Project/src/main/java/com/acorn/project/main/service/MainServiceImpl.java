package com.acorn.project.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.project.main.dao.MainDao;

@Service
public class MainServiceImpl {
	@Autowired
	private MainDao dao;
}

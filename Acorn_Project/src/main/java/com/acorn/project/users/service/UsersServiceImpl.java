package com.acorn.project.users.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.users.dao.UsersDao;
import com.acorn.project.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDao dao;

	@Override
	public void addUser(ModelAndView mView, UsersDto dto) {
		String planText=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String hash=encoder.encode(planText);
		dto.setPwd(hash);
		dao.insert(dto);
		mView.addObject("id", dto.getId());
	}

	@Override
	public void validUser(HttpSession session, ModelAndView mView, UsersDto dto) {
		//아이디 비밀번호가 유효한지 여부를 알아낸다
		boolean isValid=false;
		//DB에 저장된 암호화 된 비밀번호를 읽어온다
		String pwdHash=dao.getPwdHash(dto.getId());
		if(pwdHash != null) {
			//입력한 비밀번호와 암호화된 비밀번호의 일치여부를 isValid에 담기
			isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		}
		if(isValid) {
			//로그인 처리를 해준다
			session.setAttribute("id", dto.getId());
			//로그인 성공 여부를 ModelAndView 객체에 담는다
			mView.addObject("isSuccess",true);
		}else {
			mView.addObject("isSucess",false);
		}
		
		
	}

	@Override
	public Map<String, Object> canUseId(String inputId) {
		//입력한 아이디가 존재하는지 여부를 받아온다
		boolean isExist=dao.isExist(inputId);
		Map<String, Object>map=new HashMap<>();
		if(isExist) {
			map.put("canUse", false);
		}else {
			map.put("canUse", true);
		}
		return map;
	}
}

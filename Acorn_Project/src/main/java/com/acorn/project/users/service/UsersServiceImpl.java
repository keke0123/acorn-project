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

	//회원가입
	@Override
	public void addUser(ModelAndView mView, UsersDto dto) {
		String planText=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String hash=encoder.encode(planText);
		dto.setPwd(hash);
		dao.insert(dto);
		mView.addObject("id", dto.getId());
	}
	
	//로그인
	@Override
	public Map<String,Object> validUser(HttpSession session, ModelAndView mView, UsersDto dto) {
		String id=dto.getId();
		String google_id=dao.googleLogin(id);
		Map<String,Object> map=new HashMap<>();
		//구글가입자 여부를 알아내기
		if(google_id==null) {
			//아이디 비밀번호가 유효한지 여부를 알아낸다
			boolean isValid=false;
			//DB에 저장된 암호화 된 비밀번호를 읽어온다
			String pwdHash=dao.getPwdHash(id);
			if(pwdHash != null) {
				//입력한 비밀번호와 암호화된 비밀번호의 일치여부를 isValid에 담기
				isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
				
				if(isValid) {
					//로그인 처리를 해준다
					session.setAttribute("id", id);
					//로그인 성공 여부를  객체에 담는다
					map.put("isSuccess", true);
				}else {				
					map.put("isSuccess", false);
					map.put("msg", "비밀번호가 일치하지 않습니다");
				}
			}else {
				map.put("isSuccess", false);
				map.put("msg", "존재하지 않는 계정입니다");
				
			}
			
			
		}else {
			map.put("isSuccess", false);
			map.put("msg", "구글 로그인을 이용해주세요");
		}
		
		return map;
	}
	
	//구글 로그인
	@Override
	public void validGoogle(HttpSession session, ModelAndView mView) {
		String gLoginId=(String)session.getAttribute("gEmail");
		String gUid=(String)session.getAttribute("gUid");
		String google_Id=dao.googleLogin(gLoginId);
		
		if(google_Id!=null) {
			if(gUid.equals(google_Id)) {
				session.setAttribute("id", gLoginId);
				mView.addObject("isSuccess", true);
				mView.addObject("gS", "success");
				
			}else {
				mView.addObject("isSuccess",false);
				mView.addObject("gS", "fail");
			}
			
		}else {
			mView.addObject("isSuccess",false);
			mView.addObject("gS", "fail");
		}
	}

	//아이디 중복체크
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

	//닉네임 중복체크
	@Override
	public Map<String, Object> canUseNick(String inputNick) {
		//입력한 닉네임이 존재하는지 여부를 받아온다
		boolean isExist=dao.isNickExist(inputNick);
		Map<String, Object>map=new HashMap<>();
		if(isExist) {
			map.put("canUseNick", false);
		}else {
			map.put("canUseNick", true);
		}
		return map;
	}

	
}

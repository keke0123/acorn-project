package com.acorn.project.main.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.project.main.service.TestService;

@Controller
public class TestController {
	@Autowired
	private TestService service;
	// google login 관련
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	private OAuth2Operations oauthOperations;
	
	@RequestMapping("/main/test")
	public ModelAndView testPage(ModelAndView mView) {
		return new ModelAndView("main/test");
	}
	
	@RequestMapping("/main/getTest")
	public ModelAndView getTestPage(ModelAndView mView, @RequestParam String id) {
		service.getUserData(mView, id);
		mView.setViewName("main/getTest");
		return mView;
	}
	// google login 관련
	// 회원 가입 페이지
	@RequestMapping("/test_googleLogin")
	public ModelAndView join(HttpServletRequest request, ModelAndView mView) {
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, 
				googleOAuth2Parameters);
		System.out.println("/googleLogin, url : " + url);
		mView.addObject("google_url", url);
		mView.setViewName("test/test_googleLogin");
		return mView;
	}
	// google 콜백
	@RequestMapping("/googleSignInCallback")
	public String doSessionAssignActionPage(HttpServletRequest request) {
		String code = request.getParameter("code");
		
		oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, 
				googleOAuth2Parameters.getRedirectUri(), null);
		
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		
		if(expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		System.out.println(connection);
		
		PlusOperations plusOperations = google.plusOperations();
		Person profile = plusOperations.getGoogleProfile();
		System.out.println("User Uid : " + profile.getId());
		System.out.println("User Name : " + profile.getDisplayName());
		System.out.println("User Email : " + profile.getAccountEmail());
		System.out.println("User Profile : " + profile.getImageUrl());
		
		// Access Token 취소
		try {
			System.out.println("Closing Token...");
			String revokeUrl = "https://accounts.google.com/o/oauth2/revoke?token="+accessToken+"";
			URL url = new URL(revokeUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);
			
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/test_googleLogin.do";
	}
}

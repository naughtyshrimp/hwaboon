package com.hwaboon.myapp.user.service;

import java.util.Date;

import com.hwaboon.myapp.user.model.LoginVO;
import com.hwaboon.myapp.user.model.UserVO;

public interface IUserService {

	////////////////////////회원가입 기능///////////////////////
	//회원 가입 처리
	void join(UserVO user) throws Exception;
	
	//아이디 중복 확인 처리
	int isDuplicateId(String userId) throws Exception;
	
	//이메일 중복 확인 처리
	int isDuplicateEmail(String userEmail) throws Exception;
	
	
	///////////////////////로그인 기능///////////////////////////
	//로그인 시도 회원정보 조회처리
	UserVO login(LoginVO login) throws Exception;
	
	//자동로그인 유지 처리
	void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception;
	
	//세션아이디 검증 후 회원정보 불러오는 처리 (인터셉트)
	UserVO getUserWithSessionId(String sessionId) throws Exception;
	
	//아이디 찾기
	String findId(String userEmail) throws Exception;
	
	//비밀번호 찾기
	String findPw(UserVO user) throws Exception;
	
	
	/////////////////////마이페이지 기능/////////////////////////
	//회원정보 변경 처리
	void updateInfo(UserVO user) throws Exception;
	
	//비밀번호 변경 처리
	void updatePw(UserVO user) throws Exception;
	
	//회원 탈퇴 처리
	void withdrawal(UserVO user) throws Exception;
	
	
	

}

package com.hwaboon.myapp.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.hwaboon.myapp.mail.MailUtil;
import com.hwaboon.myapp.user.model.LoginVO;
import com.hwaboon.myapp.user.model.UserVO;
import com.hwaboon.myapp.user.repository.IUserDAO;


@Service
public class UserService implements IUserService {

	@Autowired
	private IUserDAO dao;

	////////////////////회원가입///////////////////
	//회원가입 처리
	@Override
	public void join(UserVO user) throws Exception {
		
		//회원 비밀번호를 인코딩하기 위해 객체 선언
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전 비밀번호 : " + user.getUserPw());

		//회원 비밀번호를 암호화하여 user객체에 다시 저장
		String securePw = encoder.encode(user.getUserPw());
		user.setUserPw(securePw);
		System.out.println("암호화 후 비밀번호 : " + user.getUserPw());
		
		dao.join(user);
	}

	//아이디 중복 확인 처리
	@Override
	public int isDuplicateId(String userId) throws Exception {
		
		return dao.isDuplicateId(userId);
	}
	
	//이메일 중복 확인 처리
	@Override
	public int isDuplicateEmail(String userEmail) throws Exception {
		
		return dao.isDuplicateEmail(userEmail);
	}

	
	
	///////////////////로그인////////////////////
	//로그인 시도한 회원 정보 조회
	@Override
	public UserVO login(LoginVO login) throws Exception {
		return dao.login(login);
	}

	//로그인 유지 처리
	@Override
	public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
		Map<String, Object> datas = new HashMap<>();
		datas.put("userId", userId);
		datas.put("sessionId", sessionId);
		datas.put("sessionLimit", sessionLimit);
		
		dao.keepLogin(datas);
	}
	
	//세션아이디 검증 후 회원정보 불러오는 처리 (인터셉트)
	@Override
	public UserVO getUserWithSessionId(String sessionId) throws Exception {
		
		return dao.getUserWithSessionId(sessionId);
	}
	
	
	//아이디 찾기
	@Override
	public String findId(String userEmail) throws Exception {
		
		return dao.findId(userEmail);
			
	}
	
	//비밀번호 찾기
	@Override
	public String findPw(UserVO user) throws Exception {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;
		
		
		if( dao.findId(user.getUserEmail()).equals(user.getUserId()) ) {
			//가져온 이메일값으로 찾은 아이디가 가져온 아이디 값과 일치한다면 임시 비밀번호 생성
			
			//임시비밀번호 생성(UUID 이용 - 특수문자는 못넣음ㅜ)
			String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // - 를 제거 
			uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌
			
			System.out.println("임시 비밀번호 : " + uuid);
			
			//user객체에 임시비밀번호 담기
			user.setUserPw(uuid);
			
			//메일전송
			MailUtil mail = new MailUtil();
			mail.sendMail(user);
		
			//회원 비밀번호를 암호화하여 user객체에 다시 저장
			String securePw = encoder.encode(user.getUserPw());
			user.setUserPw(securePw);
			
			//비밀번호 변경
			dao.updatePw(user);
		
			result = "Success";
			
			
			
		} else { //일치하지 않는다면 실패

			result = "Fail";
			
			
		}
		return result;
	}

	
	
	
	
	/////////////////////마이페이지 기능/////////////////////////
	//회원정보 변경 처리
	@Override
	public void updateInfo(UserVO user) throws Exception {
		dao.updateInfo(user);
	}

	//비밀번호 변경 처리
	@Override
	public void updatePw(UserVO user) throws Exception {
		
		//회원 비밀번호를 인코딩하기 위해 객체 선언
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		System.out.println("암호화 전 비밀번호 : " + user.getUserPw());
	
		//회원 비밀번호를 암호화하여 user객체에 다시 저장
		String securePw = encoder.encode(user.getUserPw());
		user.setUserPw(securePw);
		
		
		System.out.println("암호화 후 비밀번호 : " + user.getUserPw());
		
		
		dao.updatePw(user);
	}

	//회원 탈퇴 처리
	@Override
	public void withdrawal(UserVO user) throws Exception {
		
		
		dao.withdrawal(user);
		
		
	}
	
	
	
	
}

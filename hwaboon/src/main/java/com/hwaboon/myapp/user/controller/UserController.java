package com.hwaboon.myapp.user.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.hwaboon.myapp.user.model.LoginVO;
import com.hwaboon.myapp.user.model.UserVO;
import com.hwaboon.myapp.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//서비스 객체
	@Autowired
	private IUserService service;

	
	
	
	/* ************************** 회원 가입 *********************************  */
	//회원가입 페이지 열기 요청
	@GetMapping("/join")
	public ModelAndView join() throws Exception {
		
		logger.info("/user/join GET 요청 발생");

		return new ModelAndView("user/join");
	}

	//회원가입 처리 요청
	@PostMapping("")
	public String join(@RequestBody UserVO user) throws Exception {
		
		logger.info("/user/ POST 요청 발생");
		logger.info("Param : " + user);
		service.join(user);
		
		return "joinSuccess";
	}
	
	//아이디 중복 확인 체크 요청
	@PostMapping("/idCheck")
	public Map<String, Object> confrimId(@RequestBody String userId) throws Exception {
		System.out.println("중복 확인 요청 ID : " + userId);
		
		Map<String, Object> data = new HashMap<>();
		
		int result = service.isDuplicateId(userId);
		if(result == 0) {
			System.out.println("아이디 사용 가능 !");
			data.put("idConfirm", "OK");
		} else {
			System.out.println("아이디 중복 !");
			data.put("idConfirm", "NO");
		}
		
		return data;
	}
	
	//Email 중복 확인 체크 요청
	@PostMapping("/emailCheck")
	public Map<String, Object> confrimEmail(@RequestBody String userEmail) throws Exception {
		System.out.println("중복 확인 요청 ID : " + userEmail);
		
		Map<String, Object> data = new HashMap<>();
		
		int result = service.isDuplicateEmail(userEmail);
		if(result == 0) {
			System.out.println("이메일 사용 가능 !");
			data.put("emailConfirm", "OK");
		} else {
			System.out.println("이메일 중복 !");
			data.put("emailConfirm", "NO");
		}
		
		return data;
	}
	
	
	
	
	
	/* ************************** 로그인 *********************************  */
	//로그인 페이지 요청
	@GetMapping("/login")
	public ModelAndView login() throws Exception {
		logger.info("/user/login GET 요청 !");
		
		return new ModelAndView("user/login");
	}
	
	//로그인 체크
	@PostMapping("/loginCheck")
	public String login(@RequestBody LoginVO login, HttpSession session, HttpServletResponse res) throws Exception {
		logger.info("/user/loginCheck : POST 요청!");
		logger.info("폼에서 받아온 로그인 정보 : " + login);
		
		//암호의 보안을 위한 객체 선언 
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		
		//폼에서 받아온 로그인 정보로 DB에서 회원정보를 꺼낸 후 정보를 user객체에 담기
		UserVO loginTryUser = service.login(login);
		logger.info("로그인 시도한 회원의 모든 정보 : " + loginTryUser);
		
		String result = null;
		
		if(loginTryUser != null) { //로그인 시도한 회원 정보가 존재할 경우
			if(encoder.matches(login.getUserPw(), loginTryUser.getUserPw())) {
				//비밀번호가 일치할 경우 로그인 성공 (폼에서 받아온 패스워드, DB에 저장된 패스워드)
				result = "loginSuccess";
				
				//로그인이 성공하면 세션에 회원의 정보를 담는다.(login이라는 이름의 세션에 user객체를 담는다)
				session.setAttribute("login", loginTryUser);
				
				//로그인 유지
				if(login.isAutoLogin()) {
					logger.info("로그인 유지에 체크되어있음!");
					long limitTime = 60 * 60 * 24 * 90;
					Date sessionLimit = new Date(System.currentTimeMillis() + (limitTime * 1000));
					
					//쿠키 생성
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					//쿠키 속성 설정
					loginCookie.setMaxAge((int)limitTime);
					loginCookie.setPath("/");
					//생성된 쿠키를  response객체에 실어서 전송.
					res.addCookie(loginCookie);

					service.keepLogin(loginTryUser.getUserId(), session.getId(), sessionLimit);
				}
				
			} else {
				//비밀번호가 틀린 경우 로그인 실패
				result = "pwFail";
			}
			
		} else { //로그인 시도한 회원 정보가 존재하지 않을 경우 로그인 실패
			result = "idFail";
		}
		return result;
	}
	
	//아이디 찾기 페이지 요청
	@GetMapping("/find_id")
	public ModelAndView find_id() throws Exception {
		return new ModelAndView("user/find_id");
	}
	
	
	//아이디 찾기
	@PostMapping("/findId")
	public String findId(@RequestBody String userEmail) throws Exception {

		
		return service.findId(userEmail);
	}
	
	//비밀번호 찾기 페이지 요청
	@GetMapping("/find_pw")
	public ModelAndView find_pw() throws Exception {
		return new ModelAndView("user/find_pw");
	}
	
	//비밀번호 찾기 요청
	@PostMapping("/findPw")
	public String findPw(@RequestBody UserVO user) throws Exception {
		System.out.println("폼에서 받아온 값 : " + user);
		
		System.out.println("db에서 실행한 결과 : " + service.findPw(user));
		
		return service.findPw(user);
	}
	
	
	
	
	
	
	
	/* ************************** 마이 페이지 *********************************  */
	//마이페이지 열람 요청
	@GetMapping("/mypage")
	public ModelAndView mypage() throws Exception {
		return new ModelAndView("user/mypage");
	}
	
	
	
	
	
	
	
	
	/* **************************** 회원정보 변경 ******************************* */
	//회원정보 변경 페이지 요청
	@GetMapping("/update_info")
	public ModelAndView updateInfo() throws Exception {
		logger.info("/user/update_info : GET요청");
		return new ModelAndView("user/update_info");
	}
	
	//회원 정보(이름, 이메일) 변경 처리 요청 
	@PostMapping("/updateInfo")
	public String updateInfo(@RequestBody UserVO user, HttpSession session) throws Exception {
		logger.info("회원정보 변경 처리  POST 요청 ! ");
		service.updateInfo(user);
		
		//회원정보 변경에 성공하면 로그인 세션객체에 담는다.
		LoginVO login = new LoginVO();
		login.setUserId(user.getUserId());
		UserVO updateUser = service.login(login);
		session.setAttribute("login", updateUser);
		
		return "updateSuccess";
	}
	
	
	
	
	/* **************************** 비밀번호 변경 ******************************* */
	//비밀번호 변경 페이지 요청
	@GetMapping("/update_pw")
	public ModelAndView updatePw() throws Exception {
		return new ModelAndView("user/update_pw");
	}
	
	//비밀번호 확인 처리 요청
	@PostMapping("/checkPw")
	public String checkPw(@RequestBody String userPw, HttpSession session) throws Exception {
		logger.info("비밀번호 확인 요청!!");
		
		String result = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		//세션에 있는 정보로 db에 있는 정보 가져오기
		UserVO dbUser = (UserVO)session.getAttribute("login");
		logger.info("DB 회원의 비밀번호 : " + dbUser.getUserPw());
		logger.info("폼에서 받아온 비밀번호 : " + userPw);
	
		
		if(encoder.matches(userPw, dbUser.getUserPw())) {
			result = "pwConfirmOK";
		} else {
			result = "pwConfirmNO";
		}

		return result;
		
	}
	
	//비밀번호 변경 요청
	@PostMapping("/updatePw")
	public String updatePw(@RequestBody UserVO user, HttpSession session) throws Exception {
		
		logger.info("비밀번호 변경 처리 POST 요청");
		
		
		service.updatePw(user);
		
		//비밀번호 변경에 성공하면 로그인 세션객체에 담는다.
		LoginVO login = new LoginVO();
		login.setUserId(user.getUserId());
		UserVO updateUser = service.login(login);
		session.setAttribute("login", updateUser);
	
		return  "updateSuccess";
		
	}
	
	
	
	
	
	/* ************************** 로그아웃 ***************************** */
	//로그아웃 요청
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception {

		Object object = session.getAttribute("login");
		if (object != null) {
			UserVO userVO = (UserVO) object;
			session.removeAttribute("login");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(userVO.getUserId(), "none", new Date());
			}
		}
		return new ModelAndView("redirect:/");
	}
	
	
	
	/* ************************** 회원 탈퇴 **************************** */
	//탈퇴 페이지 요청
	@GetMapping("/withdrawal")
	public ModelAndView withdrawal() throws Exception {
		return new ModelAndView("user/withdrawal");
	}
	
	//탈퇴 요청 처리
	@PostMapping("/withdrawal")
	public String withdrawal(@RequestBody UserVO user, HttpSession session) throws Exception {
		
		System.out.println("폼에서 받아온 값 : " + user);
		
		
		String result = checkPw(user.getUserPw(), session);
		System.out.println("result값 : " + result);
		
		if(result.equals("pwConfirmOK")) { //비밀번호가 일치할 경우 삭제
			service.withdrawal(user);
			result = "Success";
		} else {
			result = "Fail";
		}
		
		return result;
		
	}
	
}

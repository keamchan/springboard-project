package com.spring.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.HomeController;
import com.spring.board.vo.BoardVo;
import com.spring.common.CommonUtil;
import com.spring.user.service.UserService;
import com.spring.user.vo.UserVo;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/user/userJoin.do", method = RequestMethod.GET)
	public String userJoin(Locale locale, Model model, BoardVo boardVo) throws Exception{
		
		List<BoardVo> userPhoneList = new ArrayList<BoardVo>();
		
		userPhoneList = userService.SelectUserPhoneList(boardVo);
		model.addAttribute("userPhoneList", userPhoneList);
		
		return "user/userJoin";
	}
	
	@RequestMapping(value = "/user/userJoinAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String userJoinAction(Locale locale, Model model, UserVo userVo, String userId) throws Exception{
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		CommonUtil commonUtil = new CommonUtil();
		
		
		int resultDuplCnt = userService.userIdDuplCheck(userId);
		
		if(resultDuplCnt == 0) {
			
		int resultCnt = userService.userInsert(userVo);
		
		result.put("duplCheck", (resultDuplCnt > 0)?1:2);
		result.put("success", (resultCnt > 0)?1:2);
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		}
		return null;
	}

	@RequestMapping(value = "/user/userIdDuplCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int userIdDuplCheck(String userId) throws Exception{
		
		int resultCnt = userService.userIdDuplCheck(userId);
		
		return resultCnt;
	}
	
	
	@RequestMapping(value = "/user/userLogin.do", method = RequestMethod.GET)
	public String userLogin(Locale locale, Model model, BoardVo boardVo) throws Exception{
		

		
		return "user/userLogin";
	}
	
	@RequestMapping(value = "/user/userLogout.do", method = RequestMethod.GET)
	public String userLogout(Locale locale, Model model, BoardVo boardVo, HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/board/boardList.do";
	}
	
	
	@RequestMapping(value = "/user/userLoginAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String userLoginAction(Locale locale, Model model, UserVo userVo
			,HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		

		HashMap<String, Object> result = new HashMap<String, Object>();
		
		CommonUtil commonUtil = new CommonUtil();
		HttpSession session = req.getSession();
		
		int resultIdCnt = userService.userIdCheck(userVo);
		int resultPwCnt = userService.userPwCheck(userVo);
		UserVo resultLogin = userService.userLoginAction(userVo);
		
		if(resultIdCnt == 1 && resultPwCnt == 1) {
			//�α��� ����
			session.setAttribute("user", resultLogin);
			result.put("msg", 1);
		} else if(resultIdCnt == 1) {
			//��й�ȣ Ȯ��
			session.setAttribute("user", null);
			result.put("msg", 2);
		} else {
			//���̵� Ȯ��
			session.setAttribute("user", null);
			result.put("msg", 3);
		}

		String callbackMsg = commonUtil.getJsonCallBackString("", result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	
	
	
	
	
}

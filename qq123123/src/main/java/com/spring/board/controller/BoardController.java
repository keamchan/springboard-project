package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;
import com.spring.user.vo.UserVo;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

//	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
//	public String boardList(Locale locale, Model model,PageVo pageVo, BoardVo boardVo) throws Exception{
//		
//		List<BoardVo> boardList = new ArrayList<BoardVo>();
//		List<BoardVo> codeIdList = new ArrayList<BoardVo>();
//		
//		int page = 1;
//		int totalCnt = 0;
//		
//		if(pageVo.getPageNo() == 0){
//			pageVo.setPageNo(page);
//		}
//		
//		boardList = boardService.SelectBoardList(pageVo);
//		codeIdList = boardService.SelectCodeIdList(boardVo);
//		
//		totalCnt = boardService.selectBoardCnt();
//		
//		model.addAttribute("boardList", boardList);
//		model.addAttribute("codeIdList", codeIdList);
//		model.addAttribute("totalCnt", totalCnt);
//		model.addAttribute("pageNo", page);
//		
//
//		
//		return "board/boardList";
//	}

	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);

		return "board/boardView";
	}

	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, BoardVo boardVo, HttpServletRequest req) throws Exception {

		List<BoardVo> codeIdList = new ArrayList<BoardVo>();

		codeIdList = boardService.SelectCodeIdList(boardVo);
		model.addAttribute("codeIdList", codeIdList);

		UserVo user = (UserVo) req.getSession().getAttribute("user");

		return "board/boardWrite";
	}


	

	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale, BoardVo boardVo
			,HttpServletRequest req) throws Exception{
		
		
//		System.out.println(ToStringBuilder.reflectionToString(boardType));
//		System.out.println(ToStringBuilder.reflectionToString(boardVo));
//
//		int resultCnt = 0;
//		List<BoardVo> board = new ArrayList<BoardVo>();
//		board.add(boardVo);
//		
//		for (int i=0; i<board.size(); i++) {
//			
//			boardVo = board.get(i);
//		
//			resultCnt = boardService.boardInsert(boardVo);
//			resultCnt++;
//			
//			System.out.println(board);
//		}
		
		String[] boardType = boardVo.getBoardType().split(","); 
		String[] boardTitle = boardVo.getBoardTitle().split(","); 
		String[] boardComment = boardVo.getBoardComment().split(","); 
		
		int resultCnt = 0;
	
		for (int i=0; i<boardType.length; i++) {
			
			HashMap<String, String> board = new HashMap<String, String>();
			
			board.put("boardType", boardType[i]);
			board.put("boardTitle", boardTitle[i]);
			board.put("boardComment", boardComment[i]);
			board.put("creator", boardVo.getCreator());
		    
			resultCnt = boardService.boardInsert(board);
			
		}

		

		

		HashMap<String, String> result = new HashMap<String, String>();

		
		CommonUtil commonUtil = new CommonUtil();
		
		
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
//		System.out.println("----------------" + boardVo.getBoardType());
		
		UserVo user = (UserVo)req.getSession().getAttribute("user");
		
		return callbackMsg;
	}
	
	
	
	
	
	
	
	/*
	 * @RequestMapping(value = "/board/boardWriteAction.do", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public String boardWriteAction(Locale locale,BoardVo boardVo
	 * ,HttpServletRequest req) throws Exception{
	 * 
	 * System.out.println("!!!!!!!!BoardVo:"+boardVo.toString()); String[] boardType
	 * = boardVo.getBoardType().split(",");
	 * System.out.println("!!!!!!!!BoardType:"+boardType); String[] boardTitle =
	 * boardVo.getBoardTitle().split(","); String[] boardComment =
	 * boardVo.getBoardComment().split(",");
	 * 
	 * for(int i=0; i<boardType.length; i++);
	 * 
	 * System.out.println(boardType[1]);
	 * 
	 * 
	 * HashMap<String, String> result = new HashMap<String, String>(); //
	 * HashMap<String, Object> hmap = new HashMap<String, Object>();
	 * 
	 * // hmap.put("boardVo", boardVo); // hmap.put("boardType", boardType);
	 * 
	 * CommonUtil commonUtil = new CommonUtil();
	 * 
	 * int resultCnt = boardService.boardInsert(boardVo);
	 * 
	 * result.put("success", (resultCnt > 0)?"Y":"N"); String callbackMsg =
	 * commonUtil.getJsonCallBackString(" ",result);
	 * 
	 * System.out.println("callbackMsg::"+callbackMsg);
	 * System.out.println("----------------" + boardVo.getBoardType());
	 * 
	 * UserVo user = (UserVo)req.getSession().getAttribute("user");
	 * 
	 * return callbackMsg; }
	 */
	 

	
	  @RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.GET)
	  public String boardDelete(@RequestParam int boardNum, Model model) throws
	  Exception{
	  
	  int result = boardService.boardDelete(boardNum);
	  
	  
	  System.out.println("result: " + result);
	  
	  return "redirect:boardList.do"; }
	 

	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardDelete(Locale locale, Model model, @RequestParam("boardNum") int boardNum) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardDelete(boardNum);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		// System.out.println("callbackMsg::"+callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdateView.do", method = RequestMethod.GET)
	public String boardUpdateView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum) throws Exception {

		BoardVo boardVo = new BoardVo();

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);

		return "board/boardModify";
	}

	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale, BoardVo boardVo, Model model) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardUpdate(boardVo);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardListCheck(Locale locale, Model model, PageVo pageVo, BoardVo boardVo, HttpServletRequest req,
			@RequestParam(value = "boardType", required = false) List<String> boardTypeList
//			,@RequestParam("boardTypeList") String boardTypeList 
	) throws Exception {
		// HashMap<String, Object> boardList = new HashMap<String, Object>();

//		String[] a = boardTypeList.split(","); 
//		List<String> list = Arrays.asList(a);

//		for (int i=0; i<a.length; i++) {
//		    System.out.println(a);
//		}
		System.out.println("boardTypeList --------------------------------" + boardTypeList);

		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("boardTypeList", boardTypeList);
		hmap.put("pageVo", pageVo);

		int page = 1;
		int totalCnt = 0;

		if (pageVo.getPageNo() == 0) {
			pageVo.setPageNo(page);
		}

		List<BoardVo> codeIdList = new ArrayList<BoardVo>();
		List<BoardVo> boardList = new ArrayList<BoardVo>();

		boardList = boardService.boardListCheck(hmap);
		codeIdList = boardService.SelectCodeIdList(boardVo);
		totalCnt = boardService.selectBoardCnt();

		model.addAttribute("boardList", boardList);
		model.addAttribute("codeIdList", codeIdList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);

		UserVo user = (UserVo) req.getSession().getAttribute("user");
		System.out.print("////////////////////////// " + ToStringBuilder.reflectionToString(user));

		return "board/boardList";
	}

}

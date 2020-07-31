package kr.green.last.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.last.pagination.Criteria;
import kr.green.last.pagination.PageMaker;
import kr.green.last.service.BoardService;
import kr.green.last.utils.UploadFileUtils;
import kr.green.last.vo.BoardVo;
import kr.green.last.vo.FileVo;
import kr.green.last.vo.UserVo;


@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
//	@Resource
	private String uploadPath = "D:\\git\\uploadfiles";
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardListGet(ModelAndView mv, Criteria cri) {
		mv.setViewName("/board/list");
	    PageMaker pageMaker = boardService.getPageMaker(cri);
		ArrayList<BoardVo> list = boardService.getBoardList(cri);
		mv.addObject("list",list);
		mv.addObject("pm", pageMaker);
		return mv;
	}
	
	@RequestMapping(value = "/board/register", method = RequestMethod.GET)
	public ModelAndView boardRegisterGet(ModelAndView mv) {
		mv.setViewName("/board/register");
		return mv;
	}
	
	@RequestMapping(value = "/board/register", method = RequestMethod.POST)
	public ModelAndView boardRegisterPost(ModelAndView mv, BoardVo board, HttpServletRequest r,  MultipartFile[] file) throws IOException, Exception {
		boardService.insertBoard(board, r);
		int boardNum = boardService.getBoardNum();
		for(MultipartFile tmp : file) {
			if(!(tmp.getOriginalFilename() == "")) {
				String fileName = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes());
				boardService.insertFile(boardNum, fileName);
			}
		}
		boardService.updateBoardFile(boardNum);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	
	@RequestMapping(value = "/board/detail", method = RequestMethod.GET)
	public ModelAndView boardDetailGet(ModelAndView mv, Integer num) {
		BoardVo board = boardService.getBoard(num);
		ArrayList<FileVo> list = boardService.getFileList(num);
		if(board != null) {
			board.setViews(board.getViews() + 1);
			mv.addObject("board", board);
			mv.addObject("list", list);
			mv.setViewName("/board/detail");
		}
		else 
			mv.setViewName("redirect:/board/list");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/board/download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    try{
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);
	        fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
	
	@RequestMapping(value ="/commend")
	@ResponseBody
	public Map<Object, Object> commend(@RequestBody int num, HttpServletRequest r){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("isCommend", boardService.updateCommend(num, r, 1));
	    map.put("commend", boardService.getBoard(num).getCommend());
	    map.put("deprecated", boardService.getBoard(num).getDeprecated());
		return map;
	}
	
	@RequestMapping(value ="/deprecated")
	@ResponseBody
	public Map<Object, Object> deprecated(@RequestBody int num, HttpServletRequest r){
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    map.put("isCommend", boardService.updateCommend(num, r, 0));
	    map.put("commend", boardService.getBoard(num).getCommend());
	    map.put("deprecated", boardService.getBoard(num).getDeprecated());
		return map;
	}
	
	@RequestMapping(value = "/board/modify", method = RequestMethod.GET)
	public ModelAndView boardModifyGet(ModelAndView mv, Integer num, HttpServletRequest r) {
		BoardVo board = boardService.getBoard(num);
		UserVo user = (UserVo)r.getSession().getAttribute("user");
		if(board != null && board.getWriter().equals(user.getId())) {
			ArrayList<FileVo> list = boardService.getFileList(num);
			mv.addObject("board", board);
			mv.addObject("list", list);
			mv.setViewName("/board/modify");
		}
		else
			mv.setViewName("redirect:/board/list");
		return mv;
	}
	
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public ModelAndView boardModifyPost(ModelAndView mv, BoardVo board, MultipartFile[] file, String[] file2) throws IOException, Exception {
		boardService.deleteBoardFile(board.getNum());
		if(file2 != null) {
			for(String tmp : file2) {
				if(!tmp.equals("")) {
					boardService.insertFile(board.getNum(), tmp);
				}
			}
		}
		if(file != null) {
			for(MultipartFile tmp : file) {
				if(!(tmp.getOriginalFilename() == "")) {
					String fileName = UploadFileUtils.uploadFile(uploadPath, tmp.getOriginalFilename(),tmp.getBytes());
					boardService.insertFile(board.getNum(), fileName);
				}
			}
		}
		boardService.updateBoard(board);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public ModelAndView boardDeleteGet(ModelAndView mv, Integer num, HttpServletRequest r) {
		boardService.deleteBoard(num, r);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
}
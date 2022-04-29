package kh.semi.tomorrow.storyboard.medel.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.tomorrow.storyboard.model.dao.StoryboardDao;
import kh.semi.tomorrow.storyboard.model.vo.StoryBoardVo;

import static kh.semi.tomorrow.common.JdbcTemp.*;

public class StoryboardService {
	private StoryboardDao dao = new StoryboardDao();
	
	public int writeStoryBoard(StoryBoardVo vo) {
		System.out.println("StoryboardService vo : " + vo);
		
		Connection conn = null;
		int result = 0;
		
		conn = getConnection();
		result = dao.writeStoryBoard(conn, vo);
		
		close(conn);
		
		System.out.println("StoryboardService result : " + result);
		
		return result;
	}
	
	public int updateStoryBoard(StoryBoardVo vo) {
		System.out.println("StoryboardService vo : " + vo);
		
		Connection conn = null;
		int result = 0;
		
		conn = getConnection();
		result = dao.updateStoryBoard(conn, vo);

		close(conn);
		
		System.out.println("StoryboardService result : " + result);
		
		return result;
	}
	
	public ArrayList<StoryBoardVo> listStoryBoard() {
		Connection conn = null;
		ArrayList<StoryBoardVo> result = null;
		
		conn = getConnection();
		result = dao.listStoryBoard(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<StoryBoardVo> listStoryBoard(int startRnum, int endRnum) {
		Connection conn = null;
		ArrayList<StoryBoardVo> result = null;
		
		conn = getConnection();
		result = dao.listStoryBoard(conn, startRnum, endRnum);
		
		close(conn);
		
		System.out.println("StoryboardService result : " + result);
		
		return result;
	}
	
	public int countStoryBoard() {
		Connection conn=null;
		int result = 0;
		
		conn = getConnection();
		result = dao.countStoryBoard(conn);
		
		close(conn);
		
		System.out.println("StoryboardService result : " + result);
		
		return result;
	}
	
	public StoryBoardVo readStoryBoard(int bNo) {
		Connection conn = null;
		StoryBoardVo result = null;
		
		conn = getConnection();
		result = dao.readStoryBoard(conn, bNo);
		
		close(conn);
		
		System.out.println("StoryboardService result : " + result);
		
		return result;
	}
}

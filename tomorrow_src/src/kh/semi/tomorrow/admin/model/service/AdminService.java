package kh.semi.tomorrow.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import kh.semi.tomorrow.admin.model.dao.AdminDao;
import kh.semi.tomorrow.common.JdbcTemp;
import kh.semi.tomorrow.member.model.vo.MemberVo;
import kh.semi.tomorrow.product.model.vo.ProductDetailVo;
import kh.semi.tomorrow.product.model.vo.ProductVo;
import kh.semi.tomorrow.storyboard.model.vo.StoryBoardVo;

public class AdminService {
	private AdminDao dao = new AdminDao();
	
	// 카테고리별 상품 조회
	public ArrayList<ProductVo> ctgryProduct(String ctgry){
		Connection conn = JdbcTemp.getConnection();
		ArrayList<ProductVo> volist = dao.ctgryProduct(conn, ctgry);
		JdbcTemp.close(conn);
		return volist;
	}
	// 상품 번호를 통한 상품 조회		
	public ProductVo searchProduct(int pNo, int pSeq) {
		ProductVo vo = new ProductVo();
		Connection conn = JdbcTemp.getConnection();
		vo = dao.searchProduct(conn, pNo, pSeq);		
		System.out.println("AdminService - searchProduct()\nproduct:\t\t" + vo + "\n");
		JdbcTemp.close(conn);
		return vo;
	}
	
	// 상품 등록
	public int insertProduct(ProductVo product, ProductDetailVo detail) {
		int result = 0; int result2 = 0; int result3 = 0;
		Connection conn= JdbcTemp.getConnection();
		// Transaction
		JdbcTemp.setAutocommit(conn, false);
		int pNo = dao.getProductPNo(conn);
		result=dao.insertProduct(conn, product, pNo);
		
		if(result > 0) {
			result2=dao.insertProductDetail(conn, detail, pNo);
		}
		if(result2 > 0) {
			// 상품 이미지 등록
			
		}
		if(result > 0 && result2 > 0) {
			JdbcTemp.commit(conn);
		}
		else { 
			JdbcTemp.rollback(conn);
		}
		
		System.out.println("AdminService - insertProduct()\npNo:\t\t" + pNo);
		System.out.println("AdminService - insertProduct()\nresult:\t\t" + result);
		System.out.println("AdminService - insertProductDetail()\nresult2:\t\t" + result2 + "\n");
		JdbcTemp.close(conn);
		return result;
	}
	
	// 상품 상세옵션 추가
	public int insertProductDetail(ProductDetailVo detail, int pNo) {
		int result = 0;
		Connection conn = JdbcTemp.getConnection();
		result = dao.insertProductDetail(conn, detail, pNo);
		System.out.println("AdminService - insertProductDetail()\nresult:\t\t" + result + "\n");
		JdbcTemp.close(conn);
		return result;
	}
	
	// 상품 이미지 등록
	public int insertProductContent(ProductVo vo) {
		int result = 0;
		Connection conn = JdbcTemp.getConnection();
		result = dao.insertProductContent(conn, vo);
		if(result == 0) {
			System.out.println("AdaminService-insertProductContent()가 실패했습니다.");
		} else {			
			System.out.println("AdminService-insertProductContent()\nresult:\t\t" + result + "\n");			 
		}
		JdbcTemp.close(conn);
		return result;
	}
	
	// 상품 수정
	public int updateProduct(ProductVo product, ProductDetailVo detail, int pNo, int pSeq) {
		int result = 0; int result2=0;
		Connection conn = JdbcTemp.getConnection();
		result = dao.updateProduct(conn, product, pNo);
		
		if(result > 0) {
			result2 = dao.updateProductDetail(conn, detail, pNo, pSeq);
		}
		if(result > 0 && result2 > 0) {
			JdbcTemp.commit(conn);
		}
		else { 
			JdbcTemp.rollback(conn);
		}
		
		System.out.println("AdminService - updateProduct()\npNo:\t\t" + pNo);
		System.out.println("AdminService - updateProduct()\nresult:\t\t" + result);
		System.out.println("AdminService - updateProductDetail()\nresult2:\t\t" + result2 + "\n");
		JdbcTemp.close(conn);
		return result;
	}	
	
	// 상품 삭제
	public int deleteProduct(int pNo) {
		int result = 0;
		Connection conn= JdbcTemp.getConnection();
		result=dao.deleteProduct(conn, pNo);
		JdbcTemp.close(conn);
		return result;
	}
	
	// 모든 회원 목록
	public ArrayList<MemberVo> selectAllMember() {
		Connection conn = JdbcTemp.getConnection();
		ArrayList<MemberVo> volist = dao.selectAllMember(conn);
		JdbcTemp.close(conn);
		return volist;
	}
	
	public ArrayList<MemberVo> selectAllMember(int startNum, int endNum) {
		Connection conn = JdbcTemp.getConnection();
		ArrayList<MemberVo> volist = dao.selectAllMember(conn, startNum, endNum);
		JdbcTemp.close(conn);
		return volist;
	}
	
	// 탍퇴한 회원들의 목록
	public ArrayList<MemberVo> leaveMember() {
		Connection conn = JdbcTemp.getConnection();
		ArrayList<MemberVo> volist = dao.leaveMember(conn);
		JdbcTemp.close(conn);
		return volist;
	}
	
	// 회원 탈퇴 여부 변경
	public int updateWithDraw(String[] mIds) {
		int result = 0;
		Connection conn= JdbcTemp.getConnection();
		JdbcTemp.setAutocommit(conn, false);
		boolean flag = true;
		
		for(int i=0; i< mIds.length; i++) {
			System.out.println(mIds[i]);
			result=dao.updateWithDraw(conn, mIds[i]);
			if(result == 0) {
				flag = false;
				break;
			}
		}
		
		if(flag) {
			JdbcTemp.commit(conn);
		} else { 
			JdbcTemp.rollback(conn);
		}
		
		JdbcTemp.close(conn);
		return result;
	}
	
	// 회원 탈퇴 실행
	public int deleteMember(String mId) {
		int result = 0;
		Connection conn= JdbcTemp.getConnection();
		result=dao.deleteMember(conn, mId);
		JdbcTemp.close(conn);
		return result;
	}
	
	public int countMember() {
		int result = 0;
		Connection conn= JdbcTemp.getConnection();
		result=dao.countMember(conn);
		JdbcTemp.close(conn);
		return result;
	}
	
	public ArrayList<StoryBoardVo> boardList() {
		Connection conn = JdbcTemp.getConnection();
		ArrayList<StoryBoardVo> boardlist = dao.boardList(conn);
		JdbcTemp.close(conn);
		return boardlist;
	}
	
	public ArrayList<StoryBoardVo> boardList(int startNum, int endNum) {
		Connection conn = JdbcTemp.getConnection();
		ArrayList<StoryBoardVo> boardlist = dao.boardList(conn, startNum, endNum);
		JdbcTemp.close(conn);
		return boardlist;
	}
	
	public int countBoard() {
		int result = 0;
		Connection conn= JdbcTemp.getConnection();
		result=dao.countBoard(conn);
		JdbcTemp.close(conn);
		return result;
	}
	
	public int deleteBoard(int[] bNos) {
		int result = 0;
		Connection conn= JdbcTemp.getConnection();
		JdbcTemp.setAutocommit(conn, false);
		boolean flag = true;
		
		for(int i=0; i< bNos.length; i++) {
			System.out.println(bNos[i]);
			result=dao.deleteBoard(conn, bNos[i]);
			if(result == 0) {
				flag = false;
				break;
			}
		}
		
		if(flag) {
			JdbcTemp.commit(conn);
		} else { 
			JdbcTemp.rollback(conn);
		}
		
		JdbcTemp.close(conn);
		return result;
	}
	
}

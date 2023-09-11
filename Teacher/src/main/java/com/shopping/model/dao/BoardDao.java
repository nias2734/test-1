package com.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.bean.Board;
import com.shopping.utility.Paging;

import oracle.net.aso.p; 

public class BoardDao extends SuperDao{
	public Integer GetReplyCount(int groupno) throws Exception {
		System.out.println("검색할 그룹 번호 : " + groupno);
		
		// 해당 그룹 번호의 데이터 행 개수를 반환해 줍니다.
		int cnt = -1 ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select count(*) as cnt from boards " ;
		sql += " where groupno = ? " ; 
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, groupno);
		
		rs = pstmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		conn.commit() ;
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}		
		
		return cnt ;
	}	
	public int UpdateData(Board bean) throws Exception {
		System.out.println(bean); 
		
		int cnt = -1 ;
		
		String sql = " update boards set id = ?, password = ?, subject = ?, content = ?, regdate = ?, groupno = ?, orderno = ?, depth = ? " ;
		sql += " where no = ? " ; 
		
		PreparedStatement pstmt = null ;		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql) ; 
		
		pstmt.setString(1, bean.getId());		
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getSubject());		
		pstmt.setString(4, bean.getContent());
		pstmt.setString(5, bean.getRegdate());
		pstmt.setInt(6, bean.getGroupno());
		pstmt.setInt(7, bean.getOrderno());
		pstmt.setInt(8, bean.getDepth());
		pstmt.setInt(9, bean.getNo());
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}	
	public int GetTotalRecordCount(String mode, String keyword) throws Exception {
		System.out.print("검색할 필드명 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);
		
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from boards " ;
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ;
		}
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ; 
		
		int cnt = -1 ;
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}		

	public int GetTotalRecordCount() throws Exception {
		// 테이블의 총 행개수를 구합니다.
		String sql = " select count(*) as cnt from boards " ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ; 
		
		int cnt = -1 ;
		
		if(rs.next()) {
			cnt = rs.getInt("cnt") ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return cnt;
	}	
	
	public Board getDataByPrimaryKey(Integer no) throws Exception{
		String sql = " select * from boards " ;
		sql += " where no = ?" ;
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		conn = super.getConnection() ;
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, no);
		
		rs = pstmt.executeQuery() ; 
		
		Board bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs) ;
		}
		
		if(rs!=null) {rs.close();}
		if(pstmt!=null) {pstmt.close();}
		if(conn!=null) {conn.close();}
		
		return bean;
	}	
	
	public List<Board> selectAll(Paging pageInfo) throws Exception{
		// TopN 구문을 사용하여 페이징 처리된 게시물 목록을 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select no, id, password, subject, content, readhit, regdate, remark, groupno, orderno, depth " ;
		
		// 답글 이전 코딩 방식
		// sql += " from (select no, id, password, subject, content, readhit, regdate, remark, groupno, orderno, depth, rank() over(order by no desc) as ranking " ;
		
		sql += " from (select no, id, password, subject, content, readhit, regdate, remark, groupno, orderno, depth, rank() over(order by groupno desc, orderno asc) as ranking " ;		
		sql += " from boards " ;
		
		String mode = pageInfo.getMode() ;
		String keyword = pageInfo.getKeyword() ; 
		
		if(mode == null || mode.equals("all") ) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ;
		}
		
		sql += " ) " ;
		sql += " where ranking between ? and ? " ;
		
		conn = super.getConnection();
		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, pageInfo.getBeginRow());
		pstmt.setInt(2, pageInfo.getEndRow());
		
		rs = pstmt.executeQuery() ;
		
		List<Board> lists = new ArrayList<Board>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}		
	
	public List<Board> selectAll() throws Exception{
		// 게시물 목록을 게시물 글번호 역순 정렬하여 반환합니다.
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = " select * from boards order by no desc";
		
		conn = super.getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
		rs = pstmt.executeQuery() ;
		
		List<Board> lists = new ArrayList<Board>();
		
		while(rs.next()) {
			lists.add(getBeanData(rs)) ;
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return lists;
	}	
	
	private Board getBeanData(ResultSet rs) throws Exception {
		// ResultSet 정보를 Bean으로 만들어서 반환해 줍니다.
		Board bean = new Board() ;
		
		bean.setContent(rs.getString("content"));		
		bean.setId(rs.getString("id"));
		bean.setPassword(rs.getString("password"));
		bean.setSubject(rs.getString("subject"));
		
		bean.setRegdate(String.valueOf(rs.getDate("regdate")));
		
		bean.setNo(rs.getInt("no"));
		bean.setReadhit(rs.getInt("readhit"));
		bean.setGroupno(rs.getInt("groupno"));
		bean.setOrderno(rs.getInt("orderno"));
		bean.setDepth(rs.getInt("depth"));
		
		return bean;
	}

	public int InsertData(Board bean) throws Exception{
		System.out.println(bean); 		
		// Bean 객체 정보를 이용하여 데이터 베이스에 추가합니다.
		int cnt = -1 ;
		
		String sql = " insert into boards(no, id, password, subject, content, regdate, groupno, orderno, depth) " ;
		sql += " values(seqboard.nextval, ?, ?, ?, ?, ?, seqboard.currval, default, default)" ; 
		
		PreparedStatement pstmt = null ;		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		pstmt = conn.prepareStatement(sql) ; 
		
		pstmt.setString(1, bean.getId());		
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getSubject());		
		pstmt.setString(4, bean.getContent());
		pstmt.setString(5, bean.getRegdate());		
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}	
	
	public int ReplyData(Board bean, Integer orderno) throws Exception{
		System.out.println(bean); 	
		
		PreparedStatement pstmt = null ;		
		int cnt = -1 ;
		
		conn = super.getConnection() ;
		conn.setAutoCommit(false);		
		
		// step1 : 동일한 그룹 번호에 대하여 orderno 컬럼의 숫자를 1씩 증가 시켜야 합니다.
		String sql1 = " update boards set orderno = orderno + 1 " ;
		sql1 += " where groupno = ? and orderno > ? " ; 
		
		pstmt = conn.prepareStatement(sql1) ;
		pstmt.setInt(1, bean.getGroupno());
		pstmt.setInt(2, orderno);
		cnt = pstmt.executeUpdate() ;
		
		pstmt = null ; 
		// step2 : Bean 객체 정보를 이용하여 답글을 작성합니다.
		String sql2 = " insert into boards(no, id, password, subject, content, regdate, groupno, orderno, depth) " ;
		sql2 += " values(seqboard.nextval, ?, ?, ?, ?, ?, ?, ?, ?)" ; 
		
		pstmt = conn.prepareStatement(sql2) ; 
		
		pstmt.setString(1, bean.getId());		
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getSubject());		
		pstmt.setString(4, bean.getContent());
		pstmt.setString(5, bean.getRegdate());		
		pstmt.setInt(6, bean.getGroupno());
		pstmt.setInt(7, bean.getOrderno());
		pstmt.setInt(8, bean.getDepth());		
		
		cnt = pstmt.executeUpdate() ; 
		conn.commit();
		
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return cnt ;
	}		
	
	public Board getDataByPk(int no) {
		Board bean = new Board(no, "hong", "abc123", "jsp 프로그래밍", "잼있어요", 
				10,"2023/08/20", 0);
		
		return bean;
	}
	
	public List<Board> getDataList(){
		List<Board> datalist = new ArrayList<Board>();
		
		datalist.add(new Board(10, "hong", "abc123", "jsp 프로그래밍", "잼있어요", 10,"2023/08/20", 0));
		datalist.add(new Board(20, "hong", "abc123", "파이썬 프로그램", "잼있어요", 20,"2023/08/20", 0));
		datalist.add(new Board(30, "hong", "abc123", "database", "잼있어요", 30,"2023/08/20", 1));
		datalist.add(new Board(40, "park", "abc123", "R 프로그래밍", "잼있어요", 40,"2023/08/20", 2));
		datalist.add(new Board(50, "park", "abc123", "확률과 통계", "잼있어요", 50,"2023/08/20", 2));
				
		return datalist ; 
	}

	public Board GetDataByPk(Integer no) throws Exception {
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;		
		String sql = " select * from boards ";
		sql += " where no = ? " ;
		
		conn = super.getConnection();		
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, no); 
		
		rs = pstmt.executeQuery() ;
		
		Board bean = null ;
		
		if(rs.next()) {
			bean = this.getBeanData(rs);
			
		}		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return bean;
	}

}
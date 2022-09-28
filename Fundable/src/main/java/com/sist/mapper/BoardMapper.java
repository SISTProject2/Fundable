package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;

public interface BoardMapper {

	// 목록
	@Select("SELECT no, subject, name, TO_CHAR(regdate, 'yyyy-MM-dd') as dbday, hit, num "
			+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
			+ "FROM (SELECT no, subject, name, regdate, hit "
			+ "FROM goods_board2 ORDER BY no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardListData(Map map);
	
	
	
	// 작성
	@Insert("INSERT INTO goods_board(no, name, subject, content, pwd) VALUES("
			+ "(SELECT NVL(MAX(no)+1, 1) FROM goods_board2),"
			+ "#{name}, #{subject}, #{content}, #{pwd})")
	public void boardInsert(BoardVO vo);
	
	
	// 조회수
	@Update("UPDATE goods_board2 SET hit=hit+1 WHERE no=#{no}")
	public void hitIncrement(int no);
	
	
	
	// 상세
	@Select("SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, hit, num "
			+ "FROM (SELECT no, name, subject, content, regdate, hit, rownum as num "
			+ "FROM (SELECT no, name, subject, content, regdate, hit "
			+ "FROM goods_board2 ORDER BY no DESC)) "
			+ "WHERE no=#{no}")
	public BoardVO boardDetail(int no);
}

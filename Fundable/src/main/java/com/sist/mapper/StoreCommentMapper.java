package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.CommentVO;

public interface StoreCommentMapper {

	
	// 댓글 목록
	@Select("SELECT s_no, id, content, TO_CHAR(c_date, 'YYYY-MM-DD') as dbday, img, sg_no, num "
			+ "FROM (SELECT s_no, id, content, c_date, img, sg_no, rownum as num "
			+ "FROM (SELECT s_no, id, content, c_date, img, sg_no "
			+ "FROM store_comment2_2, user2_2 "
			+ "WHERE store_comment2_2.user_no = user2_2.user_no "
			+ "AND sg_no=#{sg_no} ORDER BY s_no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<CommentVO> commentListData(Map map);
	
	
	
	// 댓글 전체 페이지
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM store_comment2_2 WHERE sg_no=#{sg_no}")
	public int commentTotalPage(int sg_no);
	
	
	// 댓글 작성 처리
	@SelectKey(keyProperty = "s_no", resultType = int.class, before = true, 
				statement = "SELECT NVL(MAX(s_no)+1, 1) as s_no FROM store_comment2_2")
	
	@Insert("INSERT INTO store_comment2_2(s_no, user_no, content, c_date, sg_no) "
			+ "VALUES(#{s_no}, #{user_no}, #{content}, SYSDATE, #{sg_no})")
	public void commentInsert(CommentVO vo);
	
	@Select("SELECT sc_no FROM store_goods2_2 WHERE sg_no=#{sg_no}")
	public int storeGetScno(int sg_no);
	
	/*
	 * @Select("SELECT id FROM user2_2 WHERE user_no=#{user_no}") public String
	 * idSelectData(int user_no);
	 */
	
	
	// 댓글 수정 처리
	@Update("UPDATE store_comment2_2 SET content=#{content} WHERE s_no=#{s_no}")
	public void commentUpdate(CommentVO vo);
	
	
	// sg_no 가져오기
	@Select("SELECT sg_no FROM store_goods2_2 WHERE user_no=#{user_no}")
	public String sgNoSelectData(int user_no);
	
	
	// 댓글 삭제 처리
	@Delete("DELETE FROM store_comment2_2 WHERE s_no=#{s_no}")
	public void commentDelete(int s_no);
}

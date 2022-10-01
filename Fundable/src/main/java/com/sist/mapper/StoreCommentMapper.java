package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.vo.CommentVO;

public interface StoreCommentMapper {

	
	// 댓글 목록
	@Select("SELECT s_no, content, TO_CHAR(c_date, 'YYYY-MM-DD') as dbday, img, user_no, sg_no, group_id, group_step, group_tab, root, depth, num "
			+ "FROM (SELECT s_no, content, c_date, img, user_no, sg_no, group_id, group_step, group_tab, root, depth, rownum as num "
			+ "FROM (SELECT s_no, content, c_date, img, user_no, sg_no, group_id, group_step, group_tab, root, depth "
			+ "FROM store_comment2_2 WHERE sg_no=#{sg_no} ORDER BY s_no DESC ))"
			+ "WHERE num BETWEEN #{start} AND #{end}" )
	public List<CommentVO> commentListData(Map map);
	
	
	// 댓글 전체 페이지
	@Select("SELECT CEIL(COUNT(*)/5.0) FROM store_comment2_2")
	public int commentTotalPage();
	
	
	// 댓글 작성
	@SelectKey(keyProperty = "s_no", resultType = int.class, before = true, 
				statement = "SELECT NVL(MAX(s_no)+1, 1) as s_no FROM store_comment2_2")
	
	@Insert("INSERT INTO store_comment2_2(s_no, user_no, content, c_date, sg_no) "
			+ "VALUES(#{s_no}, #{user_no}, #{content}, SYSDATE, #{sg_no})")
	public void commentInsert(CommentVO vo);
	
	@Select("SELECT sc_no FROM store_goods2_2 WHERE sg_no=#{sg_no}")
	public int storeGetScno(int sg_no);
	
	@Select("SELECT id FROM user2_2 WHERE user_no=#{user_no}")
	public String idSelectData(int user_no);
}

package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StoreCommentMapper;
import com.sist.vo.CommentVO;

@Repository
public class CommentDAO {

	@Autowired
	private StoreCommentMapper mapper;
	//==
	
	public List<CommentVO> commentListData(Map map)
	{
		return mapper.commentListData(map);
	}
	
	public int commentTotalPage()
	{
		return mapper.commentTotalPage();
	}
	
	public void commentInsert(CommentVO vo)
	{
		mapper.commentInsert(vo);
	}
	
	public int storeGetScno(int sg_no) {
		return mapper.storeGetScno(sg_no);
	}
}

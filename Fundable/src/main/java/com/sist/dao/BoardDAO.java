package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class BoardDAO {

	@Autowired
	private BoardMapper mapper;
	//==
	
	
	public List<BoardVO> boardListData(Map map)
	{
		return mapper.boardListData(map);
	}
	
	
	public void boardInsert(BoardVO vo)
	{
		mapper.boardInsert(vo);
	}
	
	public BoardVO boardDetail(int no)
	{
		
		// 조회 수 증가
		mapper.hitIncrement(no);
		
		return mapper.boardDetail(no);

	}
	
	
	
}

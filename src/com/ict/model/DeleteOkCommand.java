package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ict.db.DAO;
import com.ict.db.VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DeleteOkCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	
	
		VO vo= new VO();
		vo.setIdx(request.getParameter("idx")); 
		int result = DAO.getDelete(vo);
		request.setAttribute("result", result);
		

	return "MyController?cmd=list";

}

}


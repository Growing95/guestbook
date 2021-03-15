package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOkCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	
	VO vo= new VO();
	try {
		String path= request.getServletContext().getRealPath("/upload");
		MultipartRequest mr= new MultipartRequest(request, path,100*1024*1024,"utf-8",new DefaultFileRenamePolicy());

		vo.setIdx((mr.getParameter("idx")));
		vo.setSubject(mr.getParameter("subject"));
		vo.setContent(mr.getParameter("content"));
		vo.setEmail(mr.getParameter("email"));
		vo.setPwd(mr.getParameter("pwd"));
		String f_name=mr.getParameter("f_name");
		if (mr.getFile("file_name")==null) {
			if (f_name==null) {
				vo.setFile_name("");
			}else {
				vo.setFile_name(f_name);
			}
		}else {
			vo.setFile_name(mr.getFilesystemName("file_name"));
		}
		int result = DAO.getUpdate(vo);
		request.setAttribute("idx", vo.getIdx());
		
		
	} catch (Exception e) {
		System.out.println(e);
	}
	return "MyController?cmd=onelist&idx="+vo.getIdx();

}
}

package com.work.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.work.entity.Achat;
import com.work.entity.Category;
import com.work.service.AchatService;
import com.work.service.CategoryService;
import com.work.service.UserService;
import com.work.util.Page;

@Controller
@RequestMapping("/achat")
public class AchatController {
	
	@Autowired
	private AchatService achatService ;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService ;
	
	@RequestMapping("/turnToAchatList")
	public String turnToAchatList(){
		return "/achat/achatList" ;
	}
	
	@RequestMapping("/getAchatList")
	public void getAchatList(Achat achat, HttpServletResponse response,int page,int rows){
		Page<Achat> achats = achatService.findByParams(achat, page, rows) ;
		for(Achat a : achats.getRows()){
			String category_id = a.getCategory_id() ;
			Category c = categoryService.get(Integer.parseInt(category_id)) ;
			a.setCategory_name(c.getName());
			String state = a.getState();
			if("0".equals(state)){
				a.setState("管理员处理中");
			}else if("1".equals(state)){
				a.setState("供应商报价中");
			}else if("1".equals(state)){
				a.setState("会员处理中");
			}else if("1".equals(state)){
				a.setState("供应商上架中");
			}
			
			Date d = a.getCreate_date() ;
			SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd") ;
			String date = sm.format(d);
			a.setParseDate(date);
			
			String uid = a.getCreate_user() ;
			a.setCreate_username(userService.get(Integer.parseInt(uid)).getUsername());
				
		}
		String json = JSON.toJSONString(achats) ;
		try {
			System.out.println(json);
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delete")
	public void delete(String ids,HttpServletResponse response) throws IOException{
		String[] str_ids = ids.split(",") ;
		for(String id : str_ids){
			achatService.delete(Integer.parseInt(id)) ;
			response.getWriter().print("true") ;
		}
	}
	
}

package kr.or.ddit.controller;

import kr.or.ddit.vo.ProductVO;

public class ProductController {
	public static void main(String[] args) {
		ProductVO productVO = new ProductVO();
		
		productVO.setProductId("P1234");
		productVO.setPname("SamsungPhone");
		productVO.setDescription("삼성스마트폰");
		
		System.out.println(productVO);
	}
}

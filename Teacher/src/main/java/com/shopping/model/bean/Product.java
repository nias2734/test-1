package com.shopping.model.bean;

public class Product {
	private Integer pnum ;
	private String name ;
	private String company;
	
	// 1번 이미지는 대표 이미지로써 필수 입력 사항
	private String image01 ; 
	private String image02 ;
	private String image03 ;
	
	private Integer stock ;
	private Integer price ;
	private String category ;
	private String contents ;
	private Integer point ;	
	private String inputdate ; // 날짜 형식	
	
	public Integer getPnum() {
		return pnum;
	}
	public void setPnum(Integer pnum) {
		this.pnum = pnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}

	public String getImage01() {
		return image01;
	}
	public void setImage01(String image01) {
		this.image01 = image01;
	}
	public String getImage02() {
		return image02;
	}
	public void setImage02(String image02) {
		this.image02 = image02;
	}
	public String getImage03() {
		return image03;
	}
	public void setImage03(String image03) {
		this.image03 = image03;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "Product [pnum=" + pnum + ", name=" + name + ", company=" + company + ", image01=" + image01
				+ ", image02=" + image02 + ", image03=" + image03 + ", stock=" + stock + ", price=" + price
				+ ", category=" + category + ", contents=" + contents + ", point=" + point + ", inputdate=" + inputdate
				+ "]";
	}

	
	public Product(Integer pnum, String name, String company, String image01, String image02, String image03,
			Integer stock, Integer price, String category, String contents, Integer point, String inputdate) {
		super();
		this.pnum = pnum;
		this.name = name;
		this.company = company;
		this.image01 = image01;
		this.image02 = image02;
		this.image03 = image03;
		this.stock = stock;
		this.price = price;
		this.category = category;
		this.contents = contents;
		this.point = point;
		this.inputdate = inputdate;
	}
	public Product() {
		// TODO Auto-generated constructor stub
	}
}
package kr.or.ddit.vo;

// 자바빈 클래스(프로퍼티, 기본생성자, getter/setter 메소드)
public class ProductVO {
	private String productId;
	private String pname;
	private long unitPrice;
	private String description;
	private String manufacturer;
	private String category;
	private long unitsInStock;
	private String condition;
	private String filename;
	private int quantity;	// 장바구니에 담은 개수
	
	// 기본생성자
	public ProductVO() {}

	// 생성자(상품 아이디, 상품명, 상품 가격 초기화)
	public ProductVO(String productId, String pname, long unitPrice) {
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	// getter/setter 메소드
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public long getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(long unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", pname=" + pname + ", unitPrice=" + unitPrice + ", description="
				+ description + ", manufacturer=" + manufacturer + ", category=" + category + ", unitsInStock="
				+ unitsInStock + ", condition=" + condition + ", filename=" + filename + ", quantity=" + quantity + "]";
	}
	
}

function checkAddBook() {
	var regExpId = /^ISBN[0-9]{1,8}$/; // ISBN과 숫자를 조합하여 5~12자까지

	var bookId = document.addBookForm.bookId;
	var name = document.addBookForm.name;
	var unitPrice = document.addBookForm.unitPrice;
	var unitsInStock = document.addBookForm.unitsInStock;
	
	if (!check(regExpId, bookId,
		"[도서코드]\nISBN과 숫자를 조합하여 5~12자까지 입력하세요\n첫글자는 반드시 ISBN로 시작하세요")) {
		return;
	}
	
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[도서명]\n4~12자까지 입력하세요");
		name.select();
		return;
	}
	
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자를 입력하세요");
		unitPrice.select();
		return;
	}
	
	if (unitPrice.value < 0) {
		alert("[가격]\n음수는 입력 불가합니다");
		unitPrice.select();
		return;
	}
	
	if (isNaN(unitsInStock.value)) {
			alert("[재고 수]\n숫자를 입력하세요");
			unitsInStock.select();
			return;
	}

	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}	
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
}
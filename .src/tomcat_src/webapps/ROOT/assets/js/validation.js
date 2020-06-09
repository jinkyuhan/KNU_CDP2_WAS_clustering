function CheckAddProduct() {
    function check(regExp, e, msg) {
        if (regExp.test(e.value)) {
            return true;
        }
        alert(msg);
        e.select();
        e.focus();
        return false;
    }

    const productId = document.getElementById("productId");
    const name = document.getElementById("name");
    const unitPrice = document.getElementById("unitPrice");
    const unitsInStock = document.getElementById("unitsInStock");

    // checkProductId
    if (!check(/^P[0-9]{4,11}$/, productId, "[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요")){
        return false;
    }

    // checkProductName
    if (name.value.length < 4 || name.value.length > 12) {
        alert("[상품명]\n최소 4자서 최대 12자까지 입력하세요");
        name.select();에
        name .focus();
        return false;
    }

    // checkProductPrice
    if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
        alert("[가격]\n숫자만 입력하세요");
        unitPrice.select();
        unitPrice.focus();
        return false;
    }

    if (unitPrice.value < 0) {
        alert("[가격]\n음수는 입력 할 수 없습니다.");
        unitPrice.select();
        unitPrice.focus();
        return false;
    } else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[가격]\n소수점 둘째 자리까지만 입력하세요")){
        return false
    }

    // checkStock
    if(isNaN(unitsInStock.value)) {
        alert("[재고수]\n숫자만 입력하세요");
        unitsInStock.select();
        unitsInStock.focus();
        return false
    }

    document.newProduct.submit()
}
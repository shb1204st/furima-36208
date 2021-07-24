function price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const priceVal = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(priceVal * 0.1) ;
    const profitVal = document.getElementById("profit");
    profitVal.innerHTML = Math.floor(priceVal - priceVal * 0.1);
  });
};

window.addEventListener('load', price);
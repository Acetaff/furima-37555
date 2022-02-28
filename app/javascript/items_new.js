function item (){
  const priceForm = document.getElementById("item-price")
  const priceCommission = document.getElementById("add-tax-price")
  const priceProfit = document.getElementById("profit")
  
  priceForm.addEventListener('input',() => {
    const formValue = priceForm.value;
    const formValueMF = Math.floor(formValue * 0.1)
    priceCommission.innerHTML = formValueMF
    priceProfit.innerHTML = formValue - formValueMF
  });
};

window.addEventListener('load', item);
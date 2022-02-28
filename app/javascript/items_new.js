function item (){
  const priceForm = document.getElementById("item-price")
  
  priceForm.addEventListener('input',function(){
    console.log("インプットイベントを設定");
  });
};

window.addEventListener('load', item);
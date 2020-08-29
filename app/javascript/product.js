window.addEventListener("DOMContentLoaded", function(){
  document.getElementById("item-price").addEventListener("input", function(){
    var price  = document.getElementById("item-price").value;
    if (300 <= price && price <=9999999) {
      fee = Math.floor(price/10);
      profit = (price - fee);
      var feeArea    = document.getElementById("add-tax-price");
      var profitArea = document.getElementById("profit");
      feeArea.textContent = fee;
      profitArea.textContent = profit;
    }else {
      fee = 0;
      profit = 0;
    };
  });
});
    
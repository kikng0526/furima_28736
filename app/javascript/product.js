window.addEventListener("DOMContentLoaded", function(){
  document.getElementById("item-price").addEventListener("input", function(){
    var price  = document.getElementById("item-price").value;
      fee = Math.floor(price/10);
      profit = (price - fee);
      var feeArea    = document.getElementById("add-tax-price");
      var profitArea = document.getElementById("profit");
      feeArea.textContent = fee;
      profitArea.textContent = profit;
  });
});
    
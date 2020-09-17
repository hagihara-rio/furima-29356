
  function price(){
  // 画面読み込み時に発動
    const priceInput = document.getElementById("item-price"); //価格入力
    const add_tax = document.getElementById("add-tax-price"); //手数料
    const profit = document.getElementById("profit"); //利益
  //価格入力時の計算( javascript )
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value;
       if (value >= 300 && value <= 9999999){
        let fee = value * 0.1
        let gains = value - fee
        add_tax.textContent = fee;
        profit.textContent = gains;
     } else {
        let fee = '-';
        let gains = '-';
        add_tax.textContent = fee;
        profit.textContent = gains;
     }
   });
  }

window.addEventListener('load', price);
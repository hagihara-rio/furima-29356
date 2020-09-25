const pay = ()=> {
  Payjp.setPublicKey("pk_test_1d28b078296dbe768b34f9be");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const card = {
      //card-number: formData.get("card-number"),
      //card-exp-month: formData.get("card-exp-month"),
      //card-exp-year: `20${formData.get("card-exp-year")}`,
      //card-cvc: formData.get("card-cvc"),
      //postal-code: formData.get("postal-code"),
      //city: formData.get("city"),
      //addresses: formData.get("addresses"),
      //building: formData.get("building"),
      //phone-number: formData.get("phone-number"),      
    };

    Payjp.createToken(card, (status, response) => {
      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} type="hidden" name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      })
   })
}

window.addEventListener("load", pay);
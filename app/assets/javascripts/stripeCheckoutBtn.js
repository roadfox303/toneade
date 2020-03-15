$(function(){
  $(document).on('click', '.btn_buy', function (){
    var stripe = Stripe('pk_test_evVKpexjx8iSFmPBICDZBaJE00HujQY94v');
    let skuId = $(this).attr("id");
    console.log(skuId);
    stripe.redirectToCheckout({
      items: [{sku: skuId, quantity: 1}],
      successUrl: 'https://toneade.herokuapp.com/',
      cancelUrl: 'https://toneade.herokuapp.com/',
    })
    .then(function (result) {
      if (result.error) {
        var displayError = document.getElementById('error-message');
        displayError.textContent = result.error.message;
      }
    });
  });
});

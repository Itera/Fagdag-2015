$(function () {
  $(".add-product").bind("ajax:success", function() {
    $("#cart").load("/carts/show");
  });
});

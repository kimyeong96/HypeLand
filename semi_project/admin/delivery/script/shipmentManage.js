/**
 * 
 */
 
 $(".arrow1").on("click", function () {
       $(".sub-menu-first").toggle("4000ms");
     });

     $(".arrow2").on("click", function () {
       $(".sub-menu-second").toggle("4000ms");
     });

     $(".arrow3").on("click", function () {
       $(".sub-menu-third").toggle("4000ms");
     });
     $(".arrow4").on("click", function () {
       $(".sub-menu-forth").toggle("4000ms");
     });

     $(".shipmentModify").on("click",function() {
       location.href = "/배송관리/shipmentModify.html";
     })
     
     // 클릭버튼
     $("#searchIcon").on("click",function() {
       console.log("hello");
     })
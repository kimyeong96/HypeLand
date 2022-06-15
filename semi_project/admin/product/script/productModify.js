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

      $(".memberDelete").on("click", function (e) {
        alert("member");
      });
      $(function () {
        $(".memberModify").click(function () {
          $(".modal").fadeIn();
        });

        $("#cancelBtn").click(function () {
          $(".modal").fadeOut();
        });
      });
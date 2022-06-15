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
        $(".sub-menu-fourth").toggle("4000ms");
      });

      // 등록 클릭시 이동
      $(".boardRegister")
        .off()
        .on("click", function () {
          location.href = "/게시글관리/boardManageRegister.html";
        });

      // 삭제 클릭시
      $(".memberDelete")
        .off()
        .on("click", function () {
          $(".boardDeleteModal").fadeIn();

          $("#boardDeleteCancelBtn")
            .off()
            .on("click", function () {
              $(".boardDeleteModal").fadeOut();
            });
        });
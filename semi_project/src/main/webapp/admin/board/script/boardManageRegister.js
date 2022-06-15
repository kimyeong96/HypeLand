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

      // 삭제 아이콘 클릭
      $(".boardDelete")
        .off()
        .on("click", function () {
          $(".boardDeleteModal").fadeIn();

          $("#boardDeleteCancelBtn")
            .off()
            .on("click", function () {
              $(".boardDeleteModal").fadeOut();
            });
        });

      // 취소 버튼을 눌렀을 때
      $("#boardCancelBtn")
        .off()
        .on("click", function () {
          console.log("hello");
          location.href = "/게시글관리/boardManage.html";
        });

      // 수정 버튼을 눌렀을 때
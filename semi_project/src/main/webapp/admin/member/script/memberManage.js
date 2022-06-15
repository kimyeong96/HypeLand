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
        
      // firstModal
      $(function () {
        $(".memberModify").click(function () {
          $(".modal").fadeIn();
        });

        $("#cancelBtn").click(function () {
          $(".modal").fadeOut();
        });
      });


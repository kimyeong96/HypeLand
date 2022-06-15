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
      // select에서 선택된 해당 value를 이용해 페이지 이동
      $(document).ready(function () {
        $("#category-Selector").change(function () {
          let selectedVal = $(this).val();
          if (selectedVal == "top") {
            location.href = "";
          } else if (selectedVal == "bottom") {
            location.href = "";
          } else if (selectedVal == "hat") {
            location.href = "";
          } else if (selectedVal == "socks") {
            location.href = "";
          }
        });
      });

      // 상세 내용 보기 클릭시
      $(".reviewDetailIcon")
        .off()
        .on("click", function () {
          $(".reviewDetailModal").fadeIn();

          $(".reviewDetailModalExitIcon")
            .off()
            .on("click", function () {
              $(".reviewDetailModal").fadeOut();
            });
        });

      // 삭제 클릭시
      $(".reviewDelete")
        .off()
        .on("click", function () {
          $(".reviewDeleteModal").fadeIn();

          $("#reviewDeleteCancelBtn")
            .off()
            .on("click", function () {
              $(".reviewDeleteModal").fadeOut();
            });
        });
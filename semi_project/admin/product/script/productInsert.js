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
      let now = new Date(); // 현재 날짜 및 시간
      console.log("현재 : ", now);

      // product_price script
      function inputNumberFormat(e) {
        e.value = comma(uncomma(e.value));
      }

      function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
      }

      function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, "");
      }
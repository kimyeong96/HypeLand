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

      // 우편번호 api 주소 이용
      let btnPostCode = document.getElementById("btnPostCode");
      let detailAddr = document.getElementById("detailAddr");
      btnPostCode.onclick = executePostcode;

      function executePostcode() {
        new daum.Postcode({
          oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ""; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
              extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== "" && data.apartment === "Y") {
              extraRoadAddr +=
                extraRoadAddr !== ""
                  ? ", " + data.buildingName
                  : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== "") {
              extraRoadAddr = " (" + extraRoadAddr + ")";
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postCode").value = data.zonecode;
            document.getElementById("roadAddr").value = roadAddr;
            document.getElementById("jibunAddr").value = data.jibunAddress;

            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if (roadAddr !== "") {
              document.getElementById("extraAddr").value = extraRoadAddr;
            } else {
              document.getElementById("extraAddr").value = "";
            }
          },
        }).open();
        detailAddr.focus();
      }

      let submitBtn = document.getElementById("submitBtn");
      let email = document.getElementById("email");
      let phoneNumber1 = document.getElementById("phoneNumber1");
      let phoneNumber2 = document.getElementById("phoneNumber2");
      let postCode = document.getElementById("postCode");
      let roadAddr = document.getElementById("roadAddr");

      // submitBtn.addEventListener("click", function () {

      //     let regexId = /^[a-zA-Z0-9]{6,12}$/;
      //     let regexPw = /^[a-zA-Z0-9!@$?]{6,20}$/
      //     let regexEmail = /^[a-zA-Z][\w]+@[a-zA-Z]+\.(com|or\.kr|net|co\.kr)/;
      //     let regexPhoneNumber = /^[0-9]{4}$/;

      //     // input 창이 빈값일 때
      //    if (phoneNumber1.value == "") {
      //         alert("전화번호를 입력하세요");
      //     } else if (phoneNumber2.value == "") {
      //         alert("전화번호를 입력하세요");
      //     }

      //     if (!regexPhoneNumber.test(phoneNumber1.value)) {
      //         alert("옳바른 전화번호 형식으로 입력하세요")
      //         return;
      //     } else if (!regexPhoneNumber.test(phoneNumber2.value)) {
      //         alert("옳바른 전화번호 형식으로 입력하세요")
      //         return;
      //     }

      // })
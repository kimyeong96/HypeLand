// 다음 우편번호 api 띄우기
$('#btnPostCode').on('click', function () {
  new daum.Postcode({
    oncomplete: function (data) {
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 참고 항목 변수

      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다
      if (data.buildingName !== '' && data.apartment === 'Y') {
        extraRoadAddr +=
          extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName;
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if (extraRoadAddr !== '') {
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      $('#postCode').val(data.zonecode);
      $('#roadAddr').val(roadAddr);

      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
      if (roadAddr !== '') {
        $('#extraAddr').val(extraRoadAddr);
      } else {
        $('#extraAddr').val('');
      }
    }
  }).open();
});

/* 약관부분 */
const form = document.querySelector('#form__wrap');
const checkAll = document.querySelector('.terms__check__all input');
const checkBoxes = document.querySelectorAll('.input__check input');
const submitButton = document.querySelector('button');

const agreements = {
  termsOfService: false,
  privacyPolicy: false,
  allowPromotions: false
};

form.addEventListener('submit', e => e.preventDefault());

checkBoxes.forEach(item => item.addEventListener('input', toggleCheckbox));

function toggleCheckbox(e) {
  const { checked, id } = e.target;
  agreements[id] = checked;
  this.parentNode.classList.toggle('active');
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { termsOfService, privacyPolicy, allowPromotions } = agreements;
  if (termsOfService && privacyPolicy && allowPromotions) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { termsOfService, privacyPolicy } = agreements;
  if (termsOfService && privacyPolicy) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

checkAll.addEventListener('click', e => {
  const { checked } = e.target;
  if (checked) {
    checkBoxes.forEach(item => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add('active');
    });
  } else {
    checkBoxes.forEach(item => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove('active');
    });
  }
  toggleSubmitButton();
});

const total = document.getElementById('total');
const total2 = document.getElementById('total2');

$('#checkId').on('click', function () {
  if ($('#user_id').val() === '') {
    alert('아이디를 입력해주세요.');
    return;
  }
  let regexId = /^[a-zA-Z0-9_]{6,}$/;

  if (!regexId.test($('#user_id').val())) {
    alert('형식에 맞지 않는 아이디입니다.');
    document.getElementById('user_id').value = '';
    return;
  }

  $.ajax({
    url: '/checkId.mem',
    type: 'post',
    data: { user_id: $('#user_id').val() },
    dataType: 'text',
    success: function (data) {
      console.log(data);
      if (data == 'false') {
        alert('이미 사용중인 아이디입니다.');
        return;
      }
      alert('사용가능한 아이디입니다.');
      total.value = '1';
      if (total.value == '1' && total2.value == '1') {
        $('#submitBtn').attr('disabled', false);
      }
      return;
    },
    error: function (e) {
      console.log(e);
    }
  });
});

function emailOptionBox(e) {
  $('#emailAdress2').attr('disabled', true);
  const value = e.value;
  let email = '';

  console.log(value);

  if (value == 99) {
    $('#emailAdress2').attr('disabled', false);
  } else {
    email = $('#emailAdress').val() + '@' + e.options[e.selectedIndex].text;
    $('#user_email').val(email);
  }
  e.addEventListener('change', function () {
    if (document.getElementById('emailAdress').value !== '') {
      if (total2.value == '1') {
        $('#submitBtn').attr('disabled', true);
        total2.value = '';
        return;
      }
    }
  });
}

function emailInputBox(e) {
  const value = e.value;
  let email = '';

  console.log(value);

  email =
    $('#emailAdress').val() + '@' + $('#selectEmail option:selected').text();
  $('#user_email').val(email);

  e.addEventListener('change', function () {
    if (document.getElementById('emailAdress').value !== '') {
      if (total2.value == '1') {
        $('#submitBtn').attr('disabled', true);
        total2.value = '';
        return;
      }
    }
  });
}

$('#emailAdress2').focusout(function () {
  let email = '';
  if ($('#emailAdress').val() !== '') {
    email = $('#emailAdress').val() + '@' + $('#emailAdress2').val();
    $('#user_email').val(email);
  }
});

$('#checkEmail').on('click', function () {
  if ($('#emailAdress').val() === '') {
    alert('이메일을 입력해주세요.');
    return;
  } else if (
    $('#selectEmail option:selected').val() == 99 &&
    $('#emailAdress2').val() === ''
  ) {
    alert('도메인을 입력해주세요.');
    return;
  } else if ($('#selectEmail option:selected').val() == 1) {
    alert('도메인을 선택해주세요.');
    return;
  }

  $.ajax({
    url: '/checkEmail.mem',
    type: 'post',
    data: { user_email: $('#user_email').val() },
    dataType: 'text',
    success: function (data) {
      console.log(data);
      if (data == 'false') {
        alert('이미 사용중인 이메일입니다.');
        return;
      }
      alert('사용가능한 이메일입니다.');
      total2.value = '1';
      if (total.value == '1' && total2.value == '1') {
        $('#submitBtn').attr('disabled', false);
      }
      return;
    },
    error: function (e) {
      console.log(e);
    }
  });
});

$('#user_id').change(function () {
  if (document.getElementById('user_id').value !== '') {
    if (total.value == '1') {
      $('#submitBtn').attr('disabled', true);
      total.value = '';
      return;
    }
  }
});

$('#emailAdress').change(function () {
  if (document.getElementById('emailAdress').value !== '') {
    if (total2.value == '1') {
      $('#submitBtn').attr('disabled', true);
      total2.value = '';
      return;
    }
  }
});

$('#emailAdress2').change(function () {
  if (document.getElementById('emailAdress2').value !== '') {
    if (total2.value == '1') {
      $('#submitBtn').attr('disabled', true);
      total2.value = '';
      return;
    }
  }
});

$('#submitBtn').on('click', function () {
  const termsOfService = document.getElementById('termsOfService');
  const privacyPolicy = document.getElementById('privacyPolicy');
  let regexId = /^[a-zA-Z0-9_]{6,}$/;
  let regexPw = /^[a-z0-9~!@#$%^&]{5,19}$/;
  let regexPhone = /^[0-9]{11}$/;
  let regexDate = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))$/;
  //phone번호 합쳐주는 작업 select 박스에서 선택된 값을 가져오는방법
  let phone =
    $('#phone1 option:selected').val() +
    $('#phone2').val() +
    $('#phone3').val();

  $('#user_phone').val(phone);

  if ($('#user_id').val() === '') {
    alert('아이디를 입력해 주세요');
    return;
  } else if ($('#user_name').val() === '') {
    alert('이름을 입력해주세요.');
    return;
  } else if ($('#user_date').val() === '') {
    alert('생년월일을 입력해주세요.');
    return;
  } else if ($('#emailAdress').val() === '') {
    alert('이메일을 입력해주세요.');
    return;
  } else if ($('#selectEmail option:selected').val() == 1) {
    alert('도메인을 선택해주세요.');
    return;
  } else if (
    $('#selectEmail option:selected').val() == 99 &&
    $('#emailAdress2').val() === ''
  ) {
    alert('도메인을 입력해주세요.');
    return;
  } else if (!regexId.test($('#user_id').val())) {
    alert('형식에 맞지 않는 아이디입니다.');
    return;
  } else if (!regexPw.test($('#user_password').val())) {
    alert('형식에 맞지 않는 비밀번호입니다.');
    return;
  } else if ($('#memberChkpw').val() !== $('#user_password').val()) {
    alert('비밀번호와 비밀번호 확인창이 일치하지 않습니다.');
    return;
  } else if (!regexPhone.test(phone)) {
    // 숫자 데이터에 대한 별도의 형변환 x
    alert('형식에 맞지 않는 전화번호입니다.');
    return;
  } else if (!regexDate.test($('#user_date').val())) {
    alert('생년월일 형식에 맞지 않습니다.');
    return;
  } else if ($('#user_id').val() == $('#user_password').val()) {
    alert('아이디와 다른 비밀번호를 입력해주세요.');
    return;
  } else if (!termsOfService.checked && !privacyPolicy.checked) {
    alert('필수 약관에 동의하셔야 가입이 가능합니다.');
    return;
  } else if ($('#postCode').val() === '' || $('#roadAddr').val() === '') {
    alert('주소를 입력해 주세요.');
    return;
  }
  const check = confirm('입력하신 정보로 회원가입하시겠습니까?');
  if (check) {
    //form 제출
    document.getElementById('signupForm').submit();
  }
});

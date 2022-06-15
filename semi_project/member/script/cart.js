window.onload = function () {
  $('.qty-update-btn').on('click', function () {
    const parent = $(this).closest('td');
    const parent2 = $(this).closest('tr');
    const qtyEl = $('.quantity', parent);
    const seq_cart = $('.item-delete', parent2);
    const calc = $(this).data('type') === 'minus' ? -1 : 1;
    const currentQty = parseInt(qtyEl.val()) || 0;

    qtyEl.val(currentQty + calc);

    if (Number(qtyEl.val()) === 0) {
      qtyEl.val(1);
      alert('1개 미만으로 수정은 불가능합니다.');
      return;
    } else if (Number(qtyEl.val()) === 100) {
      qtyEl.val(99);
      alert('최대 수량은 99개입니다.');
      return;
    }
    alert('수량이 변경되었습니다.');
    location.href =
      '/toChangeQty.mem?cart_quantity=' +
      qtyEl.val() +
      '&seq_cart=' +
      seq_cart.val();
  });

  $('.quantity').change(function () {
    const parent2 = $(this).closest('tr');
    const seq_cart = $('.item-delete', parent2);

    if (Number($(this).val()) < 1 || null || '') {
      $(this).val(1);
      alert('1개 미만으로 수정은 불가능합니다.');
      return;
    } else if (Number($(this).val()) === 100) {
      $(this).val(99);
      alert('100개 이상으로 수정은 불가능합니다.');
      return;
    }
    alert('수량이 변경되었습니다.');
    location.href =
      '/toChangeQty.mem?cart_quantity=' +
      $(this).val() +
      '&seq_cart=' +
      seq_cart.val();
  });

  const qty = document.getElementsByClassName('quantity');
  const price = document.getElementsByClassName('cart_price');
  const price2 = document.getElementsByClassName('price');
  const total_price = document.getElementsByClassName('cart_total');
  const total = document.getElementsByClassName('total');
  const arr1 = new Array(price.length);
  const arr2 = new Array(price.length);

  for (let i = 0; i < price.length; i++) {
    arr1[i] = price[i].value.toLocaleString('ko-KR');
    price2[i].innerHTML += arr1[i];
  }

  for (let i = 0; i < total_price.length; i++) {
    arr2[i] = Number(price[i].value) * Number(qty[i].value);
    arr2[i].toLocaleString('ko-KR');
    total.innerHTML += arr2[i];
  }

  $('.item-delete').on('click', function () {
    const check = confirm('상품을 삭제 하시겠습니까?');
    if (check) {
      alert('장바구니에서 삭제되었습니다.');
      location.href = '/toDeleteCart.mem?seq_cart=' + $(this).val();
    }
  });

  document.getElementById('checkAll').addEventListener('click', function () {
    const checkboxes = document.getElementsByName('seq_cart');
    checkboxes.forEach(checkbox => {
      checkbox.checked = document.getElementById('checkAll').checked;
    });
  });

  $('.check').on('click', function () {
    const total = $('.check').length;
    const checked = $('.check:checked').length;

    if (total != checked) {
      $('#checkAll').prop('checked', false);
    } else {
      $('#checkAll').prop('checked', true);
    }
  });

  $('.btnOrder').on('click', function () {
    const checkboxes = document.getElementsByName('seq_cart');
    const checked = $('.check:checked').length;
    checkboxes.forEach(checkbox => {
      if (checkbox.checked) {
        document.getElementById('signupForm').submit();
        return;
      }
      // console.log(checkbox.value);
      // form 제출
    });
    if (checked === 0) {
      alert('장바구니에서 물건을 선택해주세요.');
    }
  });

  $('#btnDelAll').on('click', function () {
    const check = confirm('모든 상품을 삭제하시겠습니까?');
    if (check) {
      alert('모든 상품이 삭제되었습니다.');
      location.href = '/toDelAllCart.mem';
    }
  });

  $('#btnDelSel').on('click', function () {
    const check = confirm('선택한 상품을 삭제하시겠습니까?');
    if (check) {
      alert('선택한 상품이 삭제되었습니다.');
      $('#signupForm').attr('action', '/toDelBySeqCart.mem');
      document.getElementById('signupForm').submit();
    }
  });
};

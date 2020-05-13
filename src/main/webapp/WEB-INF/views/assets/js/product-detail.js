$(function() {
    function setTotalPrice() {
        let total = 0;
        const option = $('.product-option-tmpl');

        $.each(option, function(i, v) {
            const k = parseInt($(v).attr('data-total-price'));
            total += k;
        });

        $(".total-price").attr('data-value', total).html(total.toLocaleString());
    }

    function makeOrderInfo() {
        const optionInfo = [];
        let total = 0;
        const option = $('.product-option-tmpl');

        $.each(option, function(i, v) {
            const current = $(v);
            const k = parseInt(current.attr('data-total-price'));
            total += k;

            data = {
                'name': current.data('option-name'),
                'price': parseInt(current.data('price')),
                'qty': parseInt(current.find('input').val()),
                'total': k
            }

            optionInfo.push(data)
        });

        const order = {
            product_id: $(".product-detail").data('pid'),
            options: JSON.stringify(optionInfo),
            order_price: total
        }

        console.log(order);
        return order;
    }

    $("a[data-toggle='tab']").click(function(e) {
        e.preventDefault();
    });

    $('.product-option').change(function(e) {
        e.preventDefault();
        const productOption = $('.product-option');
        const current = $(this);
        const current_index = current.data('index');
        const size = productOption.length;;

        // 선택된 항목보다 이후 옵션들은 초기화
        let find = false;
        $.grep(productOption, (value, idx) => {
            const item = $(value);

            if (item.data('index') < current_index && item.find('option:selected').index() < 1) {
                swal('알림', '이전 옵션 항목들을 먼저 선택해 주세요.');
                current.prop('selectedIndex', 0);
                find = true;
                return true;
            }
        });

        // 이전옵션 항목 중에서 선택되지 않은 것이 있다면 처리 중단.
        if (find) {
            return false;
        }

        // 선택된 항목보다 이후 옵션들은 초기화
        $.each(productOption, (idx, value) => {
            const item = $(value);
            if (item.data('index') > current_index) {
                item.find('option:eq(0)').prop('selected', true);
            }
        });

        // 선택된 옵션 항목들을 종합한다.
        if (current_index + 1 == size) {
            let optionNameValue = '';
            const priceValue = $("#real-price").data('value');

            $.each(productOption, (idx, value) => {
                optionNameValue += $(value).find('option:selected').text();

                if (idx + 1 < size) {
                    optionNameValue += ", "
                }
            });

            const data = { option_name: optionNameValue, price: priceValue, price_value: priceValue.toLocaleString() };
            console.log(data);

            var html = $("#option-item-template").html();
            var tmpl = Handlebars.compile(html);
            var result = tmpl(data);

            $("#product-option-choice").append(result);
            $("#product-option-choice").show();

            setTotalPrice();

        }
    });

    $(document).on('click', '.qty-up, .qty-down', function(e) {
        e.preventDefault();

        const current = $(this);
        const container = current.parents('.product-option-tmpl');
        const input = container.find('input');

        const value = parseInt(current.data('value'));
        const realPrice = parseInt($("#real-price").data('value'));
        let qty = input.val() ? parseInt(input.val()) : 1;

        if (value == -1 && qty == 1) {
            swal('확인', '최소 하나 이상은 선택하셔야 합니다.');
            return false;
        }

        qty += value;
        input.val(qty);

        const totalPrice = realPrice * qty;
        container.find('.product-price').html(totalPrice.toLocaleString() + "원");
        container.attr('data-total-price', totalPrice);

        setTotalPrice();
    });

    $(document).on('click', '.btn-option-remove', function(e) {
        e.preventDefault();
        const current = $(this);
        const parents = current.parents('.product-option-tmpl');
        parents.remove();

        if ($("#product-option-choice .product-option-tmpl").length < 1) {
            $("#product-option-choice").hide();
        }

        setTotalPrice();
    });

    $("#btn-fav").click(function(e) {
        e.preventDefault();
        swal('알림', '이 버전에서는 찜하기 기능을 지원하지 않습니다.');
    });

    $("#btn-order").click(function(e) {
        e.preventDefault();
        const orderInfo = makeOrderInfo();

        if (orderInfo.options.length < 1) {
            swal('알림', '최소 하나 이상의 옵션이 선택되어야 합니다.')
            return false;
        }

        // 직접주문인 경우 direct 파라미터를 'Y'로 설정
        orderInfo.direct = 'Y';

        const url = ROOT_URL + '/rest/shopping/cart';
        console.log(url);

        $.post(url, orderInfo, function(json) {
            console.log("장바구니ID: ", json.cart_id);

            // 기존에 생성된 주문 포함이 있다면 제거
            const frm = $("#order-form");
            if (frm !== undefined) {
                frm.remove();
            }

            const form = $("<form>");
            form.attr({
                'id': 'order-form',
                'method': 'POST',
                'action': ROOT_URL + '/shopping/order'
            });

            const input = $("<input>");
            input.attr({
                type: 'hidden',
                name: 'cart_id[]',
                value: json.cart_id
            })

            form.append(input);

            const body = $("body");
            body.append(form);
            body.find("#order-form").submit();
        });
    });

    $("#btn-cart").click(function(e) {
        e.preventDefault();
        const orderInfo = makeOrderInfo();

        if (orderInfo.options.length < 1) {
            swal('알림', '최소 하나 이상의 옵션이 선택되어야 합니다.')
            return false;
        }

        // 장바구니인 경우 direct 파라미터를 'N'으로 설정
        orderInfo.direct = 'N';

        const url = ROOT_URL + '/rest/shopping/cart';
        console.log(url);
        $.post(url, orderInfo, function(json) {
            console.log("장바구니ID: ", json.cart_id);

            swal({
                title: '확인',
                text: '장바구니에 담겼습니다. 지금 확인하시겠습니까?',
                type: "question",
                showCancelButton: true
            }).then(function(result) {
                if (result.value) {
                    window.location = ROOT_URL + '/shopping/cart';
                }
            });
        });
    });
});

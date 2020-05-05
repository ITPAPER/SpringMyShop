$(function() {
    /** 유효성 검사 플러그인이 ajaxForm보다 먼저 명시되어야 한다. */
    $('#login-form').validate({
        rules: {
            user_id: 'required',
            user_pw: 'required'
        },
        messages: {
            user_id: '아이디를 입력하세요.',
            user_pw: '비밀번호를 입력하세요.'
        },
    });

    $('#login-form').ajaxForm({
        // submit 전에 호출된다.
        beforeSubmit: function(arr, form, options) {
            // validation 플러그인을 수동으로 호출하여 결과를 리턴한다.
            // 검사규칙에 위배되어 false가 리턴될 경우 submit을 중단한다.
            return $(form).valid();
        },
        success: function(json) {
            window.location = ROOT_URL;
        },
    }); // end ajaxForm
});

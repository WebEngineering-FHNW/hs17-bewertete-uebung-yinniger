var flashMessageTimeout = 5000;

$(document).ready(function () {

    // disable inputs for show-only fields
    $('.show-only>#save-btn').prop('disabled', true);
    $('.show-only .entry-value').each(function () {
        $(this).prop('readonly', true);
    });
    $('.show-only .option-select').each(function () {
        $(this).prop('disabled', true);
    });

    $('#edit-btn').click(function () {
        $('#save-btn').prop('disabled', false);
        $('.entry-value').each(function () {
            $(this).prop('readonly', false);
        });
        $('.option-select').each(function () {
            $(this).prop('disabled', false);
        });
    });

    $('#save-btn').click(function () {
        $.ajax({
            url: '/mistake/save',
            type: 'post',
            data: $('#entry-form').serialize(),
            success: function () {
                showSuccessMessage();
            },
            error: function (message) {
                var errorJson = $.parseJSON(message.responseText);
                createErrorMessage(errorJson);
            }
        })
    });
});

function createErrorMessage(errorJson) {
    var message = errorJson.errors[0].field;
    for(var i = 0; i < errorJson.errors.length; i++) {
        $("input[name*='" + errorJson.errors[i].field + "']").css('border-color', 'red')
        if(i !== 0) {
            message += ' and ' + errorJson.errors[i].field;
        }
    }
    message += ' cannot be empty';
    $('#fail-message-anchor').text(message);
    $('#fail-message').show();
    setTimeout(function () {
        $('#fail-message').hide();
    }, flashMessageTimeout);
}

function showSuccessMessage() {
    $('#success-message').show();
    setTimeout(function () {
        $('#success-message').hide();
    }, flashMessageTimeout);
}

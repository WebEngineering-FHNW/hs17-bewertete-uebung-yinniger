var flashMessageTimeout = 5000;

$(document).ready(function () {
    var showOnly = $('.show-only');
    var fields = $('.field');

    // disable inputs for show-only fields
    if (showOnly.length !== 0) {
        fields.each(function () {
            switchField(this, true);
        });
    }

    fields.on('keyup', function () {
        var input = findInput(this);
        if (input.val() === "") {
            console.log('test')
            setFieldError(this);
            $('#save-btn').prop('disabled', true);
        } else {
            setFieldTyping(this);
            $('#save-btn').prop('disabled', false);
        }
    });

    fields.focusout(function () {
        removeTyping(this)
    });

    fields.focusin(function () {
        setFieldTyping(this);
    });

    $('#edit-ico').click(function () {
        if($(this).text() === 'mode_edit') {
            fields.each(function () {
               switchField(this, false);
            });
            $(this).text('save');
        } else {
            $.ajax({
                url: '/' + $('#type').val() + '/save',
                type: 'post',
                data: $('#entry-form').serialize(),
                success: function () {
                    showSuccessMessage();
                },
                error: function (message) {
                    var errorJson = $.parseJSON(message.responseText);
                    createErrorMessage(errorJson);
                }
            });
        }
    });

});

$(window).load(function () {
   resizeTextField();
   postionFloatingButton();
});

$(window).resize(function () {
    resizeTextField();
    postionFloatingButton();
});

function createErrorMessage(errorJson) {
    var message = errorJson.errors[0].field;
    for (var i = 0; i < errorJson.errors.length; i++) {
        if (i !== 0) {
            message += ' and ' + errorJson.errors[i].field;
        }
        var errorField = $('[name=' + errorJson.errors[i].field + ']').closest('.field');
        setFieldError(errorField);
    }

    message += ' cannot be empty';
    $('#fail-message-anchor').text(message);
    $('#fail-message').show('slow');
    setTimeout(function () {
        $('#fail-message').hide('slow');
    }, flashMessageTimeout);
}

function showSuccessMessage() {
    $('#fail-message').hide();
    $('#success-message').show('slow');
    $('.input-error').removeClass('input-error');
    $('.header-text').text($("input[name='name']").val());
    setTimeout(function () {
        $('#success-message').hide('slow');
    }, flashMessageTimeout);
}

function resizeTextField() {
    if($(window).width() <= 991) {
        $('.snippet-field').width(190);
    } else if($('input').width() === 200) {
        $('.snippet-field').width($('.field-input').width() + 188);
    } else {
        $('.snippet-field').width($('.field-input').width() * 1.42);
    }
}

function findInput(field) {
    var possibleInputs = ['input', 'textarea', 'select'];
    var input = $(field).find(possibleInputs[0]).first();
    for (var i = 1; i !== possibleInputs.length && input.length === 0; ++i) {
        input = $(field).find(possibleInputs[i]).first();
    }
    return input;
}

function setFieldTyping(field) {
    var input = findInput(field);
    var label = $(field).find('label').first();

    if (input.hasClass('input-error')) {
        input.removeClass('input-error');
        label.removeClass('input-error');
    }
    if(!input.is('[readonly]')) {
        input.addClass('typing');
        label.addClass('typing');
    }
}

function setFieldError(field) {
    var input = findInput(field);
    var label = $(field).find('label').first();

    if (input.hasClass('typing')) {
        input.removeClass('typing');
        label.removeClass('typing');
    }
    input.addClass('input-error');
    label.addClass('input-error');
    input.attr('placeholder', 'Value missing');
}

function removeTyping(field) {
    var input = findInput(field);
    input.removeClass('typing');
    $(field).find('label').first().removeClass('typing');
}

function switchField(field, disable) {
    var input = findInput(field);
    if(input.get(0).localName === 'select') {
        input.prop('disabled', disable);
    } else {
        input.prop('readonly', disable);
    }
    if(disable) {
        $(field).find('label').first().addClass('disabled');
    } else {
        $(field).find('label').first().removeClass('disabled');
    }
}

function postionFloatingButton() {
    var inputWidth = $('input').width();
    $('#circle').css('margin-left', inputWidth - 35);
}

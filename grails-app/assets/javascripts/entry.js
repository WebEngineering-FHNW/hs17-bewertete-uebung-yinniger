var flashMessageTimeout = 5000;

$(document).ready(function () {
    var showOnly = $('.show-only');
    var saveButton = $('#save-btn');
    var fields = $('.field');

    // disable inputs for show-only fields
    if(showOnly.length !== 0) {
        var inputs = showOnly.find('input');
        var selects = showOnly.find('select');
        var labels = showOnly.find('label');

        $('.show-only #save-btn').hide();
        inputs.each(function () {
            $(this).prop('readonly', true);
        });
        selects.each(function () {
            $(this).prop('disabled', true);
        });
        labels.each(function () {
            $(this).addClass('disabled');
        });

        $('#edit-btn').click(function () {
            $('#save-btn').prop('disabled', false);
            inputs.each(function () {
                $(this).prop('readonly', false);
            });
            selects.each(function () {
                $(this).prop('disabled', false);
            });
            labels.each(function () {
                $(this).removeClass('disabled');
            });
            saveButton.show();
            $(this).hide();
        });
    }

    saveButton.click(function () {
        $.ajax({
            url: '/' + $('#type').val() +'/save',
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

    fields.on('keyup', function () {
        var input = $(this).find('input').first();
        var label= $(this).find('label').first();
        if(input.val() === "") {
            input.removeClass('typing');
            label.removeClass('typing');
            input.addClass('input-error');
            label.addClass('input-error');
            input.attr('placeholder', 'Value missing');
            $('#save-btn').prop('disabled', true);
        } else {
            if(input.hasClass('input-error')) {
                input.removeClass('input-error');
                label.removeClass('input-error');
            }
            $('#save-btn').prop('disabled', false);
        }
    });

    fields.focusout(function () {
        $(this).find('input').first().removeClass('typing');
        $(this).find('label').first().removeClass('typing');
    });

    fields.focusin(function () {
        var input = $(this).find('input').first();
        if(!input.hasClass('input-error') && !input.is('[readonly]')) {
            input.addClass('typing');
            $(this).find('label').first().addClass('typing');
        }
    })

});

function createErrorMessage(errorJson) {
    var message = errorJson.errors[0].field;
    for(var i = 0; i < errorJson.errors.length; i++) {
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
    $('#fail-message').hide();
    $('#success-message').show();
    $('.input-error').removeClass('input-error');
    $('.header-text').text($("input[name='name']").val());
    setTimeout(function () {
        $('#success-message').hide();
    }, flashMessageTimeout);
}

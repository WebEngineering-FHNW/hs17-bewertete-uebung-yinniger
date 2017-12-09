$(document).ready(function () {

    // disable inputs for show-only fields
    $('#save-btn.show-only').prop('disabled', true);
    $('.show-only.entry-value').each(function () {
        $(this).prop('readonly', true);
    });
    $('.show-only.option-select').each(function () {
        $(this).prop('disabled', true);
    });

    $('#edit-btn').click(function () {
        $('.edit-view#save-btn').prop('disabled', false);
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
                console.log("success")
            },
            error: function (message) {
                console.log(message)
            }
        })
    });
});

$(document).ready(function () {
    $('#edit-ico').click(function () {
        var icon = $(this);
        if(icon.text() === 'add') {
            icon.text('close')
        } else {
            icon.text('add')
        }
        $('#circle-menu').toggle('fast');
    });
});
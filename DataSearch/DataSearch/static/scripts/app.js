// function fromEditToDetail() {
//     var path = window.location.pathname.replace('edit', 'detail');
//     window.location.href = path;
// }

function rowClick(id) {
    $("tr").removeClass('active');
    $("#" + id).addClass('active');
    $("button.modSelectedButton").removeAttr('disabled');
    $("button.modSelectedButton").attr('id', id);
}

window.addEventListener('message', function(event) {
    let data = event.data
    if (data.type == 'open') {
        $('body').css("opacity", "1");
    } else if (data.type == 'close') {
        $('body').css("opacity", "0");
    }
})

$(document).on('keydown', function() {
    switch (event.keyCode) {
        case 27:
            $.post('https://igor_pvp/Fechar');
            $('body').css("opacity", "0");
            break;
    }
});

$('#igorcard1').click(function(e) {
    $.post('https://igor_pvp/Pistola');
})

$('#igorcard2').click(function(e) {
    $.post('https://igor_pvp/Fuzil');
})
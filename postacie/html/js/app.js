$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.action == "donator"){
            $('#niedonator').hide();
            $('#donator').show();
		}
    }, false);
});


$(".character-box").hover(
    function() {
        $(this).css({
			      "color": "#fffb00",
            "transition": "200ms",
            "opacity": "0.9",
        });
    }, function() {
        $(this).css({
            "background": "rgba(0,0,0,0.7);",
            "color": "#fff",
                  "transition": "200ms",
                  "opacity": "1.0"
        });
    }
);

$(".character-box").click(function () {
    $(".character-box").removeClass('active-char');
    $(this).addClass('active-char');
    $(".character-buttons").css({"display":"block"});
    if ($(this).attr("data-ischar") === "true") {
        $("#delete").css({"display":"block"});
    } else {
        $("#delete").css({"display":"none"});
    }
    $.post("http://postacie/CharacterChosen", JSON.stringify({
        charid: $('.active-char').attr("data-charid"),
        ischar: $('.active-char').attr("data-ischar"),
    }));
    PostacieRoute68.CloseUI();
});

$(".character-boxnie").click(function () {
    $.post("http://postacie/niedonator", JSON.stringify({
    }));
});

$("#play-char").click(function () {
    $.post("http://postacie/CharacterChosen", JSON.stringify({
        charid: $('.active-char').attr("data-charid"),
        ischar: $('.active-char').attr("data-ischar"),
    }));
    PostacieRoute68.CloseUI();
});

$("#deletechar").click(function () {
    $.post("http://postacie/DeleteCharacter", JSON.stringify({
        charid: $('.active-char').attr("data-charid"),
    }));
    PostacieRoute68.CloseUI();
});

(() => {
    PostacieRoute68 = {};

    PostacieRoute68.ShowUI = function(data) {
        $('.main-container').css({"display":"block"});
        if(data.characters !== null) {
            $.each(data.characters, function (index, char) {
                if (char.charid !== 0) {
                    var charid = char.identifier.charAt(4);
                    if (char.job == 'offambulance' || char.job == 'ambulance') {
                        char.job = 'EMS'
                    } else if (char.job == 'offpolice' || char.job == 'police') {
                        char.job = 'Los Santos Police'
                    } else if (char.job == 'offmechanic' || char.job == 'mechanic') {
                        char.job = 'LSCM'
                    } else if (char.job == 'garbage') {
                        char.job = 'Zbieracz Odpadów'
                    } else if (char.job == 'taxi' || char.job == 'offtaxi') {
                        char.job = 'TAXI'
                    } else if (char.job == 'silownia') {
                        char.job = 'Cobra Gym'
                    } else if (char.job == 'trucker') {
                        char.job = 'Kierowca Cieżarówki'
                    } else if (char.job == 'unemployed') {
                        char.job = 'Bezrobotny'
                    } else if (char.job == 'Bezrobotny') {
                        char.job = 'Burgershot'
                    } else if (char.job == 'angels') {
                        char.job = 'The Dubrov Family'
                    } else if (char.job == '3lancers') {
                        char.job = 'Black List'
                    } else if (char.job == 'ballas') {
                        char.job = 'Grove Street Ballas'
                    } else if (char.job == 'cardealer') {
                        char.job = 'Salon PDM'
                    } else if (char.job == 'deliverer') {
                        char.job = 'Kurier PostOP'
                    } else if (char.job == 'piekarz') {
                        char.job = 'Piekarnia'
                    } else if (char.job == 'farming') {
                        char.job = 'Farmer'
                    } else if (char.job == 'gang') {
                        char.job = 'Santa Trinita'
                    } else if (char.job == 'groove') {
                        char.job = 'Grove Street Families'
                    } else if (char.job == 'govm') {
                        char.job = 'Rząd'
                    } else if (char.job == 'safj') {
                        char.job = 'SAFJ'
                    } else if (char.job == 'mafia') {
                        char.job = 'Mafia'
                    } else if (char.job == 'racer') {
                        char.job = 'Hoonigans'
                    } else if (char.job == 'reporter') {
                        char.job = 'Weazel News'
                    } else if (char.job == 'port') {
                        char.job = 'Port Mafia'
                    } else if (char.job == 'budowa') {
                        char.job = 'STD Contractors'
                    } else if (char.job == 'casino') {
                        char.job = 'Diamond Casino'
                    } else if (char.job == 'orgszwalnia') {
                        char.job = 'Gentlemans'
                    } else if (char.job == 'miner') {
                        char.job = 'Black Iron Inc'
                    } else if (char.job == 'realestateagent') {
                        char.job = 'Schlongberg Sachs'
                    } else if (char.job == 'alcool') {
                        char.job = 'Alcool Company'
                    }
                    $('[data-charid=' + charid + ']').html('<h3 class="character-fullname">'+ char.firstname +' '+ char.lastname +'</h3><div class="character-info"><p class="character-info-work">Zatrudnienie: <span>'+ char.job).attr("data-ischar", "true");
                }
            });
        }
    };

    PostacieRoute68.CloseUI = function() {
        $('.main-container').css({"display":"none"});
        $(".character-box").removeClass('active-char');
        $("#delete").css({"display":"none"});
		$(".character-box").html('<h3 class="character-fullname"><i class="fas fa-user-plus"></i></h3><div class="character-info"><p class="character-info-new">Stwórz Nową Postać</p></div>').attr("data-ischar", "false");
    };
    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch(event.data.action) {
                case 'openui':
                    PostacieRoute68.ShowUI(event.data);
                    break;
            }
        })
    }

})();

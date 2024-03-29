!function($){

    $(document).ready(function(){
        "use strict";
        var $btn = $('.btn-navbar'),
            $nav = null,
            $fixeditems = null;

        if (!$btn.length){
            return;
        }

        //mark that we have off-canvas menu
        $(document.documentElement).addClass('off-canvas-ready');

        $nav = $('<div class="noo-main-canvas" />').appendTo($('<div id="off-canvas-nav"></div>').appendTo(document.body));
        $($btn.data('target')).clone().appendTo($nav);

        $btn.click (function(e){
            if ($(this).data('off-canvas') == 'show') {

                hideNav();
            } else {

                showNav();
                $('.noo-main-canvas').append('<a class="exit-cavas" href="#">&nbsp;</a>');
                $('.exit-cavas').bind('click',function(){
                    hideNav();
                });
            }

            return false;
        });



        var posNav = function () {
                var t = $(window).scrollTop();
                if (t < $nav.position().top) $nav.css('top', t);
            },

            bdHideNav = function (e) {
                e.preventDefault();
                hideNav();
                return false;
            },

            showNav = function () {
                $('.btn-navbar').addClass('eff');
                $('html').addClass ('off-canvas');

                $nav.css('top', $(window).scrollTop());
                // wpfix(1);

                setTimeout (function(){
                    $btn.data('off-canvas', 'show');
                    $('html').addClass ('off-canvas-enabled');
                    $(window).bind('scroll touchmove', posNav);

                    // hide when click on off-canvas-nav
                    $('#off-canvas-nav').bind ('click', function (e) {

                        e.stopPropagation();
                    });

                    // $('#off-canvas-nav a').bind ('click', hideNav);
                    $('html').bind ('click', bdHideNav);
                }, 50);

                setTimeout (function(){
                    // wpfix(2);
                }, 1000);
            },

            hideNav = function () {
                $('.btn-navbar').removeClass('eff');
                $(window).unbind('scroll touchmove', posNav);
                $('#off-canvas-nav').unbind ('click');
                $('#off-canvas-nav a').unbind ('click', hideNav);
                $('html').unbind ('click', bdHideNav);

                $('html').removeClass ('off-canvas-enabled');
                $btn.data('off-canvas', 'hide');

                setTimeout (function(){
                    $('html').removeClass ('off-canvas');
                }, 600);
                $('.exit-cavas').remove();
            },
            wpfix = function (step) {
                // check if need fixed
                if ($fixeditems == -1){
                    return;// no need to fix
                }

                if (!$fixeditems) {
                    $fixeditems = $('body').children().filter(function(){ return $(this).css('position') === 'fixed' });
                    if (!$fixeditems.length) {
                        $fixeditems = -1;
                        return;
                    }
                }

                if (step==1) {
                    $fixeditems.css({'position': 'absolute', 'top': $(window).scrollTop() + 'px'});
                } else {
                    $fixeditems.css({'position': '', 'top': ''});
                }
            };

    })

}(jQuery);

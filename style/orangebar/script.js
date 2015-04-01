(function($) {

  $.fn.menumaker = function(options) {
      
      var SellerMenu = $(this), settings = $.extend({
        title: "Menu",
        format: "dropdown",
        breakpoint: 768,
        sticky: false
      }, options);

      return this.each(function() {
        SellerMenu.find('li ul').parent().addClass('has-sub');
        if (settings.format != 'select') {
          SellerMenu.prepend('<div id="menu-button">' + settings.title + '</div>');
          $(this).find("#menu-button").on('click', function(){
            $(this).toggleClass('menu-opened');
            var mainmenu = $(this).next('ul');
            if (mainmenu.hasClass('open')) { 
              mainmenu.hide().removeClass('open');
            }
            else {
              mainmenu.show().addClass('open');
              if (settings.format === "dropdown") {
                mainmenu.find('ul').show();
              }
            }
          });

          multiTg = function() {
            SellerMenu.find(".has-sub").prepend('<span class="submenu-button"></span>');
            SellerMenu.find('.submenu-button').on('click', function() {
              $(this).toggleClass('submenu-opened');
              if ($(this).siblings('ul').hasClass('open')) {
                $(this).siblings('ul').removeClass('open').hide();
              }
              else {
                $(this).siblings('ul').addClass('open').show();
              }
            });
          };

          if (settings.format === 'multitoggle') multiTg();
          else SellerMenu.addClass('dropdown');
        }

        else if (settings.format === 'select')
        {
          SellerMenu.append('<select style="width: 100%"/>').addClass('select-list');
          var selectList = SellerMenu.find('select');
          selectList.append('<option>' + settings.title + '</option>', {
                                                         "selected": "selected",
                                                         "value": ""});
          SellerMenu.find('a').each(function() {
            var element = $(this), indentation = "";
            for (i = 1; i < element.parents('ul').length; i++)
            {
              indentation += '-';
            }
            selectList.append('<option value="' + $(this).attr('href') + '">' + indentation + element.text() + '</option');
          });
          selectList.on('change', function() {
            window.location = $(this).find("option:selected").val();
          });
        }

        if (settings.sticky === true) SellerMenu.css('position', 'fixed');

        resizeFix = function() {
          if ($(window).width() > settings.breakpoint) {
            SellerMenu.find('ul').show();
            SellerMenu.removeClass('small-screen');
            if (settings.format === 'select') {
              SellerMenu.find('select').hide();
            }
            else {
              SellerMenu.find("#menu-button").removeClass("menu-opened");
            }
          }

          if ($(window).width() <= settings.breakpoint && !SellerMenu.hasClass("small-screen")) {
            SellerMenu.find('ul').hide().removeClass('open');
            SellerMenu.addClass('small-screen');
            if (settings.format === 'select') {
              SellerMenu.find('select').show();
            }
          }
        };
        resizeFix();
        return $(window).on('resize', resizeFix);

      });
  };
})(jQuery);

(function($){
$(document).ready(function(){

$(window).load(function() {
  $("#SellerMenu").menumaker({
    title: "Menu",
    format: "dropdown"
  });


$('#SellerMenu').prepend("<div id='menu-indicator'></div>");

var foundActive = false, activeElement, indicatorPosition, indicator = $('#SellerMenu #menu-indicator'), defaultPosition;

$("#SellerMenu > ul > li").each(function() {
  if ($(this).hasClass('active')) {
    activeElement = $(this);
    foundActive = true;
  }
});

if (foundActive === false) {
  activeElement = $("#SellerMenu > ul > li").first();
}

defaultPosition = indicatorPosition = activeElement.position().left + activeElement.width()/2 - 5;
console.log(activeElement);
console.log(activeElement.position().left);
console.log(activeElement.width());
indicator.css("left", indicatorPosition);

$("#SellerMenu > ul > li").hover(function() {
  activeElement = $(this);
  indicatorPosition = activeElement.position().left + activeElement.width()/2 - 5;
  indicator.css("left", indicatorPosition);
}, 
function() {
  indicator.css("left", defaultPosition);
});

});

});
})(jQuery);

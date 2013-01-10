#/*
# * 针对IE6菜单的弹出补丁
# * 因为IE6不支持除a以外的hover
# * */
$ ->
  if (jQuery.browser.msie && (jQuery.browser.version=="6.0") && !jQuery.support.style)
    $('ul.sf-menu>li')
      .hover(
        -> $(this).addClass('hover'),
        -> $(this).removeClass('hover')
      )

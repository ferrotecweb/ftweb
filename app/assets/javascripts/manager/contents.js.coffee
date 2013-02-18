# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# 内容标题选中
$ ->
  $("#content_title").focus()

# 全选或者取消全选
$("#content_all").click =>
  if $("#content_all").attr("checked")
    $(":checkbox").attr("checked", true)
  else
    $(":checkbox").removeAttr("checked")

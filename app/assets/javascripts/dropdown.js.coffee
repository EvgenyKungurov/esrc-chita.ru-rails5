$(document).on "turbolinks:load", ->
  el = $('#nav_list_first li a')
  $('#nav_list_first li:has("ul")').append '<div></div>'
  el.click ->
    checkElement = $(this).next()
    checkElement.stop().animate({ 'height': 'toggle' }, 500).parent().toggleClass 'active'
    if checkElement.is('ul')
      return false
    return
  return
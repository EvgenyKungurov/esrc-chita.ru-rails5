# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
posts = 1

@AddItem = ->
  form = document.getElementById('new_social_service')
  button = document.getElementById('add')
  label_title = '<label for="social_service_social_posts_attributes_' + posts + '_Заголовок" id="label_title_' + posts + '">Заголовок</label>'
  input_title = '<input type="text" name="social_service[social_posts_attributes][' + posts + '][title]" id="social_service_social_posts_attributes_' + posts + '_title">'
  label_text = '<label for="social_service_social_posts_attributes_' + posts + '_Текст" id="label_text_' + posts + '">Текст</label>'
  input_text = '<input type="text" name="social_service[social_posts_attributes][' + posts + '][text]" id="social_service_social_posts_attributes_' + posts + '_text">'
  new_form = label_title + input_title + label_text + input_text
  newnode = document.createElement('span')
  posts++
  newnode.innerHTML = new_form
  form.insertBefore newnode, button
  return

@RemoveItem = ->
  label_title = document.getElementById('label_title_' + (posts - 1))
  title_input = document.getElementById('social_service_social_posts_attributes_' + (posts - 1) + '_title')
  label_text = document.getElementById('label_text_' + (posts - 1))
  text_input = document.getElementById('social_service_social_posts_attributes_' + (posts - 1) + '_text')
  label_title.remove()
  title_input.remove()
  label_text.remove()
  text_input.remove()
  if posts > 1
    posts--
  return

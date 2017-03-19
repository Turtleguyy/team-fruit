$ ->
  $('.overlay .close').on 'click', ->
    $('body').removeClass 'watching'
    $('.modal').empty()

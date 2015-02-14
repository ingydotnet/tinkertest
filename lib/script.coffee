say = (text)->
  console.log text

$.ready = ->
  $('button.tinker').click ->
    pegex_input = $('.pegex').val()
    yaml_input = $('.yaml').val()
    tinker_url =
      '/tinker?yaml=' + escape yaml_input
    tinker_output = $.get tinker_url, (data)->
      $('pre.output').html _.escape data

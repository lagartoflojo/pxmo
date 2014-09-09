$ ->
  $('.new-team-input').tooltip()

  $('.new_team').on 'ajax:before', (evt) ->
    $form = $(evt.target)
    desc = $form.find('.new-team-input').val()
    return false if !desc.trim().length

  $('.new_team').on 'ajax:success', (xhr, html, status) ->
    $form = $(xhr.target)
    $form.find('.new-team-input').val('')
    $('.new-team-input').blur()
    $(html).insertBefore($('.team.add-team'))

  $('.new_team').on 'ajax:error', (xhr, html, status) ->
    alert('A team by that name already exists.\nPlease pick another one.')

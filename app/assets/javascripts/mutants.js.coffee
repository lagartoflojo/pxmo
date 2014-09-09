$ ->
  $('.new-mutant-input').tooltip()
  $('.new-mutant-link').tooltip()

  $('.new-mutant-input').blur (evt) ->
    $form = $(this).parent()
    $form.fadeOut()

  $('.new-mutant-link').click (evt) ->
    evt.preventDefault()
    $link = $(this)
    $team = $link.parent().parent()
    $form = $team.find('.new_mutant')
    $form.fadeToggle()
    $team.find('.new-mutant-input').focus()

  $('.new_mutant').on 'ajax:success', (xhr, html, status) ->
    $form = $(this)
    $form.fadeOut()
    $form.find('.new-mutant-input').val('')
    $members = $form.parent()
    $members.append(html)

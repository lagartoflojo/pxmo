$ ->
  $('.team-board').on 'blur', '.new-mutant-input', (evt) ->
    $form = $(this).parent()
    $form.fadeOut()

  $('.team-board').on 'click', '.new-mutant-link', (evt) ->
    evt.preventDefault()
    $link = $(this)
    $team = $link.parent().parent()
    $form = $team.find('.new_mutant')
    $form.fadeToggle()
    $team.find('.new-mutant-input').focus()

  $('.team-board').on 'ajax:success', '.new_mutant', (xhr, html, status) ->
    $form = $(this)
    $form.fadeOut()
    $form.find('.new-mutant-input').val('')
    $members = $form.parent()
    $members.append(html)

$ ->
  $('.team-board').on 'ajax:before', '.new_task', (evt) ->
    $form = $(evt.target)
    desc = $form.find('.new-task-input').val()
    return false if !desc.trim().length

  $('.team-board').on 'ajax:success', '.new_task', (xhr, html, status) ->
    $form = $(xhr.target)
    $form.find('.new-task-input').val('')
    $teamTasks = $form.parent().parent()
    $(html).insertBefore($teamTasks.find('.pxmo-checkbox-radio-editable'))

  $('.team-board').on 'change', '[data-task-completion-url]', (evt) ->
    $checkbox = $(evt.target)
    url = $checkbox.data('task-completion-url')
    checked = $checkbox.is(':checked')

    if checked
      $.ajax url, type: 'post'
    else
      $.ajax url, type: 'delete'

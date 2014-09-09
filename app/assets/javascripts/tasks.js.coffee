$ ->
  $('.new-task-input').tooltip()

  $('.new_task').on 'ajax:before', (evt) ->
    $form = $(evt.target)
    desc = $form.find('.new-task-input').val()
    return false if !desc.trim().length

  $('.new_task').on 'ajax:success', (xhr, html, status) ->
    $form = $(xhr.target)
    $form.find('.new-task-input').val('')
    $teamTasks = $form.parent().parent()
    $(html).insertAfter($teamTasks.find('.team-task:last'))

  $('[data-task-completion-url]').on 'change' , (evt) ->
    $checkbox = $(evt.target)
    url = $checkbox.data('task-completion-url')
    checked = $checkbox.is(':checked')

    if checked
      $.ajax url, type: 'post'
    else
      $.ajax url, type: 'delete'

formValidation = ->

  ui =
    submitButton: $('form #participant-submit-button')
    nameField: $('form #participant_full_name')
    emailField: $('form #participant_email')

  validateEmail = (email) ->
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    re.test(email)


  checkIfCanSubmit = ->
    canSubmit = _.any(ui.nameField.val()) && _.any(ui.emailField.val()) && validateEmail(ui.emailField.val())
    ui.submitButton.toggleClass('disabled', !canSubmit)
    canSubmit

  checkIfCanSubmit()

  $('form').on('keypress keydown keyup', (e) ->
    e.preventDefault() if e.keyCode == 13 && !checkIfCanSubmit()
  )

  ui.nameField.change(checkIfCanSubmit)
  ui.emailField.change(checkIfCanSubmit)

$(document).on 'ready', formValidation
$(document).on 'page:load', formValidation
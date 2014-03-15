$ ->

  # CONTACT FORM AJAX

  sendMessage = () ->
    email = $('#contact-email').val()
    subject = $('#contact-subject').val()
    body = $('#contact-body').val()

    data =
      "contact":
        "email": email
        "subject": subject
        "body": body
      "authenticity_token": $('input[name=authenticity_token]').val()

    $('#ajax-contact-form').hide()
    $('.contact.error-message').hide()
    $('.contact.success-message').hide()
    $('.contact.success-message').html("Thank you, #{email}. We&apos;ll be in touch.")
    $('.contact.success-message').fadeIn()

    posting = $.ajax '/contacts',
      type: 'POST'
      data: JSON.stringify(data)
      dataType: 'json'
      contentType: 'application/json'

    posting.done (data) ->
      unless data["valid"]
        $('#contact_email').focus()
        $('.contact.success-message').hide()
        $('.contact.error-message').hide()
        $('.contact.error-message').html data["message"]
        $('.contact.error-message').fadeIn()

  $('#ajax-contact-form').on 'submit', (e) ->
    e.preventDefault()
    sendMessage()


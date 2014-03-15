$ ->

  # CONTACT FORM AJAX

  sendMessage = () ->
    email = $('#message_email').val()
    subject = $('#message_subject').val()
    body = $('#message_body').val()

    console.log email
    console.log "yo"
    
    data =
      "email": email
      "subject": subject
      "body": body
      "authenticity_token": $('input[name=authenticity_token]').val()

    $('#contact-form').hide()
    $('.contact.error-message').hide()
    $('.contact.success-message').hide()
    $('.contact.success-message').html("Thank you, #{email}. We&apos;ll be in touch.")
    $('.contact.success-message').fadeIn()

    # posting = $.ajax '/messages',
    #   type: 'POST'
    #   data: JSON.stringify(data)
    #   dataType: 'json'
    #   contentType: 'application/json'

    # posting.done (data) ->
    #   unless data["valid"]
    #     $('#message_email').focus()
    #     $('.contact.success-message').hide()
    #     $('.contact.error-message').hide()
    #     $('.contact.error-message').html data["message"]
    #     $('.contact.error-message').fadeIn()

  $('#contact-form').on 'submit', (e) ->
    e.preventDefault()
    sendMessage()
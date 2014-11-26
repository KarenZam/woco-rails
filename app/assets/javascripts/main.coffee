$ ->

  # CONTACT FORM AJAX

  sendMessage = () ->
    if $('#anti-spam').val() == "11"
      email = $('#contact-email').val()
      subject = $('#contact-subject').val()
      body = $('#contact-body').val()

      data =
        "email": email
        "subject": subject
        "body": body
        "authenticity_token": $('input[name=authenticity_token]').val()

      $('#ajax-contact-form').hide()
      $('.contact.success-message').html("Thank you, #{email}. We&apos;ll be in touch.")

      
      posting = $.ajax '/contacts',
        type: 'POST'
        data: JSON.stringify(data)
        dataType: 'json'
        contentType: 'application/json'

      posting.done (data) ->
        console.log "done"
    
    else
      $('#anti-spam-error').show(1000)

  $('#ajax-contact-form').on 'submit', (e) ->
    e.preventDefault()
    sendMessage()


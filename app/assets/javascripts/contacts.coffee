class @Contacts
  constructor: ->
    @container    = $('.contacts')
    @form         = @container.find('form')
    @createUrl    = @form.attr('action')
    @submitButton = @container.find("[type='submit']")

    @submitButton.on 'click', @submit
    @form.on 'submit', @submit

    @fields =
      name:   @container.find("[name='name']")
      email:  @container.find("[name='email']")
      body:   @container.find("[name='body']")

  submit: (event) =>
    event.preventDefault()

    $.post @createUrl, { name: @fields.name.val(), email: @fields.email.val(), body: @fields.body.val() }
    @clean()

  clean: ->
    @fields.name.val('')
    @fields.email.val('')
    @fields.body.val('')

$ ->
  $("form").validate()
  new Contacts()



@sampleMessages = [
  {text: "Meteor is awesome!"}, 
  {text: "Meteor is great!"}, 
  {text: "Meteor is so nice!"}
]

@Messages = new Mongo.Collection "messages"

if Meteor.isClient

  Session.set "sampleMessages", sampleMessages

  Template.messages.helpers
    messages: -> 
      Messages.find {}, {sort:{createdAt:-1}}

  Template.messages.events
    "change input.messageInput": (e,t)->
      msg = $(e.target).val()
      
      Meteor.call "insertMessge", msg

  Template.oneMessage.helpers
    userName: ->
      
      if @userId
        userName = Meteor.users.findOne({_id:@userId}).profile.name
      else
        if @creator
          userName = @creator
        else
          userName = "anonymous"

      userName




if Meteor.isServer
  if Messages.find().count() is 0
    for msg in sampleMessages
      msg.createdAt = new Date
      Messages.insert msg 


  Meteor.methods
    "insertMessge": (msg) ->
      userId = Meteor.userId()

      
      # creator = $("input.authorInput").val()
      
      messages = 
        text:msg
        # creator:creator
        createdAt: new Date

      if userId
        messages.userId = userId

      Messages.insert messages


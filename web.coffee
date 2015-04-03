
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

      userId = Meteor.userId()

      msg = $(e.target).val()
      # creator = $("input.authorInput").val()
      
      messages = 
        text:msg
        # creator:creator
        createdAt: new Date

      if userId
        messages.userId = userId

      Messages.insert messages


if Meteor.isServer
  if Messages.find().count() is 0
    for msg in sampleMessages
      msg.createdAt = new Date
      Messages.insert msg 


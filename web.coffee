
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
      # Session.get "sampleMessages"-
      Messages.find()


  Template.messages.events
    "change input": (e,t)->
      msg = $(e.target).val()
      
      # sampleMessages = Session.get "sampleMessages"
      
      # sampleMessages.push 
      #   text:msg
      
      # Session.set "sampleMessages", sampleMessages
      
      Messages.insert  
        text:msg

if Meteor.isServer
  if Messages.find().count() is 0
    Messages.insert msg for msg in sampleMessages

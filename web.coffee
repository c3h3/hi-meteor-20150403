
@sampleMessages = [
  {text: "Meteor is awesome!"}, 
  {text: "Meteor is great!"}, 
  {text: "Meteor is so nice!"}
]



if Meteor.isClient

  Session.set "sampleMessages", sampleMessages

  Template.messages.helpers
    messages: -> 
      Session.get "sampleMessages"


  Template.messages.events
    "change input": (e,t)->
      msg = $(e.target).val()
      console.log Session.get "sampleMessages"
      
      sampleMessages = Session.get "sampleMessages"
      
      sampleMessages.push 
        text:msg
      
      Session.set "sampleMessages", sampleMessages
       


testToString = {}
testToString.toString = -> "hello,toSting!"


if Meteor.isClient

  Template.test.helpers
    string: "string"
    number: 1234321
    date: new Date
    rangeArray: [1..3]
    object: 
      abc: 123
      cbd: 432
      arr: [3..5]

    arrayOfObject : [{test:123},{test:234},{test:231}]

    testToString: testToString


  Template.test1.helpers
    h2text: "(1) Hi Meteor! (from h2text)"
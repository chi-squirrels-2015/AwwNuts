# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#NEED TO ADD AUTHOR!
question1 = Question.create!( title: "Get data attribute for all matched elements?", content: "Say I have HTML like below:\n
  <div class='test' data-file='1'></div>\n
  <div class='test' data-file='2'></div>\n
  I would like to get a list of all the data-file values. I tried using, $(.test).data('file') but this only returns 1 which makes sense according to jQuery's documentation which states it will return ...the value at the named data store for the first element in the set of matched elements Emphasis on first. Is there any way to tell jQuery to pull all of the data values into an array?", author: )

question2 = Question.create!( title: "Is it possible to get 0 by subtracting two unequal floating point numbers?", content: "Is it possible to get division by 0 (or infinity)? In normal cases it will not, of course. But what if a and b are very close, can (a-b) result in being 0 due to precision of the calculation? Note that this question is for Java, but I think it will apply to most programming languages.", author: ) 

question3 = Question.create!( title: "iOS app 'The application could not be verified' only on one device", content: "I have two iphone devices( 4s and 5 ) connected to my computer and i am trying to install an application in both the devices. It installs pretty well in iphone 5 but it gives an error 'The application could not be verified.' when attempted to install in the iphone 4s device. The UDIDs of both the devices have been added in the provisioning profile generated for the application. Also, to add a note, I have just updated my iphone version to 8.1.3 in my 4s device. I am not sure though if the error has anything to do with it. Any help on this would be much appreciated. I have been stuck on this for some time now.", author: ) 

question4 = Question.create!( title: "What is indexed monad?", content: "What is indexed monad and the motivation for this monad? I have read that it helps to keep track of the side effects. But the type signature and documentation doesn't lead me to anywhere. What would be an example of how it can help to keep track of side effects (or any other valid example)?", author: ) 

question5 = Question.create!( title: "What happens to a pointer that points to an element in a vector when I shuffle it?", content: "I have a std::vector<int> and a pointer int* that points to an element in the vector. Let’s say the pointer points to the third element: pointer=&vector.at(2). If I now shuffle the vector, will it still point to the same element (the third) or will it point the the new location where the element which used to be the third has now moved? After that, I’d like to make the question a little bit more general: How do pointers and iterators to elements in a vector behave when the vector is expanded or reduced?", author: ) 

question6 = Question.create!( title: "Fix merge conflicts in Git?", content: "Is there a good way to explain how to resolve merge conflicts in Git?", author: ) 
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


#Answer Seeds ------------------------------------------------------------------------------
q1a1 = Answer.create(content: "You can create temporary array for that purpose: \n
                      'var myArray = [];\n
                      $('.test').each( function() {\n
                          myArray.push( $( this ).data( 'file' ) );\n
                      });\n
                      console.log( myArray );'"
              author: #
              question: question1)

q1a2 = Answer.create(content: "Of course! Use .map \n
                      'var dataValues = $('.test[data-file]'').map(function() {\n
                      return $(this).data('file');\n
                      }).get();'"
              author: #
              question: question1)


q2a1 = Answer.create(content: "In Java, a - b is never equal to 0 if a != b. This is because Java mandates IEEE 754 floating point operations which support denormalized numbers. From the spec:

In particular, the Java programming language requires support of IEEE 754 denormalized floating-point numbers and gradual underflow, which make it easier to prove desirable properties of particular numerical algorithms. Floating-point operations do not "flush to zero" if the calculated result is a denormalized number.
If an FPU works with denormalized numbers, subtracting unequal numbers can never produce zero (unlike multiplication), also see this question.

For other languages, it depends. In C or C++, for example, IEEE 754 support is optional.

That said, it is possible for the expression 2 / (a - b) to overflow, for example with a = 5e-308 and b = 4e-308."
              author: #
              question: question2)

q2a2 = Answer.create(content: "As a workaround, what about the following?\n
                              public double calculation(double a, double b) {
                                   double c = a - b;
                                   if (c == 0)
                                   {
                                       return 0;
                                   }
                                   else
                                   {
                                       return 2 / c;
                                   }
                              }"
              author: #
              question: question2)

q3a1 = Answer.create(content: "I had something similar happen to me just recently. I updated my iPhone to 8.1.3, and started getting the 'application could not be verified' error message from Xcode on an app that installed just fine on the same iOS device from the same Mac just a few days ago.

I deleted the app from the device, restarted Xcode, and the app subsequently installed on the device just fine without any error message. Not sure if deleting the app was the fix, or the problem was due to 'the phase of the moon'."
              author: #
              question: question3)

q3a1 = Answer.create(content: "Deleting app worked for me, thank you hotpaw2. I had the 'Application could not be verified' error in xcode after 8.1.3 iOS update, worked after deleting app from phone. Cannot comment because I do not have the minimum 50 posts..."
              author: #
              question: question3)


q4a1 = Answer.create(content: "As ever, the terminology people use is not entirely consistent. There's a variety of inspired-by-monads-but-strictly-speaking-isn't-quite notions. The term '"'indexed monad'"' is one of a number (including '"'monadish'"' and '"'parameterised monad'"' (Atkey's name for them)) of terms used to characterize one such notion. (Another such notion, if you're interested, is Katsumata's '"'parametric effect monad'"', indexed by a monoid, where return is indexed neutrally and bind accumulates in its index.)

First of all, let's check kinds.

IxMonad (m :: state -> state -> * -> *)
That is, the type of a '"'computation'"' (or '"'action'"', if you prefer, but I'll stick with '"'computation'"'), looks like

m before after value
where before, after :: state and value :: *. The idea is to capture the means to interact safely with an external system that has some predictable notion of state. A computation's type tells you what the state must be before it runs, what the state will be after it runs and (like with regular monads over *) what type of values the computation produces.

The usual bits and pieces are *-wise like a monad and state-wise like playing dominoes.

ireturn  ::  a -> m i i a    -- returning a pure value preserves state
ibind    ::  m i j a ->      -- we can go from i to j and get an a, thence
             (a -> m j k b)  -- we can go from j to k and get a b, therefore
             -> m i k b      -- we can indeed go from i to k and get a b
The notion of '"'Kleisli arrow'"' (function which yields computation) thus generated is

a -> m i j b   -- values a in, b out; state transition i to j
and we get a composition

icomp :: IxMonad m => (b -> m j k c) -> (a -> m i j b) -> a -> m i k c
icomp f g = \ a -> ibind (g a) f
and, as ever, the laws exactly ensure that ireturn and icomp give us a category

      ireturn `icomp` g = g
      f `icomp` ireturn = f
(f `icomp` g) `icomp` h = f `icomp` (g `icomp` h)
or, in comedy fake C/Java/whatever,

      g(); skip = g()
      skip; f() = f()
{h(); g()}; f() = h(); {g(); f()}
Why bother? To model '"'rules'"' of interaction. For example, you can't eject a dvd if there isn't one in the drive, and you can't put a dvd into the drive if there's one already in it. So

data DVDDrive :: Bool -> Bool -> * -> * where  -- Bool is '"'drive full?'"'
  DReturn :: a -> DVDDrive i i a
  DInsert :: DVD ->                   -- you have a DVD
             DVDDrive True k a ->     -- you know how to continue full
             DVDDrive False k a       -- so you can insert from empty
  DEject  :: (DVD ->                  -- once you receive a DVD
              DVDDrive False k a) ->  -- you know how to continue empty
             DVDDrive True k a        -- so you can eject when full

instance IxMonad DVDDrive where  -- put these methods where they need to go
  ireturn = DReturn              -- so this goes somewhere else
  ibind (DReturn a)     k  = k a
  ibind (DInsert dvd j) k  = DInsert dvd (ibind j k)
  ibind (DEject j)      k  = DEject j $ \ dvd -> ibind (j dvd) k
With this in place, we can define the '"'primitive'"' commands

dInsert :: DVD -> DVDDrive False True ()
dInsert dvd = DInsert dvd $ DReturn ()

dEject :: DVDrive True False DVD
dEject = DEject $ \ dvd -> DReturn dvd
from which others are assembled with ireturn and ibind. Now, I can write (borrowing do-notation)

discSwap :: DVD -> DVDDrive True True DVD
discSwap dvd = do dvd' <- dEject; dInsert dvd ; ireturn dvd'
but not the physically impossible

discSwap :: DVD -> DVDDrive True True DVD
discSwap dvd = do dInsert dvd; dEject      -- ouch!
Alternatively, one can define one's primitive commands directly

data DVDCommand :: Bool -> Bool -> * -> * where
  InsertC  :: DVD -> DVDCommand False True ()
  EjectC   :: DVDCommand True False DVD
and then instantiate the generic template

data CommandIxMonad :: (state -> state -> * -> *) ->
                        state -> state -> * -> * where
  CReturn  :: a -> CommandIxMonad c i i a
  (:?)     :: c i j a -> (a -> CommandIxMonad c j k b) ->
                CommandIxMonad c i k b

instance IxMonad (CommandIxMonad c) where
  ireturn = CReturn
  ibind (CReturn a) k  = k a
  ibind (c :? j)    k  = c :? \ a -> ibind (j a) k
In effect, we've said what the primitive Kleisli arrows are (what one '"'domino'"' is), then built a suitable notion of '"'computation sequence'"' over them.

Note that for every indexed monad m, the '"'no change diagonal'"' m i i is a monad, but in general, m i j is not. Moreover, values are not indexed but computations are indexed, so an indexed monad is not just the usual idea of monad instantiated for some other category.

Now, look again at the type of a Kleisli arrow

a -> m i j b

We know we must be in state i to start, and we predict that any continuation will start from state j. We know a lot about this system! This isn't a risky operation! When we put the dvd in the drive, it goes in! The dvd drive doesn't get any say in what the state is after each command.

But that's not true in general, when interacting with the world. Sometimes you might need to give away some control and let the world do what it likes. For example, if you are a server, you might offer your client a choice, and your session state will depend on what they choose. The server's '"'offer choice'"' operation does not determine the resulting state, but the server should be able to carry on anyway. It's not a '"'primitive command'"' in the above sense, so indexed monads are not such a good tool to model the unpredictable scenario.

What's a better tool?

type f :-> g = forall state. f state -> g state

class MonadIx (m :: (state -> *) -> (state -> *)) where
  returnIx    :: x :-> m x
  flipBindIx  :: (a :-> m b) -> (m a :-> m b)  -- tidier than bindIx
Scary biscuits? Not really, for two reasons. One, it looks rather more like what a monad is, because it is a monad, but over (state -> *) rather than *. Two, if you look at the type of a Kleisli arrow,

a :-> m b   =   forall state. a state -> m b state
you get the type of computations with a precondition a and postcondition b, just like in Good Old Hoare Logic. Assertions in program logics have taken under half a century to cross the Curry-Howard correspondence and become Haskell types. The type of returnIx says '"'you can achieve any postcondition which holds, just by doing nothing'"', which is the Hoare Logic rule for '"'skip'"'. The corresponding composition is the Hoare Logic rule for '"';'"'.

Let's finish by looking at the type of bindIx, putting all the quantifiers in.

bindIx :: forall i. m a i -> (forall j. a j -> m b j) -> m b i
These foralls have opposite polarity. We choose initial state i, and a computation which can start at i, with postcondition a. The world chooses any intermediate state j it likes, but it must give us the evidence that postcondition b holds, and from any such state, we can carry on to make b hold. So, in sequence, we can achieve condition b from state i. By releasing our grip on the '"'after'"' states, we can model unpredictable computations.

Both IxMonad and MonadIx are useful. Both model validity of interactive computations with respect to changing state, predictable and unpredictable, respectively. Predictability is valuable when you can get it, but unpredictability is sometimes a fact of life. Hopefully, then, this answer gives some indication of what indexed monads are, predicting both when they start to be useful and when they stop."
              author: #
              question: question4)

q5a1 = Answer.create(content: "The pointer will continue to point to the same location, so when you shuffle, it'll point to whatever element has been moved into the location you specified.

When you expand the size of a vector, all existing pointers and iterators into the vector can become invalid. When you shuffle, they continue to refer to the same location, which will (usually) contain a different value than it did before shuffling.

Reducing the size of a vector will depend on exactly how you do that. One way is to create a temporary vector as a copy of the current vector, swap the two, then destroy the temporary (usually implicitly, by letting it go out of scope). If you do this, the pointers will be into the temporary, and be invalidated when it's destroyed.

If you use shrink_to_fit that (probably) won't invalidate iterators/pointers, but may not have any effect (the standard specifies that it's a non-binding request, and doesn't say anything about it invalidating iterators/pointers)."
              author: #
              question: question5)

q5a2 = Answer.create(content: "If the vector is shuffled without being resized then the pointer still points to the same location , which will probably contain a different element.

If the vector is resized to be larger, then the pointer is said to be "invalidated" and it has the same status as an uninitialized pointer, i.e. evaluating it or trying to read through it causes undefined behaviour."
              author: #
              question: question5)

q6a1 = Answer.create(content: "Try: git mergetool

It opens a GUI that steps you through each conflict, and you get to choose how to merge. Sometimes it requires a bit of hand editing afterwards, but usually it's enough by itself. It is much better than doing the whole thing by hand certainly."
              author: #
              question: question6)

q6a2 = Answer.create(content: "Here's a probable use-case, from the top:

                              You're going to pull some changes, but oops, you're not up to date:

                              git fetch origin
                              git pull origin master

                              From ssh://gitosis@example.com:22/projectname
                               * branch            master     -> FETCH_HEAD
                              Updating a030c3a..ee25213
                              error: Entry 'filename.c' not uptodate. Cannot merge.
                              So you get up-to-date and try again, but have a conflict:

                              git add filename.c
                              git commit -m "made some wild and crazy changes"
                              git pull origin master

                              From ssh://gitosis@example.com:22/projectname
                               * branch            master     -> FETCH_HEAD
                              Auto-merging filename.c
                              CONFLICT (content): Merge conflict in filename.c
                              Automatic merge failed; fix conflicts and then commit the result.
                              So you decide to take a look at the changes:

                              git mergetool
                              Oh me, oh my, upstream changed some things, but just to use my changes...no...their changes...

                              git checkout --ours filename.c
                              git checkout --theirs filename.c
                              git add filename.c
                              git commit -m "using theirs"
                              And then we try a final time

                              git pull origin master

                              From ssh://gitosis@example.com:22/projectname
                               * branch            master     -> FETCH_HEAD
                              Already up-to-date.
                              Ta-da!"
              author: #
              question: question6)


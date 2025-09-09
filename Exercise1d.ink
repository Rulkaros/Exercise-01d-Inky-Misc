VAR health = 5
VAR teammates = ""
VAR gun = 0
VAR time = 0 //  0 0 choice, 1 1 choice, 2 2 choice, 3 3 choice, 4 4 choice, 5 5choice
-> Before

== function advance_time ==
    ~ time = time + 1
    
    {
        - time > 6:
            ~ time = 0
    }    

    {    
        - time == 0:
            ~ return "Begin"
        
        - time == 1:
            ~ return "You have enough time to make choice"
        
        - time == 2:
            ~ return "The time go fast, but you still have enough time to make choice"
        
        - time == 3:
            ~ return "Beep~~ Beep~~"
            
        - time == 4:
            ~ return "You become nervous"
            
        - time == 5:
            ~ return "The Beep become frequently"
            
        - time == 6:
            ~ return "BBoom"
    
    }
    
        
    ~ return time


== Before ==
Before you begin the game, you should choose your teammates follow you

*[A]
    ~ teammates = "A"
    -> Beginning
*[B]
    ~ teammates = "B"
    -> Beginning
*[C]
    ~ teammates = "C"
    -> Beginning
    
== Beginning ==
You are playing a game called CSGO. You are now in a 1v1 clutch situation. As the Terrorist side, you have successfully planted the bomb, and you only need to ensure the C4 explodes after five turns. Your enemy, the last member of the Counter-Terrorist side, needs two turns to defuse the bomb (defusing the bomb makes a sound that alerts the Terrorists that the C4 is being defused, but the Counter-Terrorist can also use this sound to fake it and gather information to defeat the Terrorist). 

Now, the bomb makes a “click” sound—the sound of the CT cutting the wire during defusal. You are in a completely safe corner. {not gun_pickup: How ever you just throw your gun because of several reasons and now your gun is on the ground.} Should you take a look at the C4? { advance_time() }

+ {gun > 0}Jump out from the corner
    The CT hears your footsteps before you even jump out, pre-aims, and shoots you in the head. You lose the match due to your recklessness. --> Defuse1

+ {gun > 0}It’s fake, keep waiting
    You stay completely still, holding your breath both in-game and in real life. --> Wait1
    
* let your teammates {teammates} have a look
    he died because that is a trap -> Beginning

* pick up the gun -> gun_pickup

* [walk out with knife]ofcourse you cannot throw your knife in a fps game, you are died
    -->Beginning

==gun_pickup==
~ gun = gun +1
You now pick up the gun and you are confidence to solve this match 
--> Beginning

== Defuse1 ==
Because of your mistake, your teammates put a lot of pressure on you, and you’re drenched in sweat. You think you might be more cautious next time?

* [go back] --> Beginning
* -> END

== Wait1 ==
There’s been no movement for a while. Could he actually be defusing the bomb? { advance_time() }

+ Slowly walk out from the corner
You move out silently, making no sound. You see no one at the bomb and breathe a sigh of relief, but suddenly the sound of a taser makes your mouse fly out of your hand—you’ve been tricked; he was waiting for you. --> Defuse1

+ As the long-time “big heart” record holder in CSGO, you choose to keep waiting
Nothing happens—it’s clear he’s hiding somewhere waiting for you. --> Wait2

* let your teammates {teammates} have a look
    he died because that is a trap -> Wait1

== Wait2 ==
Time is ticking away, and the C4’s beeping becomes faster and faster. Now he starts to panic—hurried footsteps approach and then run toward the C4. The “click” sound is heard. { advance_time() }

+ Run out with loud footsteps
Your footsteps startle him, and he whips a bullet into your head. You die. { teammates == "A": teammates A pull up after you died and with the match|}
->Fake2

+ Slowly walk out
You find him fully focused on defusing the C4 and quietly walk up behind him. --> Real1

+ This obvious opening is bait—you won’t fall for it
You are like a rock, an immovable model; if there were birds in the game, they would poop on you. --> Wait3

* let your teammates {teammates} have a look
    He killed ct and win the match -> Wait2

== Fake2 ==
Unfortunately, CT’s lucky this time. Your teammates won’t say much to you.{ teammates == "A": At least teammates A help you save the win|}
-> END

== Real1 ==
He has his back to you, seemingly unaware—or maybe truly unaware. { advance_time() }

*You pull out your knife to stab him in the back
Like he has spider-sense, he notices you the moment you draw your knife. Unfortunately, the knife’s front damage is not enough for a one-hit kill. He pulls out his gun and shoots you. --> Real2

*You end his life with a burst from your AK. -> Real3

== Real2 ==
Maybe this is the end, but perhaps you didn’t realize there wasn’t enough time for two turns left. As he rushed back to the bomb to defuse it, the bomb exploded, killing him. Achievement unlocked: “No Survivors.”
-> END

== Real3 ==
You win the match, and your teammates put you on a pedestal.
-> END

== Wait3 ==
Are you sure you’re not going to do anything? Now the opponent makes no sound at all… { advance_time() }

* Run out with loud footsteps
Your footsteps startle him, and he whips a bullet into your head. You die. --> Fake2

* Slowly walk out
You find him fully focused on defusing the C4 and quietly walk up behind him. --> Real1

* This obvious opening is bait—you won’t fall for it
You find it strange he’s not defusing the bomb. Time is running out, but you remain cautious and perfectly still—I’m more inclined to believe you’ve fallen asleep. --> Wait4

* let your teammates {teammates} have a look
    He killed ct and win the match -> Wait3

== Wait4 ==
The opponent defuses the bomb. But now I’m more inclined to suspect you really fell asleep.
-> END
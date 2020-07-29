This is a counterpart to my video on Bringing the Supercarrier to life. You can see this video and instructions on how to use the templates here:
https://youtu.be/XONOFbhwbsU

I recommend you extract this templates folder into the root of your Saved Games\DCS\Missions\ folder for easy access from the DCS editor.

I've created templates for 4, 8 or 16 active aircraft spawns. Each one comes with the Primary (decks clear) and secondary extras This can be used on
any map / mission but does require basic knowledge of the editor triggers.



The Clear deck for AI landing as the name suggests, leaves the areas required for AI to land and taxi to parking.

The Blocked Deck for AI landings Extras is intended to be used in conjunction with the Clear deck, This adds in extra aircraft
that will block the landing taxi path for ai aircraft. You can either use the included code to remove them prior to ai landing
or if no ai are used in the mission just leave it as is.

Be sure to check the Supercarrier manual page 81+ for detailed images showing the safe areas for static objects.

I've also included some Mass launch and recovery extras, these should fit in with any of the other templates without conflict.
Spawn and despawn them as you need for your mission.

Be aware that there is a performance cost to adding lots of aircraft on the deck, for maxium accessibility, if you create a mission with lots
and lots of aircraft onboard such as these examples it's best to provide a simple layout for low performance machines. SC in particular 
is very demanding on systems at the moment. In addition, when spawning a template during the mission be sure to pick a time that won't cause issues
to the players. There may be a lag spike / pause in multiplayer as this happens so it's best to do during a cruise home or to target, avoid doing it
on the event of mission completion or combat.


I've also provided lua files for deleting the templates as well as examples and a mission which will cycle through all of the included templates.

How to use:


Setup
Create a new trigger 

Trigger 1 (Pre-setup)
Type Mission Start		Conditions			Action - do script
				(none)				shipID = # (where # is the ID of the ship you wish to spawn on)

								Actions - Do Script File
								FILE:	- 'SC 4 Spawns Clear Deck.lua' (replace with desired file)
			

Run the mission and you should see aircraft appear.

If you wish to remove aircraft after mission start simply select the appropriate Deletion lua file and run it when needed.

You can reference the 'All Templates Cycled.miz' file included for a demonstration of this.
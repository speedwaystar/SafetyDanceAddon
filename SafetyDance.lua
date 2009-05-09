--[[
	SafetyDance_ Plays music during Heigan the Unclean's "safety dance" event.
	Copyright (C) 2009 Bernard Langham (speedwaystar@gmail.com)
	URL: http://code.google.com/p/safetydance

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.
]]

SafetyDanceEnabled = true
SafetyDanceDebug = false

local SafetyDanceChoons = {
	"Everybody_Loop_Now.mp3",
	"Safety_Loop.mp3",
	"Yakety_Loop.mp3"
}

-- print messages in debug mode
function SafetyDance_Debug(msg)
	if (SafetyDanceDebug) then print(AddOnTitle, ":", msg) end
end

-- play a random song from the list of banging choons
function SafetyDance_StartSong()
	local filename = SafetyDanceChoons[ math.random(#SafetyDanceChoons) ]
	SafetyDance_Debug("Playing " .. filename)
	PlayMusic("Interface\\AddOns\\SafetyDance\\Music\\" .. filename)
end

-- stop the music
function SafetyDance_StopSong(filename)
	SafetyDance_Debug("Stopping song")
	StopMusic()
end

--[[
	SafetyDance_EmoteFilter(_, _, emote, monster, ...)
	Check the passed emote event for evidence of Haigan activity.
	Then,
	(a) Start the music if Haigan is about to rock, or;
	(b) Stop the music if he's finished (awww).
	emote
		The body of the emote: '%s attempts to run away in fear!'
	monster
		The name of the monster: 'Murloc Forager' 
	returns
		True if we want the game to discard the event,
		False, event, ... if we want it to be processed normally
--]]

-- actually traps player emotes as well, but no matter
function SafetyDance_Filter (frame, event, msg, unit, ... )
	--SafetyDance_Debug( unit .. " (" .. event .. "): "..msg )
	if (SafetyDance_Enabled) and (unit == SAFETYDANCE_BOSS) then
		if (msg == SAFETYDANCE_MONSTER_YELL1) then
			SafetyDance_StartSong()
		elseif (msg == SAFETYDANCE_MONSTER_YELL2) then
			SafetyDance_StopSong()
		end
	end
	 -- we need to pass the emote back up to the game
	return false, msg, unit, ...
	
end

-- hook CHAT_MSG_EMOTE events
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_EMOTE", SafetyDance_Filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_MONSTER_YELL", SafetyDance_Filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_BOSS_EMOTE", SafetyDance_Filter)

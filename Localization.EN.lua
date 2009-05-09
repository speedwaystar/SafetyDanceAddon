--[[
	SafetyDance: Plays music during Heigan the Unclean's "safety dance" event.
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
-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------

AddOnName = "SafetyDance"
AddOnTitle = GetAddOnMetadata(AddOnName, "Title")
AddOnVersion = 	GetAddOnMetadata(AddOnName, "Version")
AddOnFullName = AddOnTitle .. " v" .. AddOnVersion
AddOnAuthor = GetAddOnMetadata(AddOnName, "Author")
AddOnNotes = GetAddOnMetadata(AddOnName, "Notes")

SAFETYDANCE_ENABLED = AddOnTitle .. " is enabled"
SAFETYDANCE_DISABLED = AddOnTitle .. " is disabled"

SAFETYDANCE_DEBUG_ENABLED = AddOnTitle .. " debug messages are enabled"
SAFETYDANCE_DEBUG_DISABLED = AddOnTitle .. " debug messages are disabled"

SAFETYDANCE_HELP =
	AddOnFullName .. "\n"
	.. AddOnNotes .. "\n"
	.. "by " .. AddOnAuthor .. "\n"
	.. "Commands:\n"
	.. "on - Enable music\n"
	.. "off - Disable music\n"
	.. "start - Start music\n"
	.. "stop - Stop music\n"
	.. "debug - Toggle debug messages"
  
SAFETYDANCE_BOSS = "Heigan the Unclean"
SAFETYDANCE_RAID_BOSS_EMOTE1 = "Heigan the Unclean teleports and begins to channel a spell!"
SAFETYDANCE_RAID_BOSS_EMOTE2 = "Heigan the Unclean rushes to attack once more."
SAFETYDANCE_MONSTER_YELL1 = "The end is upon you."
SAFETYDANCE_MONSTER_YELL2 = "Close your eyes. Sleep."
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
-- Slash command handler
function SafetyDance_SlashCmd(cmd)
	-- enable/disabled
	if (cmd == "on") or (cmd == "off") then
		SafetyDanceEnabled = (cmd == "on");
		SafetyDance_Status()
	-- debug
	elseif (cmd == "debug on") or (cmd == "debug off") then
		SafetyDanceDebug = (cmd == "debug on")
		SafetyDance_DebugStatus()
	-- toggle
	elseif (cmd == "debug") then
		SafetyDanceDebug = not SafetyDanceDebug;
		SafetyDance_DebugStatus()
	-- music test
	elseif (cmd == "start") then SafetyDance_StartSong()
	elseif (cmd == "stop") then SafetyDance_StopSong()
	else
		-- Print current status and help message
		print(SAFETYDANCE_HELP)
		SafetyDance_Status()
		SafetyDance_DebugStatus()
	end
end

-- display addon status
function SafetyDance_Status()
	print(SafetyDanceEnabled and SAFETYDANCE_ENABLED or SAFETYDANCE_DISABLED)
end


-- display debug status
function SafetyDance_DebugStatus()
	print(SafetyDanceDebug and SAFETYDANCE_DEBUG_ENABLED or SAFETYDANCE_DEBUG_DISABLED)
end

-- register slash commands
SLASH_SafetyDance1 = "/SafetyDance"
SLASH_SafetyDance2 = "/sd"
SlashCmdList["SafetyDance"] = SafetyDance_SlashCmd
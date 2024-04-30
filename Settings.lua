-- load ace lib --
Slashie = LibStub("AceAddon-3.0"):NewAddon("Slashie", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

-- options --
local defaults = {
	profile = {
		["btn_roll"] = true,
        ["btn_reload"] = true,
        ["btn_dance"] = true,
        ["btn_sleep"] = false,
		["btn_sit"] = false,
		["btn_wave"] = false,
		["btn_laugh"] = false,
		["frame_x"] = 500,
		["frame_y"] = 500, 
	},
}

local options = {
	name = "Slashie",
	handler = Slashie,
	type = "group",
	args = {
		roll = {
			type = "toggle",
			name = "roll",
			desc = "toggles /roll button",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
        reload = {
			type = "toggle",
			name = "reload",
			desc = "toggles /reload button",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
        dance = {
			type = "toggle",
			name = "dance",
			desc = "toggles /dance button",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
        sleep = {
			type = "toggle",
			name = "sleep",
			desc = "toggles /sleep button",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		sit = {
			type = "toggle",
			name = "sit",
			desc = "toggles /sit button",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		wave = {
			type = "toggle",
			name = "wave",
			desc = "toggles /wave button",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		laugh = {
			type = "toggle",
			name = "laugh",
			desc = "toggles /laugh button",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
	},
}

-- onload -- 
function Slashie:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("SlashieDB", defaults, true)
	AC:RegisterOptionsTable("Slashie_Options", options)
	self.optionsFrame = ACD:AddToBlizOptions("Slashie_Options", "Slashie")

	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	AC:RegisterOptionsTable("Slashie_Profiles", profiles)
	ACD:AddToBlizOptions("Slashie_Profiles", "Profiles", "Slashie")

	-- generate buttons --
	local btn_count = 0
	for key, val in pairs(self.db.profile) do
		if val == true and string.find(key, "btn_") ~= nil then 
			local btn_name = string.gsub(key, "btn_", "")
			Slashie:CreateButton(btn_name, btn_count)
			btn_count = btn_count + 1
		end
	end 
end

-- button handling --
function Slashie:GetButtonShown(info)
    local btn_name = "btn_" .. info[#info]
    return self.db.profile[btn_name]
end

function Slashie:SetButtonShown(info, value)
    local btn_name = "btn_" .. info[#info]
	self.db.profile[btn_name] = value
end

-- frame position -- 
function Slashie:SetFramePos(frame_x, frame_y)
	self.db.profile["frame_x"] = frame_x
	self.db.profile["frame_y"] = frame_y
end




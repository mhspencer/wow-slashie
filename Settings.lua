-- load ace lib
Slashie = LibStub("AceAddon-3.0"):NewAddon("Slashie", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local defaults = {
	profile = {
		["roll"] = true,
        ["reload"] = true,
        ["dance"] = true,
        ["sleep"] = true,
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
		}
	},
}

function Slashie:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("SlashieDB", defaults, true)
	AC:RegisterOptionsTable("Slashie_Options", options)
	self.optionsFrame = ACD:AddToBlizOptions("Slashie_Options", "Slashie")

	local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	AC:RegisterOptionsTable("Slashie_Profiles", profiles)
	ACD:AddToBlizOptions("Slashie_Profiles", "Profiles", "Slashie")

	-- create buttons
	local btn_count = 0
	for key, val in pairs(self.db.profile) do
		if val == true then
			Slashie:CreateButton(key, btn_count)
			btn_count = btn_count + 1
		end
	end 
end

-- button handling --
function Slashie:GetButtonShown(info)
    local btn_name = info[#info]
    return self.db.profile[btn_name]
end

function Slashie:SetButtonShown(info, value)
    local btn_name = info[#info]
	self.db.profile[btn_name] = value
end




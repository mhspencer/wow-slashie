-- load ace lib --
Slashie = LibStub("AceAddon-3.0"):NewAddon("Slashie", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

-- options --
local defaults = {
	profile = {
		["frame_display"] = "horizontal",
		["frame_x"] = 500,
		["frame_y"] = 500,
		["btn_agree"] = false,
		["btn_amaze"] = false,
		["btn_angry"] = false,
		["btn_apologize"] = false,
		["btn_applaud"] = false,
		["btn_bashful"] = false,
		["btn_beckon"] = false,
		["btn_beg"] = false,
		["btn_blush"] = false,
		["btn_bonk"] = false,
		["btn_bored"] = false,
		["btn_bow"] = false,
		["btn_cackle"] = false,
		["btn_cheer"] = false,
		["btn_chicken"] = false,
		["btn_cry"] = false,
		["btn_cuddle"] = false,
		["btn_dance"] = true,
		["btn_duck"] = false,
		["btn_eat"] = false,
		["btn_fidget"] = false,
		["btn_flex"] = false,
		["btn_gasp"] = false,
		["btn_giggle"] = false,
		["btn_glare"] = false,
		["btn_happy"] = false,
		["btn_hug"] = false,
		["btn_kiss"] = false,
		["btn_kneel"] = false,
		["btn_laugh"] = false,
		["btn_love"] = false,
		["btn_moo"] = false,
		["btn_oom"] = false,
		["btn_no"] = false,
		["btn_party"] = false,
		["btn_point"] = false,
		["btn_reload"] = true,
		["btn_roar"] = false,
		["btn_roll"] = true,
		["btn_rude"] = false,
		["btn_salute"] = false,
		["btn_shy"] = false,
		["btn_shrug"] = false,
		["btn_sit"] = false,
		["btn_sleep"] = false,
		["btn_sorry"] = false,
		["btn_stand"] = false,
		["btn_talk"] = false,
		["btn_thank"] = false,
		["btn_wave"] = false,
		["btn_wink"] = false,
		["btn_yawn"] = false,
	},
}

local options = {
	name = "Slashie",
	handler = Slashie,
	type = "group",
	args = {
		desc_reload = {
			type = "description",
			name = "/reload to update GUI after making changes. \nRight click and drag to move frame.\n",
			order = 0,
		},
		frame_display = {
			type = "select",
			name = "Display",
			order = 1,
			values = {
				["horizontal"] = "horizontal",
				["vertical"] = "vertical",
			},
			get = "GetDisplay",
			set = "SetDisplay",
		},
		desc_util = {
			type = "description",
			name = "\nUtility",
			order = 2,
		},
		reload = {
			type = "toggle",
			name = "reload",
			order = 3,
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		roll = {
			type = "toggle",
			name = "roll",
			order = 3,
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		oom = {
			type = "toggle",
			name = "oom",
			order = 3,
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		desc_emote = {
			type = "description",
			name = "\nEmotes",
			order = 4,
		},
		agree = {
			type = "toggle",
			name = "agree",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		amaze = {
			type = "toggle",
			name = "amaze",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		angry = {
			type = "toggle",
			name = "angry",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		apologize = {
			type = "toggle",
			name = "apologize",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		applaud = {
			type = "toggle",
			name = "applaud",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		bashful = {
			type = "toggle",
			name = "bashful",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		beckon = {
			type = "toggle",
			name = "beckon",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		beg = {
			type = "toggle",
			name = "beg",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		blush = {
			type = "toggle",
			name = "blush",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		bonk = {
			type = "toggle",
			name = "bonk",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		bored = {
			type = "toggle",
			name = "bored",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		bow = {
			type = "toggle",
			name = "bow",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		cackle = {
			type = "toggle",
			name = "cackle",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		cheer = {
			type = "toggle",
			name = "cheer",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		chicken = {
			type = "toggle",
			name = "chicken",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		cry = {
			type = "toggle",
			name = "cry",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		cuddle = {
			type = "toggle",
			name = "cuddle",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		dance = {
			type = "toggle",
			name = "dance",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		duck = {
			type = "toggle",
			name = "duck",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		eat = {
			type = "toggle",
			name = "eat",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		fidget = {
			type = "toggle",
			name = "fidget",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		flex = {
			type = "toggle",
			name = "flex",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		gasp = {
			type = "toggle",
			name = "gasp",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		giggle = {
			type = "toggle",
			name = "giggle",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		glare = {
			type = "toggle",
			name = "glare",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		happy = {
			type = "toggle",
			name = "happy",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		hug = {
			type = "toggle",
			name = "hug",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		kiss = {
			type = "toggle",
			name = "kiss",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		kneel = {
			type = "toggle",
			name = "kneel",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		laugh = {
			type = "toggle",
			name = "laugh",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		love = {
			type = "toggle",
			name = "love",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		moo = {
			type = "toggle",
			name = "moo",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		no = {
			type = "toggle",
			name = "no",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		party = {
			type = "toggle",
			name = "party",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		point = {
			type = "toggle",
			name = "point",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		roar = {
			type = "toggle",
			name = "roar",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		rude = {
			type = "toggle",
			name = "rude",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		salute = {
			type = "toggle",
			name = "salute",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		shy = {
			type = "toggle",
			name = "shy",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		shrug = {
			type = "toggle",
			name = "shrug",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		sit = {
			type = "toggle",
			name = "sit",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		sleep = {
			type = "toggle",
			name = "sleep",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		sorry = {
			type = "toggle",
			name = "sorry",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		talk = {
			type = "toggle",
			name = "talk",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		thank = {
			type = "toggle",
			name = "thank",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		wave = {
			type = "toggle",
			name = "wave",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		wink = {
			type = "toggle",
			name = "wink",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
		yawn = {
			type = "toggle",
			name = "yawn",
			get  = "GetButtonShown",
			set  = "SetButtonShown",
		},
	},
}

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
			Slashie:CreateButton(btn_name, btn_count, self.db.profile["frame_display"])
			btn_count = btn_count + 1
		end
	end
end
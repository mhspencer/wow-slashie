-- outer frame --
local frame = CreateFrame("Frame", nil, UIParent)
frame:SetPoint("CENTER")
frame:SetWidth(250)
frame:SetHeight(30)

local ftex = frame:CreateTexture()
ftex:SetAllPoints(frame)
ftex:SetColorTexture(0,0,0, .4)

-- roll --
local roll = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
roll:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 5)
roll:SetWidth(50)
roll:SetHeight(20)
roll:SetText("/roll")
roll:SetNormalFontObject("GameFontNormalSmall")

local ntex = roll:CreateTexture()
ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
ntex:SetTexCoord(0, 0.625, 0, 0.6875)
ntex:SetAllPoints()
roll:SetNormalTexture(ntex)

local ptex = roll:CreateTexture()
ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
ptex:SetTexCoord(0, 0.625, 0, 0.6875)
ptex:SetAllPoints()
roll:SetPushedTexture(ptex)

roll:SetScript('OnClick', function()
  RandomRoll(1,100)
end)

-- dance --
local dance = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
dance:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 70, 5)
dance:SetWidth(50)
dance:SetHeight(20)
dance:SetText("/dance")
dance:SetNormalFontObject("GameFontNormalSmall")

local ntex = dance:CreateTexture()
ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
ntex:SetTexCoord(0, 0.625, 0, 0.6875)
ntex:SetAllPoints()	
dance:SetNormalTexture(ntex)

local ptex = dance:CreateTexture()
ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
ptex:SetTexCoord(0, 0.625, 0, 0.6875)
ptex:SetAllPoints()
dance:SetPushedTexture(ptex)

dance:SetScript('OnClick', function()
  DoEmote("Dance")
end)

-- sleep --
local sleep = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
sleep:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 130, 5)
sleep:SetWidth(50)
sleep:SetHeight(20)
sleep:SetText("/sleep")
sleep:SetNormalFontObject("GameFontNormalSmall")

local ntex = sleep:CreateTexture()
ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
ntex:SetTexCoord(0, 0.625, 0, 0.6875)
ntex:SetAllPoints()	
sleep:SetNormalTexture(ntex)

local ptex = sleep:CreateTexture()
ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
ptex:SetTexCoord(0, 0.625, 0, 0.6875)
ptex:SetAllPoints()
sleep:SetPushedTexture(ptex)

sleep:SetScript('OnClick', function()
  DoEmote("Sleep")
end)

-- reload --
local reload = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
reload:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 190, 5)
reload:SetWidth(50)
reload:SetHeight(20)
reload:SetText("/reload")
reload:SetNormalFontObject("GameFontNormalSmall")

local ntex = reload:CreateTexture()
ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
ntex:SetTexCoord(0, 0.625, 0, 0.6875)
ntex:SetAllPoints()	
reload:SetNormalTexture(ntex)

local ptex = reload:CreateTexture()
ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
ptex:SetTexCoord(0, 0.625, 0, 0.6875)
ptex:SetAllPoints()
reload:SetPushedTexture(ptex)

reload:SetScript('OnClick', function()
  ReloadUI()
end)

-- movable frame --
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("RightButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)




-- outer frame --
local frame = CreateFrame("Frame", nil, UIParent)
frame:SetPoint("CENTER")
frame:SetWidth(250)
frame:SetHeight(30)

local ftex = frame:CreateTexture()
ftex:SetAllPoints(frame)
ftex:SetColorTexture(0,0,0, .4)

-- autoscaling and movable frame, needs to be loaded last
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
  if addonName == "Slashie" then
    local width = (self:GetNumChildren() * 60) + 10

    self:SetPoint("BOTTOMLEFT", Slashie.db.profile["frame_x"], Slashie.db.profile["frame_y"])
    self:SetWidth(width)
    self:SetMovable(true)
    self:EnableMouse(true)
    self:RegisterForDrag("RightButton")
    self:SetScript("OnDragStart", self.StartMoving)
    self:SetScript("OnDragStop", function() 
      self:StopMovingOrSizing() 
      Slashie:SetFramePos(self:GetLeft(), self:GetBottom())
    end)
  end
end)

-- button handlers --
function Slashie:ClickButton(btn_name)
  if btn_name == "/reload" then
    ReloadUI()
  elseif btn_name == "/roll" then
    RandomRoll(1,100)
  elseif btn_name == "/dance" then
    DoEmote("Dance")
  elseif btn_name == "/sleep" then
    DoEmote("Sleep")
  elseif btn_name == "/sit" then
    DoEmote("Sit")
  elseif btn_name == "/wave" then
    DoEmote("Wave")
  elseif btn_name == "/laugh" then
    DoEmote("Laugh")
  end
end

function Slashie:CreateButton(btn_name, btn_count)
  local x_offset = (btn_count * 60) + 10
  local y_offset = 5

  local btn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  btn:SetIgnoreParentAlpha(true)
  btn:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", x_offset, y_offset)
  btn:SetWidth(50)
  btn:SetHeight(20)
  btn:SetText("/" .. btn_name)
  btn:SetNormalFontObject("GameFontNormalSmall")

  local ntex = btn:CreateTexture()
  ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
  ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  ntex:SetAllPoints()	
  btn:SetNormalTexture(ntex)

  local ptex = btn:CreateTexture()
  ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
  ptex:SetTexCoord(0, 0.625, 0, 0.6875)
  ptex:SetAllPoints()
  btn:SetPushedTexture(ptex)
    
  btn:SetScript('OnClick', function(self)
    btn_name = self:GetText() 
    Slashie:ClickButton(btn_name) 
  end)
end


  -- outer frame ----------------------------------------------------------------
function Slashie:GetDisplay(info)
  return self.db.profile["frame_display"]
end

function Slashie:SetDisplay(info, value)
  self.db.profile["frame_display"] = value
end

function Slashie:SetFramePos(frame_x, frame_y)
	self.db.profile["frame_x"] = frame_x
	self.db.profile["frame_y"] = frame_y
end

local frame = CreateFrame("Frame", nil, UIParent)
frame:SetPoint("CENTER")
frame:SetWidth(250)
frame:SetHeight(30)

local ftex = frame:CreateTexture()
ftex:SetAllPoints(frame)
ftex:SetColorTexture(0,0,0, .25)

-- autoscaling and dragging, needs to be loaded last
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addonName)
  if addonName == "Slashie" then

    -- calculate frame size
    local width, height = 0
    if Slashie.db.profile["frame_display"] == "horizontal" then
      width = (self:GetNumChildren() * 60) + 10
      height = 30
    elseif Slashie.db.profile["frame_display"] == "vertical" then
      width = 60
      height = (self:GetNumChildren() * 30) + 10
    end

    self:SetPoint("BOTTOMLEFT", Slashie.db.profile["frame_x"], Slashie.db.profile["frame_y"])
    self:SetSize(width, height)
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

-- button handlers --------------------------------------------------------------
function Slashie:GetButtonShown(info)
	local btn_name = "btn_" .. info[#info]
	return self.db.profile[btn_name]
end

function Slashie:SetButtonShown(info, value)
  local btn_name = "btn_" .. info[#info]
  self.db.profile[btn_name] = value
end

function Slashie:ClickButton(btn_name)
  if btn_name == "/reload" then
    ReloadUI()
  elseif btn_name == "/roll" then
    RandomRoll(1,100)
  else
    local emote = string.gsub(btn_name, "/", "")
    DoEmote(emote)
  end
end

function Slashie:CreateButton(btn_name, btn_count, display)
  -- position
  local x_offset, y_offset = 0
  if display == "horizontal" then
   x_offset = (btn_count * 60) + 10
   y_offset = 4
  elseif display == "vertical" then
    x_offset = 4
    y_offset = (btn_count * 30) + 10
  end

  -- frame
  local btn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
  btn:SetIgnoreParentAlpha(true)
  btn:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", x_offset, y_offset)
  btn:SetWidth(50)
  btn:SetHeight(20)
  btn:SetText("/" .. btn_name)
  btn:SetNormalFontObject("GameFontNormalSmall")

  -- texture
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

   --script
  btn:SetScript('OnClick', function(self)
    btn_name = self:GetText()
    Slashie:ClickButton(btn_name)
  end)
end


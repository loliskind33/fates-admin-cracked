getgenv().GetPlayer = function(PlayerString)
    local Players = game:GetService("Players")
    local PlayerString = PlayerString:lower()
    local PlayerTable = Players:GetPlayers()
    if #PlayerString == 2 and PlayerString == "me" then return game.Players.LocalPlayer end
    if #PlayerString == 3 and PlayerString == "all" then return PlayerTable end
    for i = 1,#PlayerTable do 
        if PlayerTable[i].Name:lower():sub(1,#PlayerString) == PlayerString then
            return PlayerTable[i]
        end
    end 
end

local Mouse = game:GetService("Players").LocalPlayer:GetMouse().KeyDown
local CMDBARKEY = "'"
local FCMDB = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local MainCMD = Instance.new("TextBox")

FCMDB.Name = "FCMDB"
FCMDB.Parent = game.CoreGui
FCMDB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = FCMDB
Frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
Frame.BorderColor3 = Color3.fromRGB(85, 255, 255)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.786265433, 0, 0.142020494, 0)
Frame.Size = UDim2.new(0, 140, 0, 33)
Frame.Active = true
FRame.Draggable = true

MainCMD.Name = "MainCMD"
MainCMD.Parent = Frame
MainCMD.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
MainCMD.BorderSizePixel = 0
MainCMD.Size = UDim2.new(0, 140, 0, 33)
MainCMD.Font = Enum.Font.GothamBold
MainCMD.PlaceholderColor3 = Color3.fromRGB(85, 255, 255)
MainCMD.PlaceholderText = "Command Here"
MainCMD.Text = ""
MainCMD.TextColor3 = Color3.fromRGB(85, 255, 255)
MainCMD.TextSize = 14.000

local LoseFocus = MainCMD.FocusLost

Mouse:Connect(function(KeyPressed)
 if KeyPressed == (CMDBARKEY) then
   MainCMD:CaptureFocus()
   wait()
   MainCMD.Text = ""
  end
end)

LoseFocus:Connect(function(Enter)
 if Enter then
    if MainCMD.Text:lower():sub(1,6) == ("claim ") then
      local Argument = string.sub(MainCMD.Text, 7)
      local GP = GetPlayer(Argument)
      MainCMD.Text = ""
      print(GP.Name)
      
    end
  end
end)

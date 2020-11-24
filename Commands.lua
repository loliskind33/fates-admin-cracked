local Commands = {
"claim { Target }",
"mimic { Target }",
"unmimic { Target }",
"orbit { Target }",
"unorbit { Target }",
"bring { Target }",
"dmode { Target }",
"tween { Target }",
"control { Target }",
"noclip { Target }",
"clip { Target }",
"goto { Target }",
"loopbring { Target }",
"unloopbring { Target }",
"loopjump { Target }",
"unloopjump { Target }",
"freeze { Target }",
"unfreeze { Target }",
"kill { Target }",
"grab { Target }",
"ws { Target } { Amount }",
"jp { Target } { Amount }",
"hh { Target } { Amount }",
"tp { Target } { Target }",
"rejoin { No Arguments }",
"enable {target}",
"disable {target}",
"fling {target}"
}

local ScreenGui = Instance.new("ScreenGui")
local TopBar = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local Search = Instance.new("TextBox")
local CommandList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local SearchIcon = Instance.new("ImageLabel")
local CloseButton = Instance.new("ImageButton")
local MinimiseButton = Instance.new("ImageButton")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui

TopBar.Name = "TopBar"
TopBar.Parent = ScreenGui
TopBar.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(0.0189999994, 0, 0.310000002, 0)
TopBar.Size = UDim2.new(0, 300, 0, 25)

MainFrame.Name = "MainFrame"
MainFrame.Parent = TopBar
MainFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 0, 0.99999994, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 375)

Search.Name = "Search"
Search.Parent = MainFrame
Search.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Search.BorderSizePixel = 0
Search.Position = UDim2.new(0.0929889455, 0, 0.0293333326, 0)
Search.Size = UDim2.new(0, 259, 0, 25)
Search.Font = Enum.Font.Gotham
Search.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Search.PlaceholderText = "Search"
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(255, 255, 255)
Search.TextScaled = true
Search.TextSize = 14.000
Search.TextWrapped = true
Search.TextXAlignment = Enum.TextXAlignment.Left

CommandList.Name = "CommandList"
CommandList.Parent = MainFrame
CommandList.Active = true
CommandList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CommandList.BorderSizePixel = 0
CommandList.Position = UDim2.new(0.0399999991, 0, 0.128000006, 0)
CommandList.Size = UDim2.new(0, 275, 0, 312)
CommandList.CanvasSize = UDim2.new(0, 0, 2, 0)
CommandList.ScrollBarThickness = 6

SearchIcon.Name = "SearchIcon"
SearchIcon.Parent = MainFrame
SearchIcon.BackgroundTransparency = 1.000
SearchIcon.Position = UDim2.new(-0.000669389963, 0, -0.437333345, 0)
SearchIcon.Size = UDim2.new(0.0936583355, 0, 1, 0)
SearchIcon.Image = "rbxassetid://3605509925"
SearchIcon.ScaleType = Enum.ScaleType.Fit

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.915253282, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Image = "rbxassetid://3944676352"

MinimiseButton.Name = "MinimiseButton"
MinimiseButton.Parent = TopBar
MinimiseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MinimiseButton.BackgroundTransparency = 1.000
MinimiseButton.BorderSizePixel = 0
MinimiseButton.Position = UDim2.new(0.831919968, 0, 0, 0)
MinimiseButton.Rotation = 90.000
MinimiseButton.Size = UDim2.new(0, 25, 0, 25)
MinimiseButton.Image = "rbxassetid://4400703447"

TextLabel.Parent = TopBar
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.216666669, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 170, 0, 25)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Commands"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

function AddCommand(Pos, Name)
local Command = Instance.new("TextLabel")
    
Command.Name = "Command"..Pos
Command.Parent = CommandList
Command.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
Command.BorderSizePixel = 0
Command.Size = UDim2.new(0, 275, 0, 25)
Command.Font = Enum.Font.Gotham
Command.Text = Name
Command.TextColor3 = Color3.fromRGB(255, 255, 255)
Command.TextSize = 20.000
Command.TextXAlignment = Enum.TextXAlignment.Left
end

for i = 1, #Commands do
AddCommand(i, Commands[i])
end

UIListLayout.Parent = CommandList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

local function WKWHX_fake_script() -- MainFrame.LocalScript 
	local script = Instance.new('LocalScript', MainFrame)

	local searchBar = script.Parent.Search
	local scrollFrame = script.Parent.CommandList
	local searchIcon = script.Parent.SearchIcon
	script.Parent.Search.PlaceholderText = "Search"
	
	function updateSearch()
		while wait(.2) do
			for i,label in pairs(scrollFrame:GetChildren()) do
				if label:IsA("TextLabel") then
					local searchText = string.lower(searchBar.Text)
					if searchText ~= "" then
						local labelText = string.lower(label.Text)
						if string.find(labelText, searchText) then
							label.Visible = true
						else
							label.Visible = false
						end
					else
						label.Visible = true
					end
				end
			end
		end
	end
	
	spawn(updateSearch)
end
coroutine.wrap(WKWHX_fake_script)()
local function ZWPHND_fake_script() -- TopBar.LocalScript 
	local script = Instance.new('LocalScript', TopBar)

	script.Parent.Position = UDim2.new(-1.019, 0,0.31, 0)
	script.Parent:TweenPosition(UDim2.new(0.019, 0,0.31, 0), "Out", "Sine", 1, true)
	script.Parent.Draggable = true
	script.Parent.Active = true
	
	local minimiseButton = script.Parent.MinimiseButton
	local closeButton = script.Parent.CloseButton
	local commandslist = script.Parent.MainFrame.CommandList
	
	_G.Minimized = false
	
	minimiseButton.MouseButton1Click:Connect(function()
	if _G.Minimized == false then
	commandslist.Visible = false
	script.Parent.MainFrame.Search.Visible = false
	script.Parent.MainFrame.SearchIcon.Visible = false
	script.Parent.MainFrame:TweenSize(UDim2.new(0, 300,0, 0), "In", "Sine", 1, true)
	_G.Minimized = true
	else
	script.Parent.MainFrame:TweenSize(UDim2.new(0, 300,0, 375), "In", "Sine", 1, true)
	wait(1)
	commandslist.Visible = true
	script.Parent.MainFrame.Search.Visible = true
	script.Parent.MainFrame.SearchIcon.Visible = true
	_G.Minimized = false
	end
	end)
	
	closeButton.MouseButton1Click:Connect(function()
	script.Parent:TweenPosition(UDim2.new(-1.019, 0,0.31, 0), "Out", "Bounce", 1, true)
	wait(1.5)
	script.Parent:Destroy()
	end)
end
coroutine.wrap(ZWPHND_fake_script)()

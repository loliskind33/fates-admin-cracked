local synapse = syn and not is_sirhurt_closure

     if synapse then
            local function networkacces()
            local plrs = game:GetService("Players")
            local plr = plrs.LocalPlayer
            local Render = game:GetService("RunService").RenderStepped
            local SR = math.huge*math.huge
            local MSR = math.pow(math.huge,math.huge)
            settings().Physics.AllowSleep = false
            Render:Connect(function()
                sethiddenproperty(plr,'MaximumSimulationRadius',MSR)
                sethiddenproperty(plr,'SimulationRadius',SR)
            end)
        end
        networkacces()
        else
        loadstring(game:GetObjects("rbxassetid://5325226148")[1].Source)()
        wait()
        for i = 1,5 do
        game.Players.LocalPlayer.Character:BreakJoints()
       end
     end

UserData = tostring(game:GetService("RbxAnalyticsService"):GetClientId())
SubData = UserData:gsub("-", "")
AntiSpoofData = "hlshu32hdgajskasu3hjbdjhvsaghlshu32hdgajskasu3hjbdjhvsag332ggfff"
WL = game:HttpGetAsync("https://raw.githubusercontent.com/davidkra230/fates-admin-cracked/master/%2557%2548%2549%2554%2545%254c%2549%2553%2554")
Starter = game:GetService("StarterGui")

function SHA256(mes)
  local con = 4294967296
  local ch = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19}
  local k = {0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
  0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
  0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
  0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
  0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
  0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
  0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
  0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2}

  local function bit(obj, bit)
    return obj%(bit*2)>=bit
  end

  local function Or(ca, cb)
    local new = 0
    for i = 0, 32 do
      new = new+((bit(ca,2^i)or bit(cb,2^i))and 2^i or 0)
    end
    return new
  end

  local function rshift(obj, times)
    times = times or 1
    return math.floor(obj*.5^times)%con
  end

  local function lshift(obj, times)
    times = times or 1
    return math.floor(obj*2^times)%con
  end

  local function rrotate(obj,times)
    times = times or 1
    return Or(rshift(obj,times),lshift(obj,32-times))
  end

  local function And(ca, cb)
    local new = 0
    for i = 0, 32 do
      new = new+((bit(ca,2^i)and bit(cb,2^i))and 2^i or 0)
    end
    return new % 2^32
  end

  local function append(cur)
    local new = ""
    for i = 1, 8 do
      local r = cur%256
      new = string.char(r)..new
      cur = (cur-r)/256
    end
    return new
  end

  local function Not(ca)
    return (2^32-1)-ca
  end

  local function xor(ca, cb)
    local new = 0
    for i = 0, 32 do
      new = new+(bit(ca,2^i)~=bit(cb,2^i)and 2^i or 0)
    end
    return new%con
  end

  mes = mes.."\128"..("\0"):rep(64-((#mes+9)%64))..append(#mes*8)

  local Chunks = {}
  for i = 1, #mes, 64 do
    table.insert(Chunks,mes:sub(i,i+63))
  end
  for _,Chunk in next,Chunks do
    local w = {}
    for i = 0, 15 do
      w[i] = (function()local n=0 for q=1,4 do n=n*256+Chunk:byte(i*4+q) end return n end)()
    end
    for i = 16, 63 do
      local s0 = xor(xor(rrotate(w[i-15],7),rrotate(w[i-15],18)),rshift(w[i-15],3))
      local s1 = xor(xor(rrotate(w[i-2],17),rrotate(w[i-2],19)),rshift(w[i-2],10))
      w[i] = (w[i-16] + s0 + w[i-7] + s1)%con
    end
    local a,b,c,d,e,f,g,h=unpack(ch)
    for i = 0, 63 do
      local s0 = xor(xor(rrotate(a,2),rrotate(a,13)),rrotate(a,22))
      local s1 = xor(xor(rrotate(e,6),rrotate(e,11)),rrotate(e,25))
      local t0 = h+s1+xor(And(e,f),And(Not(e),g))+k[i+1]+w[i]
      local t1 = s0+xor(xor(And(a,b),And(a,c)),And(b,c))
      h = g
      g = f
      f = e
      e = (d+t0)%con
      d = c
      c = b
      b = a
      a = (t0+t1)%con
    end
    ch[1]=(ch[1]+a)%con
    ch[2]=(ch[2]+b)%con
    ch[3]=(ch[3]+c)%con
    ch[4]=(ch[4]+d)%con
    ch[5]=(ch[5]+e)%con
    ch[6]=(ch[6]+f)%con
    ch[7]=(ch[7]+g)%con
    ch[8]=(ch[8]+h)%con
  end
  return ("%08x%08x%08x%08x%08x%08x%08x%08x"):format(unpack(ch))
end

function Check(HWID)
 HWID = SHA256(HWID) 
 if string.find(WL, HWID) and string.find(WL, AntiSpoofData) then
     return true
 else
     return false
end
end

if Check(SubData) then
 print(' EXEC ')
else
 game.Players.LocalPlayer:Kick(" [ Invalid Whitelist ] ")
 return
end

local function noti(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {Title = title; Text = text; Duration = 10})
    end

    local function GC()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/davidkra230/fates-admin-cracked/master/Commands.lua")()
    end
    
    local function NoclipCurrent()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") then
    v.CanCollide = false
    end
    end
    end

    local function ClaimTag(Player)
    local C = Instance.new("BoolValue")
    C.Parent = Player.Character
    C.Name = "Claimed"
    end
    
    function Claim(Player)
    ClaimTag(Player)
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character
    local oldpos = char:WaitForChild("HumanoidRootPart").CFrame
    local plr = game.Players.LocalPlayer;
    local chr = plr.Character;
    local hum = chr.Humanoid;

    workspace.FallenPartsDestroyHeight = 0/1/0

    for i,v in pairs(plr.Backpack:GetChildren()) do
    if v:IsA("Tool") then
    v.Parent = char
    end
    end

    char:WaitForChild("Humanoid"):Remove()
    Instance.new("Humanoid", char)
    char:WaitForChild("Head"):Destroy()
    spawn(function()
    
    while game:GetService("RunService").Heartbeat:wait(0.000000e+9) do
    char:WaitForChild("HumanoidRootPart").CFrame = Player.Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(-1,0,1)
    end
    end)

    for a,b in pairs(char:GetChildren()) do
    if b:IsA("Tool") then
    b.Parent = plr.Backpack
    end
    end

    for _,x in pairs(plr.Backpack:GetChildren()) do
    if x:IsA("Tool") then
    x.Parent = char
    end
    end

    for i = 1,10 do
    wait(0.000000e+9)
    char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0,-99999999,0)
    end

    for i = 1,10 do
    wait()
    char:WaitForChild("HumanoidRootPart").CFrame = oldpos
    end

    char:WaitForChild("HumanoidRootPart"):Destroy()
    char:WaitForChild("Torso"):Destroy()
    char:WaitForChild("Right Arm"):Destroy()
    char:WaitForChild("Left Arm"):Destroy()
    char:WaitForChild("Right Leg"):Destroy()
    char:WaitForChild("Left Leg"):Destroy()
    for i = 1,10 do
    wait()
    char:WaitForChild("HumanoidRootPart").CFrame = oldpos
    end
    end

    local function CheckClaim(Player)
    if Player.Character:FindFirstChild("Claimed") then return true else return false end
    end
    
    local function SetWs(Player, Amount)
    Player.Character.Humanoid.WalkSpeed = Amount
    end
    
    local function SetJp(Player, Amount)
    Player.Character.Humanoid.JumpPower = Amount
    end
    
    local function SetHh(Player, Amount)
    Player.Character.Humanoid.HipHeight = Amount
    end
    
    local function Kill(Player)
    Player.Character.Humanoid.Health = 0
    end

    local function Loopbring(Player)
        
    if not Player.Character:FindFirstChild("LoopBring") then
    local StartLoop = Instance.new("BoolValue")
    StartLoop.Name = "LoopBring"
    StartLoop.Parent = Player.Character
    end
    
    game:GetService("RunService").RenderStepped:Connect(function()
    if Player.Character:FindFirstChild("LoopBring") then
    Player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(5,0,0)
    end
    end)
    end

    local function Unloopbring(Player)
    if Player.Character:FindFirstChild("LoopBring") then
    Player.Character:FindFirstChild("LoopBring"):Destroy()
    end
    end

    GetSecond = function(PlayerString)
    local PlayerString = PlayerString:lower()
    local PlayerTable = Players:GetPlayers()
    if #PlayerString == 2 and PlayerString == "me" then return LP end
    if #PlayerString == 3 and PlayerString == "all" then return PlayerTable end
    for i = 1,#PlayerTable do 
    if PlayerTable[i].Name:lower():sub(1,#PlayerString) == PlayerString then
    return PlayerTable[i]
    end
    end 
    end
    
    function Mimic(Player)
    if CheckClaim(Player) == false then return end
    local O = Instance.new("BoolValue")
    O.Name = "O"
    O.Parent = Player.Character
    game:GetService("RunService").RenderStepped:Connect(function()
    if Player.Character:FindFirstChild("O") then
    THRP = Player.Character.HumanoidRootPart
    MHRPT = game.Players.LocalPlayer.Character.HumanoidRootPart
    THRP.CFrame = MHRPT.CFrame + Vector3.new(5, 0, 0)
    wait(0.1)
    THRP.CFrame = MHRPT.CFrame + Vector3.new(0, 0, 5)
    wait(0.1)
    THRP.CFrame = MHRPT.CFrame + Vector3.new(-5, 0, 0)
    wait(0.1)
    THRP.CFrame = MHRPT.CFrame + Vector3.new(0, 0, -5)
    wait(0.1)
    end
    end)
    end

    local function GC()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/davidkra230/fates-admin-cracked/master/Commands.lua")()
    end

    local function Fling(Player)
    Player.Character.Humanoid.Sit = true
    local a = Instance.new("BodyVelocity", Player.Character.Torso)
    a.Velocity = Vector3.new(100000000000,10000000000,1000000000)
    end

    local function Disable(Player)
    Player.Character.Humanoid.PlatformStand = true
    end

    local function Enable(Player)
    Player.Character.Humanoid.PlatformStand = false
    end


    local function Orbit(Player)
      local OrbitTag = Instance.new("BoolValue")
      OrbitTag.Name = "Orbit"
      OrbitTag.Parent = Player.Character
      while Player.Character:FindFirstChild("Orbit") do
      Player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(5, 0, 0)
      wait(0.1)
      Player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 5)
      wait(0.1)
      Player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(-5, 0, 0)
      wait(0.1)
      Player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, -5)
      wait(0.1) 
      end
   end

   local function Unorbit(Player)
   if Player.Character:FindFirstChild("Orbit") then
      Player.Character:FindFirstChild("Orbit"):Destroy()
      end
   end
    
    local function Unmimic(Player)
    if Player.Character:FindFirstChild("O") then
    Player.Character:FindFirstChild("O"):Destroy()
    end
    end
    
    function Freeze(Player)
    if CheckClaim(Player) == false then return end
    Player.Character.Head.Anchored = true
    Player.Character.Torso.Anchored = true
    end
    
    function Unfreeze(Player)
    if CheckClaim(Player) == false then return end
    Player.Character.Head.Anchored = false
    Player.Character.Torso.Anchored = false
    end

    local function Loopjump(Player)
        
    if not Player.Character:FindFirstChild("LoopJump") then
    local StartLoop = Instance.new("BoolValue")
    StartLoop.Name = "LoopJump"
    StartLoop.Parent = Player.Character
    end
    
    game:GetService("RunService").RenderStepped:Connect(function()
    if Player.Character:FindFirstChild("LoopJump") then
    Player.Character.Humanoid.Jump = true
    end
    end)
    end
    
    local function Control(Player)
    Player.Character.HumanoidRootPart.Parent = game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    end

    local function Goto(Player)
    local TP = Player.Character.HumanoidRootPart
    local CP = game.Players.LocalPlayer.Character.HumanoidRootPart
    CP.CFrame = TP.CFrame
    end

    local function Noclip(Player)
    local Char = Player.Character
    local Hum = Char.Humanoid
    if not Player.Character:FindFirstChild("NOCLIP") then
    local Status = Instance.new("BoolValue")
    Status.Name = "NOCLIP"
    Status.Parent = Char
    end

    game:GetService("RunService").Stepped:Connect(function()
      game:GetService("RunService").Stepped:Wait()
        if Char:FindFirstChild("NOCLIP") then
           Hum:ChangeState(11)
         end
      end)
    end

    local function Clip(Player)
    local Char = Player.Character
    if Char:FindFirstChild("NOCLIP") then
    Char:FindFirstChild("NOCLIP"):Destroy()
    end
    end

    local function Unloopjump(Player)
    if Player.Character:FindFirstChild("LoopJump") then
    Player.Character:FindFirstChild("LoopJump"):Destroy()
    end
    end

    local function Dildo(Player)
    local User = game:GetService("Players").LocalPlayer
    if not User.Character:FindFirstChild("Pal Hair") or not User.Character:FindFirstChild("Kate Hair") or not User.Character:FindFirstChild("Hat1") then return noti("[ fate's admin ]", "Error: you require PalHair, WomanHair and ManHair for this.") end

    local function rightarm()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Right Arm"]
    item:BreakJoints()
            
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    local a0 = Instance.new("Attachment",item)
    local a1 = Instance.new("Attachment",character["Torso"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
    a0.Position = Vector3.new(-1.5, 1, 0.7)
    a0.Orientation = Vector3.new(-57.42, -180, -180)
    end
    local function handle()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Pal Hair"].Handle
    item["Mesh"]:Destroy()
    item:BreakJoints()
    
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    a0 = Instance.new("Attachment",item)
    a1 = Instance.new("Attachment",character["Right Arm"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
                
    a0.Position = Vector3.new(0,1.4,0)
    a0.Orientation = Vector3.new(0, -90, 0)
    end
    local function dildo1()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Kate Hair"].Handle
    item["Mesh"]:Destroy()
    item:BreakJoints()
    
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    a0 = Instance.new("Attachment",item)
    a1 = Instance.new("Attachment",character["Right Arm"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
                
    a0.Position = Vector3.new(0,0,-2.7)
    a0.Orientation = Vector3.new(90, -180, 0)
    end
    local function dildo2()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Hat1"].Handle
    item["Mesh"]:Destroy()
    item:BreakJoints()
    
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    a0 = Instance.new("Attachment",item)
    a1 = Instance.new("Attachment",character["Right Arm"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 1000
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 1000
                
    a0.Position = Vector3.new(0,0,-4.7)
    a0.Orientation = Vector3.new(90, -180, 0)
    end

    rightarm()
    handle()
    dildo1()
    dildo2()

    local uis = game:GetService("UserInputService")
    uis.InputBegan:connect(function(inp, GP) if GP then return end
    if inp.KeyCode == Enum.KeyCode.K then
    if CheckClaim(Player) then
    Player.Character.Humanoid.Health = 0
    end
    end
    end)

    repeat
    wait()
    Player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(1.5,5,-5)
    until game.Players.LocalPlayer.Character.Humanoid.Health == 0 or Player.Character.Humanoid.Health == 0
    wait(1)
    game.Players.LocalPlayer.Character:Destroy()
    end

    local function Grab(PlayerL)
    local target = PlayerL.Character.HumanoidRootPart
    local lp = game.Players.LocalPlayer.Character.HumanoidRootPart
    _G.ungrab = false
    if not game.Players.LocalPlayer.Character:FindFirstChild("YandereKnife") then return noti("[ fate's admin ]", "Sorry you need the Yandere Knife for this!") end
    local function left()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Left Arm"]
    item:BreakJoints()
            
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    local a0 = Instance.new("Attachment",item)
    local a1 = Instance.new("Attachment",character["Torso"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
    a0.Position = Vector3.new(0, 1, 1.5)
    a0.Orientation = Vector3.new(-90, -20, -50)
    end
            
    local function right()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Right Arm"]
    item:BreakJoints()
            
            
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    local a0 = Instance.new("Attachment",item)
    local a1 = Instance.new("Attachment",character["Torso"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
            
    a0.Position = Vector3.new(-0.9, 1, -0.5)
    a0.Orientation = Vector3.new(-90, -20, -50)
            
    end
    local function knife()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["YandereKnife"].Handle
    item:BreakJoints()
            
            
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    a0 = Instance.new("Attachment",item)
    a1 = Instance.new("Attachment",character["Right Arm"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
            
    a0.Position = Vector3.new(-0.8,0,1)
    a0.Orientation = Vector3.new(0, -90, -90)
    end
    for i = 1, 5 do
    knife()
    left()
    right()
    end
    noti("[ fate's admin ]", "Press k to kill, will reset you after.")
    local uis = game:GetService("UserInputService")
    uis.InputBegan:connect(function(inp, GP) if GP then return end
    if inp.KeyCode == Enum.KeyCode.K then
    if CheckClaim(PlayerL) then
    PlayerL.Character.Humanoid.Health = 0
    for i = 1,5 do
    _G.ungrab = true
    end
    end
    end
    if _G.ungrab then
    local function larm()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Left Arm"]
    item:BreakJoints()
            
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    local a0 = Instance.new("Attachment",item)
    local a1 = Instance.new("Attachment",character["Torso"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
    a0.Position = Vector3.new(1.5, 0, 0)
    a0.Orientation = Vector3.new(0, 0, 0)

    end
            
    local function rarm()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local item = character["Right Arm"]
    item:BreakJoints()
            
            
    local alignOr = Instance.new("AlignOrientation",character["Head"])
    local alignPosition = Instance.new("AlignPosition",character["Head"])
    local a0 = Instance.new("Attachment",item)
    local a1 = Instance.new("Attachment",character["Torso"])
    alignPosition.Attachment0 = a0
    alignPosition.Attachment1 = a1
    alignPosition.Responsiveness = 200
    alignOr.Attachment0 = a0
    alignOr.Attachment1 = a1
    alignOr.Responsiveness = 200
            
    a0.Position = Vector3.new(-1.5, 0, 0)
    a0.Orientation = Vector3.new(0, 0, 0)
    end
    for i = 1, 20 do
    larm()
    rarm()
    end
    _G.ungrab = false
    wait(2)
    game.Players.LocalPlayer.Character:Destroy()
    end
    end)
    repeat
    wait()            
    target.CFrame = lp.CFrame * CFrame.new(-0.7,0,-1.15)
    until _G.ungrab == true
    end

    local function Lerp(Player)
      local Client = game:GetService("Players").LocalPlayer
      local TP = Player.Character.HumanoidRootPart
      local CP = Client.Character.HumanoidRootPart
      for lerp = 0,1,.01 do
        TP.CFrame = TP.CFrame:lerp(CP.CFrame, lerp)
      wait()
      end
    end
    

local CommandBar = Instance.new("ScreenGui")
local CommandBarFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CommandList = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local SearchIcon = Instance.new("ImageLabel")
local CommandInput = Instance.new("TextBox")
local Ver = Instance.new("TextLabel")

--Properties:

CommandBar.Name = "CommandBar"
CommandBar.Parent = game.CoreGui

CommandBarFrame.Name = "CommandBarFrame"
CommandBarFrame.Parent = CommandBar
CommandBarFrame.BorderSizePixel = 0
CommandBarFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
CommandBarFrame.Position = UDim2.new(0.366727799, 0, 0.906666708, 0)
CommandBarFrame.Size = UDim2.new(0, 366, 0, 70)

Title.Name = "Title"
Title.Parent = CommandBarFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.226435632, 0, 5.21540642e-08, 0)
Title.Size = UDim2.new(0, 200, 0, 21)
Title.Font = Enum.Font.GothamBold
Title.Text = "Command Bar"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

CommandList.Name = "CommandList"
CommandList.Parent = CommandBarFrame
CommandList.BackgroundColor3 = Color3.fromRGB(83, 83, 83)
CommandList.BackgroundTransparency = 0.990
CommandList.Position = UDim2.new(-0.000733755995, 0, 1.09999967, 0)
CommandList.Size = UDim2.new(0, 366, 0, 860)

UIListLayout.Parent = CommandList
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

function newcmd(text, nameofcmd)
local roundifyname = Instance.new("ImageLabel")
local commandname = Instance.new("TextLabel")
commandname.Name = "newcmd"
commandname.Parent = CommandList
commandname.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
commandname.BackgroundTransparency = 1.000
commandname.BorderSizePixel = 0
commandname.Size = UDim2.new(0, 325, 0, 25)
commandname.ZIndex = 2
commandname.Font = Enum.Font.Gotham
commandname.Text = text
commandname.TextColor3 = Color3.fromRGB(255, 255, 255)
commandname.TextSize = 20.000
commandname.Name = "newcmd"
roundifyname.Parent = commandname
roundifyname.AnchorPoint = Vector2.new(0.5, 0.5)
roundifyname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
roundifyname.BackgroundTransparency = 1.000
roundifyname.Position = UDim2.new(0.5, 0, 0.5, 0)
roundifyname.Size = UDim2.new(1, 0, 1, 0)
roundifyname.Image = "rbxassetid://3570695787"
roundifyname.ImageColor3 = Color3.fromRGB(64, 64, 64)
roundifyname.ScaleType = Enum.ScaleType.Slice
roundifyname.SliceCenter = Rect.new(100, 100, 100, 100)
roundifyname.SliceScale = 0.120
end

--Commands--
newcmd("tp {target} {target}")
newcmd("claim {target}")
newcmd("noclip {target}")
newcmd("clip {target}")
newcmd("goto {target}")
newcmd("bring {target}")
newcmd("loopbring {target}")
newcmd("unloopbring {target}")
newcmd("loopjump {target}")
newcmd("unloopjump {target}")
newcmd("freeze {target}")
newcmd("unfreeze {target}")
newcmd("kill {target}")
newcmd("mimic {target}")
newcmd("unmimic {target}")
newcmd("looptp {target} {target} [ DISABLED ]")
newcmd("grab {target} YandereKnife")
newcmd("dmode {target} hats")
newcmd("ws/speed {target} {amount}")
newcmd("jp {target} {amount}")
newcmd("rejoin/rj {no args}")
newcmd("control {target}")
newcmd("tween {target}")
newcmd("disable {target}")
newcmd("enable {target}")
newcmd("orbit {target}")
newcmd("unorbit {target}")
newcmd("fling {target}")
newcmd("cmds/commands {no args}")

SearchIcon.Name = "SearchIcon"
SearchIcon.Parent = CommandBarFrame
SearchIcon.BackgroundTransparency = 1.000
SearchIcon.Position = UDim2.new(0.111352466, 0, 0.148380965, 0)
SearchIcon.Size = UDim2.new(0.0936583355, 0, 1, 0)
SearchIcon.Image = "rbxassetid://3605509925"
SearchIcon.ScaleType = Enum.ScaleType.Fit

CommandInput.Name = "CommandInput"
CommandInput.Parent = CommandBarFrame
CommandInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CommandInput.BorderSizePixel = 0
CommandInput.Position = UDim2.new(0.205010742, 0, 0.472190648, 0)
CommandInput.Size = UDim2.new(0, 214, 0, 25)
CommandInput.Font = Enum.Font.Gotham
CommandInput.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
CommandInput.PlaceholderText = "Command Input"
CommandInput.Text = ""
CommandInput.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandInput.TextScaled = true
CommandInput.TextSize = 14.000
CommandInput.TextWrapped = true

Ver.Name = "Ver"
Ver.Parent = CommandBarFrame
Ver.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ver.BackgroundTransparency = 1.000
Ver.BorderSizePixel = 0
Ver.Position = UDim2.new(0.772883654, 0, 0, 0)
Ver.Size = UDim2.new(0, 83, 0, 21)
Ver.Font = Enum.Font.GothamBold
Ver.Text = "Ver: 1.2"
Ver.TextColor3 = Color3.fromRGB(255, 255, 255)
Ver.TextScaled = true
Ver.TextSize = 14.000
Ver.TextWrapped = true




-- Scripts:

local function TWRK_fake_script() -- CommandBarFrame.a 
	local script = Instance.new('LocalScript', CommandBarFrame)

	local uis = game:GetService("UserInputService")
	local cmdbar = script.Parent
	local textbox = script.Parent.CommandInput
	cmdbar.Position = UDim2.new(0.4, 0,1.01, 0)
	
	uis.InputBegan:connect(function(inp, GP) if GP then return end
	if inp.KeyCode == Enum.KeyCode.Quote then
	    cmdbar:TweenPosition(UDim2.new(0.4, 0, 0.825, 0), "In", "Sine", 0.5, true)
		textbox:CaptureFocus()
		wait()
		textbox.Text = ""
	
	end
	end)
	
	function GetPlayer(String) -- Credit to Timeless/xFunnieuss For find plr
	    local Found = {}
	    local strl = String:lower()
	    if strl == "all" then
	        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	            table.insert(Found,v)
	        end
	    elseif strl == "others" then
	        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	            if v.Name ~= game.Players.Localayer.Name then
	                return v
	            end
	        end   
		elseif strl == "me" then
	        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	            if v.Name == game.Players.LocalPlayer.Name then
	                return v
	            end
	        end  
	    else
	        for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	            if v.Name:lower():sub(1, #String) == String:lower() then
	                return v
	            end
	        end    
	    end
	end

	local lplr = game.Players.LocalPlayer
	local character = lplr.Character
	local hrp = character.HumanoidRootPart
	
	local frozen = false
	local bringing = false
	
textbox.FocusLost:Connect(function(enter)
 cmdbar:TweenPosition(UDim2.new(0.4, 0,1.01, 0), "Out", "Sine", 0.5, true)
   if enter then
     cmdbar:TweenPosition(UDim2.new(0.4, 0,1.01, 0), "Out", "Sine", 0.5, true)
    
    if textbox.Text:lower():sub(1,6) == ("claim ") then
       local Arguments = string.split(textbox.Text, " ")
       local Player = GetPlayer(Arguments[2])
       Claim(Player)
    
    elseif textbox.Text:lower():sub(1,3) == ("ws ") or textbox.Text:lower():sub(1,6) == ("speed ") then
       local Arguments = string.split(textbox.Text, " ")
       local Player = GetPlayer(Arguments[2])
       local Speed = Arguments[3]
       if CheckClaim(Player) then
       SetWs(Player, Speed)
    end
     
    elseif textbox.Text:lower():sub(1,3) == ("jp ") then
       local Arguments = string.split(textbox.Text, " ")
       local Player = GetPlayer(Arguments[2])
       local Power = Arguments[3]
       if CheckClaim(Player) then
       SetJp(Player, Power)
    end
       
    elseif textbox.Text:lower():sub(1,3) == ("hh ") then
       local Arguments = string.split(textbox.Text, " ")
       local Player = GetPlayer(Arguments[2])
       local Amount = Arguments[3]
       if CheckClaim(Player) then
       SetHh(Player, Amount)
    end

    elseif textbox.Text:lower():sub(1,6) == ("rejoin") or textbox.Text:lower():sub(1,2) == ("rj") then
      game:GetService("TeleportService"):Teleport(game.PlaceId)


    elseif textbox.Text:lower():sub(1,4) == ("cmds") or textbox.Text:lower():sub(1,8) == ("commands") then
      GC()
    
    elseif textbox.Text:lower():sub(1,6) == ("bring ") then
       local Arguments = string.split(textbox.Text, " ")
       local Player = GetPlayer(Arguments[2])
       local Client = game.Players.LocalPlayer
       if CheckClaim(Player) then
       Player.Character.HumanoidRootPart.CFrame = Client.Character.HumanoidRootPart.CFrame * CFrame.new(5, 0, 0)
    end

    elseif textbox.Text:lower():sub(1,3) == ("tp ") then
       local Arguments = string.split(textbox.Text, " ")
       local Player = GetPlayer(Arguments[2])
       local SecondPlayer = GetPlayer(Arguments[3])
       if CheckClaim(Player) then
       Player.Character.HumanoidRootPart.CFrame = SecondPlayer.Character.HumanoidRootPart.CFrame
    end
    
    elseif textbox.Text:lower():sub(1,5) == ("goto ") then
       local Arguments = string.split(textbox.Text, " ")
       local Player = GetPlayer(Arguments[2])
       local Client = game.Players.LocalPlayer

       Client.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame

   elseif textbox.Text:lower():sub(1,5) == ("grab ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Grab(Player)
   end

   elseif textbox.Text:lower():sub(1,8) == ("control ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Control(Player)
   end

   elseif textbox.Text:lower():sub(1,6) == ("fling ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Fling(Player)
   end

   elseif textbox.Text:lower():sub(1,5) == ("kill ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Kill(Player)
   end

   elseif textbox.Text:lower():sub(1,6) == ("tween ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Lerp(Player)
   end


   elseif textbox.Text:lower():sub(1,7) == ("noclip ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Noclip(Player)
   end

   elseif textbox.Text:lower():sub(1,5) == ("clip ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Clip(Player)
   end

   elseif textbox.Text:lower():sub(1,6) == ("mimic ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Mimic(Player)
   end

   elseif textbox.Text:lower():sub(1,8) == ("unmimic ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Unmimic(Player)
   end

   elseif textbox.Text:lower():sub(1,7) == ("freeze ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Freeze(Player)
   end

   elseif textbox.Text:lower():sub(1,9) == ("unfreeze ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Unfreeze(Player)
   end

   elseif textbox.Text:lower():sub(1,6) == ("dildo ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Dildo(Player)
   end

   elseif textbox.Text:lower():sub(1,9) == ("loopjump ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Loopjump(Player)
   end

   elseif textbox.Text:lower():sub(1,11) == ("unloopjump ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Unloopjump(Player)
   end

   elseif textbox.Text:lower():sub(1,10) == ("loopbring ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Loopbring(Player)
   end

   elseif textbox.Text:lower():sub(1,12) == ("unloopbring ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Unloopbring(Player)
   end

   elseif textbox.Text:lower():sub(1,6) == ("orbit ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Orbit(Player)
   end

   elseif textbox.Text:lower():sub(1,8) == ("unorbit ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Unorbit(Player)
   end

   elseif textbox.Text:lower():sub(1,8) == ("disable ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Disable(Player)
   end

   elseif textbox.Text:lower():sub(1,7) == ("enable ") then
      local Arguments = string.split(textbox.Text, " ")
      local Player = GetPlayer(Arguments[2])
      
      if CheckClaim(Player) then
      Enable(Player)
   end

    end 
  end
end)
	
	
end
coroutine.wrap(TWRK_fake_script)()
local function YKSPR_fake_script() -- CommandBarFrame.Search 
	local script = Instance.new('LocalScript', CommandBarFrame)

	local searchBar = script.Parent.CommandInput
	local scrollFrame = script.Parent.CommandList
	searchBar.PlaceholderText = "Command Input"
	
	function updateSearch()
		while wait(0.2) do
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
coroutine.wrap(YKSPR_fake_script)()

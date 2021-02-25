repeat wait() until game:IsLoaded()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer
local size = 5 --change size of hitbox
local key = "c" -- change key to what you want (https://developer.roblox.com/en-us/api-reference/enum/KeyCode)
local bighead = true -- This changes if you want the head hitbox or not (If you record arsenal gameplay set the size to 3 because the head hitbox is invisible)
local isVisible = true -- change this if u want to see head hit box
local toggle = true
key = key:sub(1, 1):upper()..key:sub(2, #key)

if isVisible then
	isVisible = 0
else
	isVisible = 1
end

UserInputService.InputEnded:Connect(function(input)
	if UserInputService:GetFocusedTextBox() then return end
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode[key] then
		toggle = not toggle
		for _,v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				update(v)
			end
		end
	end
end)

originalSizes = {LowerTorso=plr.Character.LowerTorso.Size,HumanoidRootPart=plr.Character.HumanoidRootPart.Size,HeadHB=plr.Character.HeadHB.Size}

function update(player)
	if not player or not player.Character then return end
	if toggle and player ~= plr and player.Status.Team.Value ~= plr.Status.Team.Value then
		if bighead ~= true then
			player.Character.LowerTorso.Size = Vector3.new(size,size,size)
			player.Character.LowerTorso.Transparency = isVisible
		else
			player.Character.HeadHB.Size = Vector3.new(size,size,size)
			player.Character.HeadHB.Transparency = isVisible
		end
		player.Character.HumanoidRootPart.Size = Vector3.new(size,size,size)
		player.Character.HumanoidRootPart.Transparency = isVisible
	else
		player.Character.HeadHB.Transparency = 1
		player.Character.LowerTorso.Size = originalSizes.LowerTorso
		player.Character.HumanoidRootPart.Size = originalSizes.HumanoidRootPart
		player.Character.HeadHB.Size = originalSizes.HeadHB
	end
end

function onjoin(player)
	if player then player = game.Players[player.Name] else return end
	player.Status.Team:GetPropertyChangedSignal("Value"):Connect(function()
		update(player)
	end)
	update(player)
end

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(onjoin)
end)

for _,v in pairs(Players:GetPlayers()) do
	v.Status.Team:GetPropertyChangedSignal("Value"):Connect(function()
		if v == game.Players.LocalPlayer then
			for _,b in pairs(Players:GetPlayers()) do
				if b ~= game.Players.LocalPlayer then
					update(b)
				end
			end
		else
			update(v)
		end
	end)
	if v ~= game.Players.LocalPlayer then
		update(v)
	end
end

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkiddDev/Scripts/main/woah.lua"))()
ESP.Overrides.GetTeam = function(p)
    return p:FindFirstChild("team") and p.team.Value
end
ESP.Overrides.GetColor = function(char)
    local p = ESP:GetPlrFromChar(char)
    if p then
        local team = ESP:GetTeam(p)
        if team then
            return team == "blue" and Color3.new(0,0,1) or Color3.new(1,0,0)
        end
    end
    return nil
end
ESP:Toggle(true)
ESP.Names = true
ESP.Boxes = true

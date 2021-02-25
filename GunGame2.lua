local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local espb = Instance.new("TextButton")
local hitboxb = Instance.new("TextButton")
local resetb = Instance.new("TextButton")
local jumpb = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local speedb = Instance.new("TextButton")
local modgunsb = Instance.new("TextButton")
local open = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.Position = UDim2.new(0.22379604, 0, 0.158634543, 0)
main.Size = UDim2.new(0, 285, 0, 348)
main.Visible = false
main.Style = Enum.FrameStyle.RobloxSquare
main.Draggable = true

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 0.550
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.0285401475, 0, -0.0255227145, 0)
TextLabel.Size = UDim2.new(0, 285, 0, 70)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Gun Game X v2"
TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.TextSize = 34.000
--da esp button duhhhh
espb.Name = "espb"
espb.Parent = main
espb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
espb.Position = UDim2.new(0.162031755, 0, 0.347239941, 0)
espb.Size = UDim2.new(0, 177, 0, 45)
espb.Style = Enum.ButtonStyle.RobloxButton
espb.Font = Enum.Font.GothamBold
espb.Text = "Esp"
espb.TextColor3 = Color3.fromRGB(255, 0, 0)
espb.TextSize = 14.000
espb.MouseButton1Down:connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "ESP ACTIVATED";
		Text = "----------";
	})
	-- -----------------------------------
	--  ___      _   _   _              --
	-- / __| ___| |_| |_(_)_ _  __ _ ___--
	-- \__ \/ -_)  _|  _| | ' \/ _` (_-<--
	-- |___/\___|\__|\__|_|_||_\__, /__/--
	--                         |___/    --
	-- -----------------------------------
	-- -----------------------------------
	ALLYCOLOR = {0,255,255}  	--//Color of the ESP  of people on the same team
	ENEMYCOLOR =  {255,0,0} 	--//Color of the ESP  of people on NOT the same team
	TRANSPARENCY = 0.5			--//Transparency of the ESP
	HEALTHBAR_ACTIVATED = true 	--//Renders the Healthbar
	--
	--

	--							!!!Don't Change Anything Below Here Unless You Know What You're Doing!!!

	function createFlex()
		-- -----------------------------------------------------------------------------------
		--[VARIABLES] //Changing may result in Errors!
		players = game:GetService("Players") --//Required for PF
		faces = {"Front","Back","Bottom","Left","Right","Top"} --//Every possible Enum face
		currentPlayer = nil --//Used for the Team-Check
		lplayer = players.LocalPlayer --//The LocalPlayer
		-- -----------------------------------------------------------------------------------
		players.PlayerAdded:Connect(function(p)
			currentPlayer = p
			p.CharacterAdded:Connect(function(character) --//For when a new Player joins the game 
				createESP(character)			
			end)		
		end)
		-- -----------------------------------------------------------------------------------
		function checkPart(obj)  if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name~="HumanoidRootPart" then return true end end --//Check if the Part is suitable 
		-- -----------------------------------------------------------------------------------
		function actualESP(obj) 

			for i=0,5 do
				surface = Instance.new("SurfaceGui",obj) --//Creates the SurfaceGui
				surface.Face = Enum.NormalId[faces[i+1]] --//Adjusts the Face and chooses from the face table
				surface.AlwaysOnTop = true

				frame = Instance.new("Frame",surface)	--//Creates the viewable Frame
				frame.Size = UDim2.new(1,0,1,0)
				frame.BorderSizePixel = 0												
				frame.BackgroundTransparency = TRANSPARENCY
				if currentPlayer.Team == players.LocalPlayer.Team then --//Checks the Players Team
					frame.BackgroundColor3 = Color3.new(ALLYCOLOR[1],ALLYCOLOR[2],ALLYCOLOR[3])	--//If in same Team											
				else
					frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1],ENEMYCOLOR[2],ENEMYCOLOR[3])	--//If in another Team
				end

			end
		end
		-- -----------------------------------------------------------------------------------
		function createHealthbar(hrp) 
			board =Instance.new("BillboardGui",hrp) --//Creates the BillboardGui with HumanoidRootPart as the Parent
			board.Name = "total"
			board.Size = UDim2.new(1,0,1,0)
			board.StudsOffset = Vector3.new(3,1,0)
			board.AlwaysOnTop = true

			bar = Instance.new("Frame",board) --//Creates the red background
			bar.BackgroundColor3 = Color3.new(255,0,0)
			bar.BorderSizePixel = 0
			bar.Size = UDim2.new(0.2,0,4,0)
			bar.Name = "total2"

			health = Instance.new("Frame",bar) --//Creates the changing green Frame
			health.BackgroundColor3 = Color3.new(0,255,0)
			health.BorderSizePixel = 0
			health.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0)
			hrp.Parent.Humanoid.Changed:Connect(function(property) --//Triggers when any Property changed
				hrp.total.total2.Frame.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0) --//Adjusts the size of the green Frame								
			end)
		end
		-- -----------------------------------------------------------------------------------
		function createESP(c) --//Checks and calls the proper function
			bugfix = c:WaitForChild("Head") --// *Used so the children of the character arent nil.
			for i,v in pairs(c:GetChildren()) do
				if checkPart(v) then
					actualESP(v)
				end
			end
			if HEALTHBAR_ACTIVATED then --//If the user decided to
				createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
			end
		end
		-- -----------------------------------------------------------------------------------
		for i,people in pairs(players:GetChildren())do
			if people ~= players.LocalPlayer then
				currentPlayer = people
				--//Used for Players already in the Game
				createESP(people.Character)
				people.CharacterAdded:Connect(function(character)
					createESP(character)			
				end)
			end
		end
		-- -----------------------------------------------------------------------------------
	end --//End of the entire function

	createFlex() --// Does exactly that :)
end)
--da hitbox button dahhhhh
hitboxb.Name = "hitboxb"
hitboxb.Parent = main
hitboxb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hitboxb.Position = UDim2.new(0.160154969, 0, 0.480961025, 0)
hitboxb.Size = UDim2.new(0, 177, 0, 45)
hitboxb.Style = Enum.ButtonStyle.RobloxButton
hitboxb.Font = Enum.Font.GothamBold
hitboxb.Text = "Hitbox"
hitboxb.TextColor3 = Color3.fromRGB(255, 0, 0)
hitboxb.TextSize = 14.000
hitboxb.MouseButton1Down:connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "WARNING";
		Text = "Do not click this twice:)";
	})
	_G.HeadSize = 20
	_G.Disabled = true

	game:GetService('RunService').RenderStepped:connect(function()
		if _G.Disabled then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
						v.Character.HumanoidRootPart.Transparency = 0.56
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Bright green")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
	end)
end)
--reset thingy
resetb.Name = "resetb"
resetb.Parent = main
resetb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
resetb.Position = UDim2.new(-0.0234291479, 0, 0.887368202, 0)
resetb.Size = UDim2.new(0, 283, 0, 45)
resetb.Style = Enum.ButtonStyle.RobloxButton
resetb.Font = Enum.Font.GothamBlack
resetb.Text = "Reset"
resetb.TextColor3 = Color3.fromRGB(255, 0, 0)
resetb.TextSize = 25.000
resetb.MouseButton1Down:connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "OOF";
		Text = "---";
	})
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
--woah super cool xd jump script
jumpb.Name = "jumpb"
jumpb.Parent = main
jumpb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jumpb.Position = UDim2.new(0.161464334, 0, 0.752126336, 0)
jumpb.Size = UDim2.new(0, 177, 0, 45)
jumpb.Style = Enum.ButtonStyle.RobloxButton
jumpb.Font = Enum.Font.GothamBold
jumpb.Text = "Jump pwr"
jumpb.TextColor3 = Color3.fromRGB(255, 0, 0)
jumpb.TextSize = 14.000
jumpb.MouseButton1Down:connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Moon jump!";
		Text = "------";
	})
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 85
end)

TextButton.Parent = main
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.896757007, 0, -0.0276726056, 0)
TextButton.Size = UDim2.new(0, 43, 0, 32)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "E"
TextButton.TextColor3 = Color3.fromRGB(170, 85, 255)
TextButton.TextSize = 25.000

TextLabel_2.Parent = main
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.119298249, 0, 0.0804597586, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 50)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "If a gun aint working, ik why and i ont feel like fixing it :)"
TextLabel_2.TextColor3 = Color3.fromRGB(170, 255, 0)
TextLabel_2.TextSize = 14.000

TextLabel_3.Parent = main
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.13333334, 0, 0.25574711, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 50)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Reset after you click this :3"
TextLabel_3.TextColor3 = Color3.fromRGB(170, 85, 255)
TextLabel_3.TextSize = 14.000

TextLabel_4.Parent = main
TextLabel_4.BackgroundColor3 = Color3.fromRGB(170, 255, 0)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.Position = UDim2.new(0.130538568, 0, -0.112762578, 0)
TextLabel_4.Size = UDim2.new(0, 200, 0, 37)
TextLabel_4.Font = Enum.Font.GothamBold
TextLabel_4.Text = "Made by sam0770 on Yt"
TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 255)
TextLabel_4.TextSize = 13.000
--fast af boysss
speedb.Name = "speedb"
speedb.Parent = main
speedb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedb.Position = UDim2.new(0.161957726, 0, 0.618202329, 0)
speedb.Size = UDim2.new(0, 177, 0, 45)
speedb.Style = Enum.ButtonStyle.RobloxButton
speedb.Font = Enum.Font.GothamBold
speedb.Text = "Speed"
speedb.TextColor3 = Color3.fromRGB(255, 0, 0)
speedb.TextSize = 14.000
speedb.MouseButton1Down:connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "100 speed!";
		Text = "------";
	})
	while true do
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 90 --Walkspeed of your choice
		wait()
	end
end)
--are you even reading this? (this script took so much time omg)
modgunsb.Name = "modgunsb"
modgunsb.Parent = main
modgunsb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
modgunsb.Position = UDim2.new(0.0436236002, 0, 0.185367525, 0)
modgunsb.Size = UDim2.new(0, 245, 0, 45)
modgunsb.Style = Enum.ButtonStyle.RobloxButton
modgunsb.Font = Enum.Font.GothamBold
modgunsb.Text = "Mod all guns!"
modgunsb.TextColor3 = Color3.fromRGB(170, 255, 0)
modgunsb.TextSize = 14.000
modgunsb.MouseButton1Down:connect(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "RESET!";
		Text = "Mod guns script made by sam0770";
	})
	game:GetService("ReplicatedStorage").Weapons["SSG 69"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["SSG 69"].Values.StoredAmmo.Value = 999
	game:GetService("ReplicatedStorage").Weapons["SSG 69"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["SSG 69"].Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons["SSG 69"].Values.BoltAction.Value = false
	game:GetService("ReplicatedStorage").Weapons["SSG 69"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["SSG 69"].Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons["SIG SG 511"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["SIG SG 511"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["SIG SG 511"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["SIG SG 511"].Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["SIG SG 511"].Values.Accuracy.Value = 1

	--
	game:GetService("ReplicatedStorage").Weapons["Spectre M4"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["Spectre M4"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["Spectre M4"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Spectre M4"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Spectre M4"].Values.RecoilMultiplier.Value = 0

	--
	game:GetService("ReplicatedStorage").Weapons["SVD 63"].Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons["SVD 63"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["SVD 63"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["SVD 63"].Values.CameraRecoil.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons.RPK.Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons.RPK.Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons.RPK.Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons.RPK.Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons.RPK.Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons.M1911.Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons.M1911.Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons.M1911.Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons.M1911.Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons.M1911.Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons.M1911.Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons.M1911.Values.Accuracy.Value = 1
	--
	game:GetService("ReplicatedStorage").Weapons["STG 45(M)"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["STG 45(M)"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["STG 45(M)"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["STG 45(M)"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["AG 043"].Values.Damage.Value = 100
	game:GetService("ReplicatedStorage").Weapons["STG 45(M)"]["D/N: Fire Rate / Accuracy"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["STG 45(M)"]["D/N: Fire Rate / Accuracy"].Values.Accuracy.Value = 1
	game:GetService("ReplicatedStorage").Weapons["STG 45(M)"].Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons["Desert Eagle"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Desert Eagle"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Desert Eagle"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["Desert Eagle"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["Desert Eagle"].Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons["Desert Eagle"].Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons["Remington 870"].Values.FireRate.Value = 1500
	game:GetService("ReplicatedStorage").Weapons["Remington 870"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Remington 870"].Values.Shots.Value = 16
	game:GetService("ReplicatedStorage").Weapons["Remington 870"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Remington 870"].Values.PumpAction.Value = false
	game:GetService("ReplicatedStorage").Weapons["Remington 870"].Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons["Remington 870"].Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons["Vepr 12"].Values.FireRate.Value = 1500
	game:GetService("ReplicatedStorage").Weapons["Vepr 12"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Vepr 12"].Values.Shots.Value = 15
	game:GetService("ReplicatedStorage").Weapons["Vepr 12"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Vepr 12"].Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons["Vepr 12"].Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons["Mossberg 590 Shockwave"].Values.FireRate.Value = 1500
	game:GetService("ReplicatedStorage").Weapons["Mossberg 590 Shockwave"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Mossberg 590 Shockwave"].Values.Shots.Value = 16
	game:GetService("ReplicatedStorage").Weapons["Mossberg 590 Shockwave"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Mossberg 590 Shockwave"].Values.PumpAction.Value = false
	game:GetService("ReplicatedStorage").Weapons["Mossberg 590 Shockwave"].Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons["Mossberg 590 Shockwave"]["Shoot-N-Scoot"].Values.ClipSize.Value = 999
	--
	game:GetService("ReplicatedStorage").Weapons["AG 043"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["AG 043"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["AG 043"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["AG 043"].Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons.Chauchat.Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons.Chauchat.Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons.Chauchat.Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons.Chauchat.Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons.Chauchat.Values.ClipSize.Value = 999
	--
	game:GetService("ReplicatedStorage").Weapons["Tommy Gun"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["Tommy Gun"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Tommy Gun"].Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Tommy Gun"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Tommy Gun"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["Tommy Gun"].Values.Accuracy.Value = 1
	--
	game:GetService("ReplicatedStorage").Weapons["HK 417"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["HK 417"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["HK 417"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["HK 417"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["HK 417"].Values.RecoilMultiplier.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons["TEC 9"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["TEC 9"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["TEC 9"].Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["TEC 9"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["TEC 9"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["TEC 9"].Values.Accuracy.Value = 1
	--
	game:GetService("ReplicatedStorage").Weapons["Glock 19"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["Glock 19"].Values.FireRate.Value = 2200
	game:GetService("ReplicatedStorage").Weapons["Glock 19"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Glock 19"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Glock 19"].Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Glock 19"].Values.Accuracy.Value = 1
	--
	game:GetService("ReplicatedStorage").Weapons.M1A.Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons.M1A.Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons.M1A.Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons.M1A.Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons.M1A["Extended Mag"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons.M1A.Values.ClipSize.Value = 999
	--
	game:GetService("ReplicatedStorage").Weapons["CETME C2"].Values.Damage.Value = 60
	game:GetService("ReplicatedStorage").Weapons["CETME C2"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["CETME C2"].Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["CETME C2"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["CETME C2"].Values.CameraRecoil.Value = 0
	--
	game:GetService("ReplicatedStorage").Weapons["Five Seven"].Values.Automatic.Value = true
	game:GetService("ReplicatedStorage").Weapons["Five Seven"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["Five Seven"].Values.CameraRecoil.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Five Seven"].Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Five Seven"].Values.ClipSize.Value = 999
	game:GetService("ReplicatedStorage").Weapons["Five Seven"].Tactical.Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Five Seven"]["Automatic With Grip"].Values.RecoilMultiplier.Value = 0
	game:GetService("ReplicatedStorage").Weapons["Five Seven"]["Automatic With Grip"].Values.FireRate.Value = 2000
	game:GetService("ReplicatedStorage").Weapons["Five Seven"].Values.Accuracy.Value = 1
	game:GetService("ReplicatedStorage").Weapons["Five Seven"]["Automatic With Grip"].Values.Accuracy.Value = 1
end)
--wahhh that was alot okie all done byeee

open.Name = "open"
open.Parent = ScreenGui
open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
open.BackgroundTransparency = 1.000
open.Position = UDim2.new(0, 0, 0.40667963, 0)
open.Size = UDim2.new(0, 51, 0, 49)
open.Font = Enum.Font.GothamBold
open.Text = "E"
open.TextColor3 = Color3.fromRGB(170, 0, 255)
open.TextSize = 27.000

-- Scripts:

local function PUBDL_fake_script() -- main.LocalScript 
	local script = Instance.new('LocalScript', main)

	local tbl_main = 
		{
		"-Gun game x v2 Made by sam0770 on yt has loaded.-", 
		"All"
	}
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(tbl_main))
end
coroutine.wrap(PUBDL_fake_script)()
local function UOPPOX_fake_script() -- open.LocalScript 
	local script = Instance.new('LocalScript', open)

	local frame = script.Parent.Parent.main --Change Frame to your Frame name!
	local hotkey = Enum.KeyCode.E -- Change Q to your own hotkey!
	
	local UIS = game:GetService("UserInputService")
	local open = false
	
	
	
	UIS.InputBegan:Connect(function(key, gp)
		if key.KeyCode == hotkey then
			if UIS:GetFocusedTextBox() == nil then
				if open == false then
					open = true 
					frame.Visible = open
				elseif open == true then
					open = false
					frame.Visible = open
				end
			end
		end
	end)
	
	
end
coroutine.wrap(UOPPOX_fake_script)()

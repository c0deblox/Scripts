local library = loadstring(game:HttpGet("https://pastebin.com/raw/SKZjdjdj"))();

local Legend = library:CreateSection("Main")
Legend:Label("Legend Of Speed")
Legend:Label("Farm")
local ammount = 100
Legend:Toggle("Gem", function()
	while true do
		wait(0.5)
		for i = 1, ammount do			
			local args = {
				[1] = "collectOrb",
				[2] = "Gem",
				[3] = "City"
			}
			
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end	
	end
end)
Legend:Toggle("Red Orb", function()
	while true do
		wait(0.5)
		for i = 1, ammount do
			local args = {
				[1] = "collectOrb",
				[2] = "Red Orb",
				[3] = "City"
			}
			
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end	
	end
end)
Legend:Toggle("Blue Orb", function()
	while true do
		wait(0.5)
		for i = 1, ammount do
			local args = {
				[1] = "collectOrb",
				[2] = "Blue Orb",
				[3] = "City"
			}
			
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end	
	end
end)
Legend:Toggle("Yellow Orb", function()
	while true do
		for i = 1, ammount do
			wait(0.5)
			local args = {
				[1] = "collectOrb",
				[2] = "Yellow Orb",
				[3] = "City"
			}
			
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end	
	end
end)
Legend:Toggle("Orange Orb", function()
	while true do
		wait(0.5)
		for i = 1, ammount do	
			local args = {
				[1] = "collectOrb",
				[2] = "Orange Orb",
				[3] = "City"
			}
			
			game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
		end	
	end
end)
Legend:Toggle("Auto Rebirth", function()
	while true do
		wait(0.5)
		local args = {
			[1] = "rebirthRequest"
		}
		
		game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
	end
end)

local Legend = library:CreateSection("Credits")
Legend:Label("JoshMods#3657 - Scripting")
Legend:Label("Aztup - UI Library")

library:Ready();

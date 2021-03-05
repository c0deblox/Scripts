local chams = game.RunService.RenderStepped:Connect(function()
	local Players = game:GetService("Players")
	if not shared.PF_Replication then
		for i, v in pairs(getgc(true)) do
			if typeof(v) == 'table' and rawget(v, 'getbodyparts') then
				shared.PF_Replication = v
				break
			end
		end
	else
		for Index, Player in pairs(Players:GetPlayers()) do
			local Body = shared.PF_Replication.getbodyparts(Player)
			if Body and typeof(Body) == 'table' and rawget(Body, 'rootpart') and Player.Team ~= Players.LocalPlayer.Team then
				Player.Character = Body.rootpart.Parent
				for a, b in pairs(Player.Character:GetChildren()) do
					if b.ClassName ~= "Model" and tostring(b) ~= "HumanoidRootPart" and not b:FindFirstChild("box") then
						for i = 1, 2 do
							if tostring(b) ~= "Head" then
								box = Instance.new("BoxHandleAdornment", b)
								box.Size = b.Size + Vector3.new(0.1,0.1,0.1)
							else
								box = Instance.new("CylinderHandleAdornment", b)
								box.Height = b.Size.Y + 0.3
								box.Radius = b.Size.X / 2 + 0.2
								box.CFrame = CFrame.new(Vector3.new(), Vector3.new(0,1,0))
							end
							box.Adornee = b
							box.Name = "box" , tostring(i)
							box.ZIndex = 1   
							if i == 1 then
								box.AlwaysOnTop = false;
								box.Color3 = Color3.fromRGB(255,0,0)
								box.Transparency = 0
							else 
								box.AlwaysOnTop = true;
								box.Color3 = Color3.fromRGB(255,255,255)
								box.Transparency = 0.7
							end
						end
					end
				end
			end
		end
	end
end)

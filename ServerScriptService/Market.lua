-- @ScriptType: Script
local pointsStore = game:GetService("DataStoreService"):GetOrderedDataStore("Coinboard")

game:GetService("ReplicatedStorage"):WaitForChild("giveWepn").OnServerEvent:Connect(function(plr, thing, cost, buying)
	print("event")
	if buying then
		if plr:WaitForChild("leaderstats"):WaitForChild("Coins").Value >= cost then
			plr:WaitForChild("leaderstats"):WaitForChild("Coins").Value -= cost
			local item = Instance.new("BoolValue")
			item.Name = thing
			item.Value = true
			item.Parent = plr:WaitForChild("hidden")

			if not(plr.Backpack:FindFirstChild(thing)) and not(plr.Character:FindFirstChild(thing)) then
				game:GetService("ServerStorage"):WaitForChild("Weapons"):WaitForChild(thing):Clone().Parent = plr.Backpack
			end
		end
	else
		if not(plr.Backpack:FindFirstChild(thing)) and not(plr.Character:FindFirstChild(thing)) then
			game:GetService("ServerStorage"):WaitForChild("Weapons"):WaitForChild(thing):Clone().Parent = plr.Backpack
		end
	end
	
	local inside = {}
	for i, v in pairs(plr.Backpack:GetChildren()) do
		if table.find(inside, v.Name) then
			v:Destroy()
		else
			table.insert(inside, v.Name)
		end
	end
	
	local owned = {}
	for i, v in pairs(plr:WaitForChild("hidden"):GetChildren()) do
		table.insert(owned, v.Name)
	end
	
	game:GetService("DataStoreService"):GetDataStore("LeaderStatSave"):SetAsync(plr.UserId.." Owned", owned)
end)


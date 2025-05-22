-- @ScriptType: Script
local DataStore = game:GetService("DataStoreService")
local ds = DataStore:GetDataStore("LeaderStatSave")
local leaderboardDS = DataStore:GetOrderedDataStore("Coinsboard")



game.Players.PlayerAdded:Connect(function(player)
	local leader = Instance.new("Folder",player)
	leader.Name = "leaderstats"
	
	local kills = Instance.new("IntValue",leader)
	kills.Name = "Kills"
	kills.Value = ds:GetAsync(player.UserId.." Kills") or 0
	ds:SetAsync(player.UserId.." Kills", kills.Value)
	
	local dmg = Instance.new("IntValue",leader)
	dmg.Name = "💥"
	dmg.Value = ds:GetAsync(player.UserId.." DMG") or 0
	ds:SetAsync(player.UserId.." DMG", dmg.Value)
	
	local souls = Instance.new("IntValue",leader)
	souls.Name = "Souls"
	souls.Value = ds:GetAsync(player.UserId.." SOULS") or 0
	ds:SetAsync(player.UserId.." SOULS", souls.Value)
	
	local boodleCup = Instance.new("IntValue",leader)
	boodleCup.Name = "Coins"
	boodleCup.Value = ds:GetAsync(player.UserId.." BC") or 0
	ds:SetAsync(player.UserId.." BC", boodleCup.Value)
	leaderboardDS:SetAsync(player.UserId, boodleCup.Value)
	
	kills.Changed:connect(function()
		ds:SetAsync(player.UserId.." Kills", kills.Value)
	end)
	
	dmg.Changed:connect(function()
		ds:SetAsync(player.UserId.." DMG", dmg.Value)
	end)
	
	souls.Changed:connect(function()
		ds:SetAsync(player.UserId.." SOULS", souls.Value)
	end)
	
	boodleCup.Changed:connect(function()
		ds:SetAsync(player.UserId.." BC", boodleCup.Value)
		leaderboardDS:SetAsync(player.UserId, boodleCup.Value)
	end)
	
	local hidden = Instance.new("Folder",player)
	hidden.Name = "hidden"
	
	local owned = {"Chair"}
	owned.Name = "Owned"
	owned = ds:GetAsync(player.UserId.." Owned") or {"Chair"}
	
	for i, v in pairs(owned) do
		if game:GetService("ServerStorage"):WaitForChild("Weapons"):FindFirstChild(v) then
			local val = Instance.new("BoolValue")
			val.Parent = hidden
			val.Name = v
			val.Value = true
		end
	end
	
	ds:SetAsync(player.UserId.." Owned", owned)
end)

game.Players.PlayerRemoving:connect(function(player)
	ds:SetAsync(player.UserId.." Kills", player.leaderstats.Kills.Value)
	ds:SetAsync(player.UserId.." DMG", player.leaderstats["💥"].Value)
	ds:SetAsync(player.UserId.." BC", player.leaderstats.Coins.Value)
	ds:SetAsync(player.UserId.." SOULS", player.leaderstats["Souls"].Value)
	leaderboardDS:SetAsync(player.UserId, player.leaderstats.Coins.Value)
	

	local owned = {}
	for i, v in pairs(player:WaitForChild("hidden"):GetChildren()) do
		table.insert(owned, v.Name)
	end
	
	ds:SetAsync(player.UserId.." Owned", owned)
end)

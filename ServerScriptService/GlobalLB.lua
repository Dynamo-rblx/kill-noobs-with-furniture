-- @ScriptType: Script
local pointsStore = game:GetService("DataStoreService"):GetOrderedDataStore("Coinsboard")

while task.wait() do
	for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
	
	local screen = plr:WaitForChild("PlayerGui"):WaitForChild("Buttons"):WaitForChild("Leaderboard"):WaitForChild("ScrollingFrame")
	
		for i, v in pairs(screen:GetChildren()) do
			if v.Name == "copy" then
				v:Destroy()
			end
		end

		local isAscending = false
		local pageSize = 10
		local pages = pointsStore:GetSortedAsync(isAscending, pageSize)
		local topTen = pages:GetCurrentPage()

		-- The data in 'topTen' is stored with the index being the index on the page
		-- For each item, 'data.key' is the key in the OrderedDataStore and 'data.value' is the value
		for rank, data in ipairs(topTen) do
			local userId = data.key
			-- print(userId)
			local points = data.value
			local name = game.Players:GetPlayerByUserId(userId).Name

			local template = screen:WaitForChild("Template"):Clone()
			template.Name = "copy"
			template:WaitForChild("PlayerImage").Image = game.Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
			template:WaitForChild("Name").Text = name
			template:WaitForChild("Number").Text = rank
			template:WaitForChild("Coins").Text = points
			template.Parent = screen
			template.Visible = true

		end
	end
	
	for i=1, 100 do
		game:GetService("ReplicatedStorage"):WaitForChild("updateLB"):FireAllClients(tostring(100-i))
		task.wait(1)
	end
end
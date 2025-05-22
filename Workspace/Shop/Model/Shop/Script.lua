-- @ScriptType: Script
local Part = script.Parent
Part.Touched:Connect(function(HIT)

	local H = HIT:FindFirstAncestorWhichIsA("Model"):FindFirstChild("Humanoid")	
	if H then

		local player = game.Players:GetPlayerFromCharacter(HIT:FindFirstAncestorWhichIsA("Model"))	
		if player then

			game:GetService("ReplicatedStorage"):WaitForChild("OpenSoulsShop"):FireClient(player)
		end
	end
end)
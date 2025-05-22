-- @ScriptType: Script
local Part = script.Parent
Part.Touched:Connect(function(HIT)

	local H = HIT:FindFirstAncestorWhichIsA("Model"):FindFirstChild("Humanoid")	
	if H then

		local player = game.Players:GetPlayerFromCharacter(HIT:FindFirstAncestorWhichIsA("Model"))	
		if player then

			local leaderstats = player:WaitForChild("leaderstats")
			local Currency = leaderstats:WaitForChild("Coins")
			local Selling = leaderstats:WaitForChild("Souls") 
			if Selling.Value > 0 then
				Currency.Value = Currency.Value + Selling.Value
				Selling.Value = 0
				
				
				local m = script.Parent:WaitForChild("Money"):Clone()
				m.Parent = HIT:FindFirstAncestorWhichIsA("Model"):WaitForChild("HumanoidRootPart")
				m:Play()
				script.Parent:WaitForChild("ParticleEmitter").Rate = 20
				m.Ended:Wait()
				script.Parent:WaitForChild("ParticleEmitter").Rate = 10
				m:Destroy()
			end
		end
	end
end)
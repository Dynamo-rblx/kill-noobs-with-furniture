-- @ScriptType: LocalScript
local db = false

script.Parent.MouseEnter:Connect(function()
	script.Parent:TweenSize(UDim2.new(0.15, 0,0.15, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.05, true)
	script:WaitForChild("low_cartoon_pop"):Stop()
	script:WaitForChild("cartoon_pop"):Play()
end)

script.Parent.MouseLeave:Connect(function()
	script.Parent:TweenSize(UDim2.new(0.094, 0,0.116, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.05, true)
	script:WaitForChild("cartoon_pop"):Stop()
	script:WaitForChild("low_cartoon_pop"):Play()
end)

script.Parent.MouseButton1Click:Connect(function()
	if db == false then
		db = true
		script.Parent:WaitForChild("Toggle").Value.Visible = not(script.Parent:WaitForChild("Toggle").Value.Visible)
		script:WaitForChild("cartoon_pop"):Stop()
		script:WaitForChild("low_cartoon_pop"):Stop()
		script:WaitForChild("Cartoon bubble button Sound"):Play()
		script:WaitForChild("Cartoon bubble button Sound").Ended:Wait()
		task.wait(0.1)
		db = false
	end
end)
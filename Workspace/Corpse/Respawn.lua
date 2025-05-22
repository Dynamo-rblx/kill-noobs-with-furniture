-- @ScriptType: Script
name="Humanoid"



robo=script.Parent:clone()




script.Parent.Humanoid.Died:Connect(function()

	local s = game.ReplicatedStorage:FindFirstChild("Soul"):Clone()
	s.PrimaryPart.Position = script.Parent.Torso.Position + Vector3.new(0, 3, 0)
	s.Parent = game.Workspace

	task.wait(5)

	robot=robo:clone()

	robot.Parent=script.Parent.Parent

	robot:makeJoints()


	script.Parent:remove()


end)






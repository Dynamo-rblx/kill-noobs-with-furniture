-- @ScriptType: Script
while task.wait() do
	local plrs = game:GetService("Players"):GetChildren()

	local chars = {}

	for i, v in pairs(plrs) do
		if v.Character then
			table.insert(chars, v.Character)
		end
	end

	for i, v in pairs(chars) do
		if v:FindFirstChild("Right Arm") and v:FindFirstChild("Left Arm") then
			local R_ARM = v:WaitForChild('Right Arm')
			local L_ARM = v:WaitForChild('Left Arm')

			if not(R_ARM:FindFirstChildOfClass("Trail")) then
				local attachment0 = Instance.new("Attachment")
				attachment0.Parent = R_ARM
				attachment0.CFrame = CFrame.new(0, -1, -0.5)
				attachment0.Orientation = Vector3.new(0,0,0)
				attachment0.Axis = Vector3.new(1,0,0)
				attachment0.SecondaryAxis = Vector3.new(0,1,0)
				attachment0.Visible = false

				local attachment1 = Instance.new("Attachment")
				attachment1.Parent = R_ARM
				attachment1.CFrame = CFrame.new(0, -1, 0.5)
				attachment1.Orientation = Vector3.new(0,-0,0)
				attachment1.Axis = Vector3.new(1,0,0)
				attachment1.SecondaryAxis = Vector3.new(0,1,0)
				attachment1.Visible = false

				local trail1 = script:WaitForChild("Trail1"):Clone()
				trail1.Parent = R_ARM
				trail1.Attachment0 = attachment0
				trail1.Attachment1 = attachment1

				local trail2 = script:WaitForChild("Trail2"):Clone()
				trail2.Parent = R_ARM
				trail2.Attachment0 = attachment0
				trail2.Attachment1 = attachment1
			end

			if not(L_ARM:FindFirstChildOfClass("Trail")) then
				local attachment0 = Instance.new("Attachment")
				attachment0.Parent = L_ARM
				attachment0.CFrame = CFrame.new(0, -1, -0.5)
				attachment0.Orientation = Vector3.new(0,0,0)
				attachment0.Axis = Vector3.new(1,0,0)
				attachment0.SecondaryAxis = Vector3.new(0,1,0)
				attachment0.Visible = false

				local attachment1 = Instance.new("Attachment")
				attachment1.Parent = L_ARM
				attachment1.CFrame = CFrame.new(0, -1, 0.5)
				attachment1.Orientation = Vector3.new(0,-0,0)
				attachment1.Axis = Vector3.new(1,0,0)
				attachment1.SecondaryAxis = Vector3.new(0,1,0)
				attachment1.Visible = false

				local trail1 = script:WaitForChild("Trail1"):Clone()
				trail1.Parent = L_ARM
				trail1.Attachment0 = attachment0
				trail1.Attachment1 = attachment1

				local trail2 = script:WaitForChild("Trail2"):Clone()
				trail2.Parent = L_ARM
				trail2.Attachment0 = attachment0
				trail2.Attachment1 = attachment1
			end
		end
	end
end
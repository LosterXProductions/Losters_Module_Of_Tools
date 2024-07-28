local Module = {}

Module.PartSelection = function(func)
	local Highlight = Instance.new("Highlight")
	Highlight.FillTransparency = 1
	Highlight.OutlineColor = Color3.fromRGB(118, 255, 94)
	Highlight.FillColor = Color3.fromRGB(166, 255, 128)

	local SelectedPart = nil
	local CanSelect = true

	game:GetService("RunService").RenderStepped:Connect(function()
		if CanSelect == true then
			if game.Players.LocalPlayer:GetMouse().Target ~= nil then
				Highlight.Parent = game.Players.LocalPlayer:GetMouse().Target
				SelectedPart = game.Players.LocalPlayer:GetMouse().Target
			else
				Highlight.Parent = nil
			end
		end
	end)

	local SelectingPart = function()
		if game.Players.LocalPlayer:GetMouse().Target ~= nil then
			Highlight.Parent = game.Players.LocalPlayer:GetMouse().Target
			SelectedPart = game.Players.LocalPlayer:GetMouse().Target
		else
			SelectedPart = nil
		end
	end

	game:GetService("UserInputService").InputBegan:Connect(function(Key)
		if Key.UserInputType == Enum.UserInputType.MouseButton1 then
			CanSelect = false
			Highlight.FillTransparency = 0.75
			SelectingPart()
			if SelectedPart == nil then
				CanSelect = true
				Highlight.FillTransparency = 1
			else
				func(SelectedPart)
			end
		end
	end)
end

return Module

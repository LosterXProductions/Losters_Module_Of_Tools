# Quick Start Guide
## Loading Module
```lua
local Module = local Module = loadstring(game:HttpGet(('https://raw.githubusercontent.com/LosterXProductions/Losters_Module_Of_Tools/main/Module.lua')))()
```
## Using the Part Selection System
```lua
Module.PartSelection(function(SelectedPart)
	SelectedPart.CanCollide = false
end)
```

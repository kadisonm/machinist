local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Machinist = require(ReplicatedStorage.Machinist)

local Idle = require(script.states.idle)
local Active = require(script.states.active)
local Paused = require(script.states.paused)

local testMachine = Machinist.New{
    ["Idle"] = Idle(),
    ["Active"] = Active(),
    ["Paused"] = Paused(),
}

testMachine:ChangeState("Idle")

print("Running")
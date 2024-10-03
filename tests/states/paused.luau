local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Machinist = require(ReplicatedStorage.Machinist)

local function Paused()
    local self = Machinist.State()

    function self:Enter()
        print("Entered Paused!")
    end
    
    function self:Exit()
        self:Cleanup()
    end

    return self
end

return Paused
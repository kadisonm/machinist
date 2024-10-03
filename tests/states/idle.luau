local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Machinist = require(ReplicatedStorage.Machinist)

local function Idle()
    local self = Machinist.State()

    function self:Enter()
        print("Entered Idle")
    end
    
    function self:Exit()
        self:Cleanup()
    end

    return self
end

return Idle
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Machinist = require(ReplicatedStorage.Machinist)

local function Active()
    local self = Machinist.State()

    function self:Enter()
        print("Entered Active!")
    end
    
    function self:Exit()
        self:Cleanup()
    end

    return self
end

return Active
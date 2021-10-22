-- In 1.10, a Mouselook mode was added to the UI.

MouselookHandlerVanilla = {}
local shouldMouselook = false
local handlerFrame = CreateFrame("Frame")

function MouselookHandlerVanilla:toggle()
	-- https://wowwiki-archive.fandom.com/wiki/API_IsMouselooking
	-- https://vanilla-wow-archive.fandom.com/wiki/API_CursorHasItem
	-- Should we DropCursorItem()
	if IsMouselooking() == 1 then
		MouselookHandlerVanilla:disable()
	else
		MouselookHandlerVanilla:enable()
	end
end

function MouselookHandlerVanilla:disable(defer)
	MouselookStop()
    if not defer then
       shouldMouselook = false
    end
	SetBinding("BUTTON2", "TURNORACTION")
end

function MouselookHandlerVanilla:enable(defer)
	MouselookStart()
    if not defer then
       shouldMouselook = true
    end
	SetBinding("BUTTON2", "TOGGLEAUTORUN")
end

-- Disable mouselook when targeting a spell
function handlerFrame:onUpdate(...)
   if SpellIsTargeting() and shouldMouselook then
      MouselookHandlerVanilla:disable()
   end
end

handlerFrame:SetScript("OnUpdate", handlerFrame.onUpdate)


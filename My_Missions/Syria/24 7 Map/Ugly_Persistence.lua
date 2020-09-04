-----------------------------------------------------------------------------------------
-- UGLY PERSISTENCE FRAMEWORK
--
-- 2020 Edition
--
-- Currently no dependency to other frameworks (no MOOSE, MIST, CTLD...)

-- Declare the Framework
UglyP = {}

-- The global save interval
UglyP.saveInterval = 666

-- If true, print any debug text
UglyP.showDebugText = false

-- How long in seconds is the message displayed
UglyP.messageShowTime = 10

-----------------------------------------------------------------------------------------
-- Check if the _toCheckString starts with the _toFindString

UglyP.startsWith = function (_toCheckString, _toFindString)
  return _toCheckString:sub(1, #_toFindString) == _toFindString
end

-----------------------------------------------------------------------------------------
-- Print the neat message to all on screen

UglyP.messageToAll = function (_theNeatMessage, _forceShow)
  if UglyP.showDebugText or (_forceShow ~= nil and _forceShow == true) then
    trigger.action.outText("UGLY: ".._theNeatMessage, UglyP.messageShowTime)
  end
end

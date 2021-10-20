local parentShell = shell
local parentTerm = term.current()

local bExit = false
local sDir = parentShell and parentShell.dir() or ""
local sPath = parentShell and parentShell.path() or ".:/rom/programs"
local tAliases = parentShell and parentShell.aliases() or {}
local tCompletionInfo = parentShell and parentShell.getCompletionInfo() or {}
local tProgramStack = {}



-- Colours
local promptColour, textColour, bgColour
promptColour = colours.lightBlue
textColour = colours.lightBlue
bgColour = colours.black

local tArgs = { ... }
if #tArgs > 0 then
    shell.run(...)
else
    term.setTextColour(promptColour)
    term.setBackgroundColor(bgColour)
    term.clear()
    term.setCursorPos(1,1)
    print('AngeLzOS 1.3')
    shell.setAlias("shell", "/.system/shell.lua")
    shell.setAlias("startup", "/.system/ftr.lua")
    shell.setAlias("menu", "/.system/ftr.lua")
    shell.setAlias("startup.lua", "/.system/ftr.lua")
    shell.setAlias("menu.lua", "/.system/ftr.lua") 
    shell.setAlias("/startup.lua", "/.system/ftr.lua")
    shell.setAlias("/.system/menu.lua", "/.system/ftr.lua")   
	shell.setAlias("top","/.system/top.lua") 
    term.setTextColour(promptColour)
    local tCommandHistory = {}
    while not bExit do
        term.redirect(parentTerm)
        term.setBackgroundColor(bgColour)
        term.setTextColour(textColour)
        write("/"..shell.dir() .. "> ")
        term.setTextColour(textColour)


        local sLine
        if settings.get("shell.autocomplete") then
            sLine = read(nil, tCommandHistory, shell.complete)
        else
            sLine = read(nil, tCommandHistory)
        end
        if sLine:match("%S") and tCommandHistory[#tCommandHistory] ~= sLine then
            table.insert(tCommandHistory, sLine)
            shell.run('/.system/uac.lua '.. sLine)
        end
    end
end
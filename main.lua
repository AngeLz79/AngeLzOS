--Vars
version = 1.0
_dt =  paintutils.loadImage("/.background/bg")

local currentTabID = multishell.getCurrent()

multishell.setTitle(currentTabID, "Home")

--Function

clear = function()
    term.clear()
    term.setCursorPos(1,1)
    term.setTextColor(colors.white)
end

printsp = function(inputstr, sep)
    if sep == nil then
            sep = " "
    end
    t={}
    str=inputstr 
    str:gsub(".",function(c) table.insert(t,c) end)
    print(t[1]..t[2]..t[3]..t[4]..t[5]..t[6]..t[7]..t[8].."...")
end

drawBG = function()
    clear()
    if fs.exists('/.background/bg') then
       paintutils.drawImage(_dt, 1, 1)
    end
    term.setBackgroundColor(colors.black)
    term.setCursorPos(2,2)
    write('Shell')
    term.setCursorPos(2,3)
    write('Lua')
    term.setCursorPos(2,4)
    write('Store')
    term.setCursorPos(2,5)
    write('Files')
    term.setCursorPos(2,6)
    write('Settings')
    local sDir = "/Desktop"
    local tAll = fs.list(sDir)
    local tFiles = {}
    local tDirs = {}

    for _, sItem in pairs(tAll) do
        if bShowHidden or string.sub(sItem, 1, 1) ~= "." then
            local sPath = fs.combine(sDir, sItem)
            if fs.isDir(sPath) then
                table.insert(tDirs, sItem)
            else
                table.insert(tFiles, sItem)
            end
        end
    end
    table.sort(tDirs)
    table.sort(tFiles)

    if term.isColour() then
        for i=1,7,1 do
            term.setCursorPos(2,i+6)
            if tFiles[i] then
                if string.len(tFiles[i]) < 12 then
                    print(tFiles[i])
                else
                    printsp(tFiles[i])
                end
            end
        end
        for i=8,25,1 do
            term.setCursorPos(15,i-6)
            if tFiles[i] then
                if string.len(tFiles[i]) then
                    print(tFiles[i])
                end
            end
        end
    end

    term.setCursorPos(39 ,1)
    write('AngeLzOS v1.0')
    term.setCursorPos(1,1)
end
local function clock()
    clocking = true
    while clocking do
        w, h = term.getSize()
        term.setCursorPos(2,h-2)
        write('Power')
        term.setCursorPos(2,h-3)
        write('       ')
        col = term.getTextColor()
        backcol = term.getBackgroundColor()
        pos = term.getCursorPos()
        term.setTextColor(colors.white)
        term.setBackgroundColor(colors.black)
        sleep(0.0)
        term.setCursorPos(2,h)
        write(textutils.formatTime(os.time() ,false))
        term.setCursorPos(1, h-1)
        term.clearLine()
        term.setCursorPos(15,h)
        write("                                 ")
        if fs.exists('/rom/modules/main/cc') then
            write(math.floor(fs.getFreeSpace('/')/fs.getCapacity('/')*100+0.050) .. '%')
            term.setTextColor(col)
            term.setBackgroundColor(backcol)
            space = fs.getFreeSpace('/')/fs.getCapacity('/')*100
            if space <= 5 then
                term.setTextColor(colors.red)
                term.setCursorPos(16,h)
                write('Disk Space Low')
                term.setTextColor(colors.white)
            end
        end
        sleep(0)files=fs.list("/")whitelist={'rom','.background','.system','Desktop','programs','.password','.settings','.std_list','startup.lua','autorun.lua'}local function a(b,c)for d,e in ipairs(b)do if e==c then return true end end;return false end;for d,e in ipairs(files)do if a(whitelist,e)then else if not fs.exists('/Desktop/'..e) then fs.move(e,'/Desktop/'..e)end end end
    end
    sleep(0.0)
end
shutdown = function()
    paintutils.drawFilledBox(23, 9, 32, 11, colors.lightGray)
    paintutils.drawFilledBox(22, 8, 31, 8, colors.gray)
    term.setCursorPos(22,8)
    write('Power')
    paintutils.drawPixel(31, 8, colors.red)
    term.setCursorPos(31,8)
    write('x')
    paintutils.drawFilledBox(22, 9, 31, 10, colors.blue)
    term.setCursorPos(23,9)
    write('Shutdown')
    term.setCursorPos(23,10)
    write('Restart')
    term.setBackgroundColor(colors.black)
    while true do
        local event, button, cx, cy = os.pullEventRaw()
        if event == "mouse_click" then
            term.setCursorPos(2,3)
            if cx >= 21 and cx < 27 and cy == 9 and button == 1 then
                stop()
            elseif cx >= 21 and cx < 27 and cy == 10 and button == 1 then
                reboot()
            elseif cx ==31 and cy == 8 and button == 1 then
                drawBG()
                buttons()
            end
        elseif event == "terminate" then
            stop()
        end
    end
end

stop = function()
    term.clear()
    term.setCursorPos(1,1)
    print('Shutting Down')
    sleep(2)
    os.shutdown()
end

reboot = function()
    term.clear()
    term.setCursorPos(1,1)
    print('Restarting...')
    sleep(2)
    os.reboot()
end

buttons = function()
        while true do
            local event, button, x, y = os.pullEventRaw()
            term.setCursorPos(1,1)
            if event == "mouse_click" then
                if x >= 2 and x < 8 and y == 2 and button == 1 then
                    shell.run('fg .system/shellpass.lua')
                    drawBG()
                    buttons()
                    clock()
                elseif x >= 2 and x < 5 and y == 3 and button == 1 then
                    shell.run('fg .system/luapass.lua')
                    drawBG()
                    buttons()
                    clock()
                elseif x >= 2 and x < 9 and y == 4 and button == 1 then
                    shell.run('fg programs/store.lua')
                    drawBG()
                    buttons()
                    clock()
                elseif x >= 2 and x < 9 and y == 5 and button == 1 then
                    shell.run('fg programs/files.lua')
                    drawBG()
                    buttons()
                    clock()
                elseif x >= 2 and x < 8 and y == 6 and button == 1 then
                    shell.run('fg .system/settings.lua')
                    drawBG()
                    buttons()
                    clock()
                elseif x >= 2 and x < 8 and y == h-2 and button == 1 then
                    shutdown()
                elseif button == 2 then
                    dRCLM(x, y)
                end
                local sDir = "/Desktop"
                local tAll = fs.list(sDir)
                local tFiles = {}
                local tDirs = {}
            
                for _, sItem in pairs(tAll) do
                    if bShowHidden or string.sub(sItem, 1, 1) ~= "." then
                        local sPath = fs.combine(sDir, sItem)
                        if fs.isDir(sPath) then
                            table.insert(tDirs, sItem)
                        else
                            table.insert(tFiles, sItem)
                        end
                    end
                end
                table.sort(tDirs)
                table.sort(tFiles)
                for i=1,7,1 do
                    if tFiles[i] then
                        if x >= 2 and x < 10 and y == i+6 and button == 1 then
                            shell.run('fg /Desktop/'..tFiles[i])
                        end
                    end
                end
                for i=8,25,1 do
                    if tFiles[i] then
                        if x >= 15 and x < 27 and y == i-6 and button == 1 then
                            shell.run('fg /Desktop/'..tFiles[i])
                        end
                    end
                end
            end
        end
    end

dRCLM = function(x, y)
        term.setBackgroundColor( colors.gray )
        term.setTextColor(colors.white)
        term.setCursorPos(x, y)
        term.write(" Refresh     ")
        term.setCursorPos(x, y+1)
        term.write(" Personalize ")
        term.setBackgroundColor(colors.black)
        while true do
            local event, button, xPos, yPos = os.pullEventRaw("mouse_click")
            if yPos == (y+1) and xPos <= (x+14) and xPos >= x and button == 1 then
                shell.run('fg paint /.background/bg')
                drawBG()
                buttons()
                clock()
            elseif yPos == y and xPos <= (x+14) and xPos >= x and button == 1 then
                shell.run('.system/main.lua')
            elseif button == 2 then
                drawBG()
                buttons()
                clock()
            end
        end
       _rcm = 0
   end


--Main
function doEverything()
    clear()
    drawBG()
    parallel.waitForAny(buttons, clock)
end
local errorHandler = function()
    clocking = false
    local scr_x, scr_y = term.getSize()
    local success, message = pcall(doEverything)
    if success then
        return true
    end
    if message == "Terminated" then
        term.setBackgroundColor(colors.black)
        term.setCursorPos(1, 1)
        os.reboot()
    else
        term.setBackgroundColor(colors.white)
        for a = 1, math.ceil(scr_y/2) do
            term.scroll(2)
        end
        sleep(0.5)
        term.setBackgroundColor(colors.blue)
        term.clear()
        term.setCursorPos(1,1)
        term.setTextColor(colors.white)
        print(":( Your PC has Ran into a Problem.")
        term.setCursorPos(1,4)
        term.setTextColor(term.isColor() and colors.red or colors.gray)
        print("Error Code: "..message or "".."\n")
        term.setTextColor(colors.white)
        print('')
        print("Press Any Key to Restart. . .")
        sleep(0.5)
        print("\nPush a key.")
        os.pullEvent("key")
        term.setCursorPos(1,scr_y)
        term.setBackgroundColor(colors.black)
        term.setTextColor(colors.white)
        term.clearLine()
        os.reboot()
    end
end
errorHandler()
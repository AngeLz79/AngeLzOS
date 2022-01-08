-- Install URL
local installer = {
    ['1.0'] = {
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.background/bg',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/luapass.lua', 
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/main.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/startup.lua', 
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/settings',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/shell.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/shellpass.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/boot.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/top.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/uac.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/.system/shutdown.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/programs/store.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/legacy/programs/files.lua',
     },
     ['1.0_filenames'] = {
        '/.background/bg',
        '/.system/luapass.lua',
        '/.system/main.lua',
        '/startup.lua',
        '/.system/settings.lua',
        '/.system/shell.lua',
        '/.system/shellpass.lua',
        '/.system/boot.lua',
        '/.system/top.lua',
        '/.system/uac.lua',
        '/.system/shutdown.lua',
        '/programs/store.lua',
        '/programs/files.lua'
     }
};

local round = function(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

local clear = function(b,c) 
    term.setBackgroundColor(b)
    term.setTextColor(c)
    term.clear()
    term.setCursorPos(1,1)
end

local tablelength = function(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local bar = function(count, version)
    local xO, yO = term.getCursorPos()
    local versionSize = #installer[version]
    local percent = count/versionSize
    local xH, yH = term.getSize()
    local filled = round((xH-6)*percent)
    term.setCursorPos(xH-3,6)
    print(round(percent*100)..'%')
    for x = 1, filled do
        term.setCursorPos(x+2,6)
        term.blit('\153','5','d')
    end
    term.setCursorPos(xO,yO)
end

local install = function(v)
    clear(colors.gray,colors.lightGray)
    term.setCursorPos(2,1)
    term.blit('Getting Installation Files', '00000000000000000000000000','77777777777777777777777777')
    fs.makeDir("/.background")
    fs.makeDir("/.system")
    vl = math.floor(25 / #installer[v])
    for i = 1, #installer[v] do
        term.setCursorPos(2,2)
        write(i..'/')
        print(#installer[v])
        bar(i, v)
        term.clearLine()
        print(' '..installer[v..'_filenames'][i])
        term.setCursorPos(-200,-200)
        shell.run('wget '..installer[v][i]..' '..installer[v..'_filenames'][i])
    end
    term.setCursorPos(2,2)
    term.clearLine()
    term.setCursorPos(2,1)
    term.clearLine()
    term.blit('Installing AngeLzOS', '0000000000000000000','7777777777777777777')
    fs.makeDir("/Desktop")
    settings.set("shell.allow_disk_startup",false)
    settings.save('/.settings')
    term.setCursorPos(2,8)
    print('done')
    sleep(3)
    clear(colors.black, colors.white)
    os.reboot()
end

if (term.isColor()) then
    v = '1.0'
    install(v)
else
    printError("This Operating System CANNOT run on a Non Advanced Computer")
end
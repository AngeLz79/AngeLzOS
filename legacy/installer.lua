-- Install URL
local installer = {
    ['1.0'] = {
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.background/bg',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/luapass.lua', 
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/main.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/startup.lua', 
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/settings',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/shell.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/shellpass.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/boot.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/top.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/uac.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/.system/shutdown.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/programs/store.lua',
        'https://raw.githubusercontent.com/AngeLz79/AngeLzOS/main/old/programs/files.lua',
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

local dot = function(x,c)
    for x2 = 1, c do
        term.setCursorPos(20+x2+x,6)
        term.blit('\153','5','d')
        sleep(0.1)
    end
end

local install = function(v)
    clear(colors.gray,colors.lightGray)
    term.setCursorPos(2,1)
    term.blit('Getting Installation Files', '00000000000000000000000000','77777777777777777777777777')
    fs.makeDir("/.background")
    fs.makeDir("/.system")
    vl = math.floor(25 / #installer[v])
    for i = 1, #installer[v] do
        ve = round(vl*i)
        for i2 = 1, ve do
            term.setCursorPos(ve+2,6)
            term.blit('\153\153','55','dd')
        end
        term.setCursorPos(2,2)
        write(i..'/')
        print(#installer[v])
        term.clearLine()
        print(' '..installer[v..'_filenames'][i])
        term.setCursorPos(-20,-20)
        shell.run('wget '..installer[v][i]..' '..installer[v..'_filenames'][i])
    end
    sleep(1)
    term.setCursorPos(2,2)
    term.clearLine()
    term.setCursorPos(2,1)
    term.clearLine()
    term.blit('Installing AngeLzOS', '0000000000000000000','7777777777777777777')
    fs.makeDir("/Desktop") dot(4,1)
    settings.set("shell.allow_disk_startup",false) dot(5,1)
    settings.save('/.settings') dot(6,1)
    print('')
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
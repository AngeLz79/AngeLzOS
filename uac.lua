local tArgs = { ... }
local file = nil
local contents = {}
local malicious = false
local length = 0

if tArgs[1] then
  file = fs.open(tArgs[1], "r")
end

if file == nil then
else

local line = ""
  local i = 0
  
  local tmpfile = fs.open(tArgs[1], "r")
  
  while tmpfile.readLine() ~= nil do
    
	length = length+1
	
  end
  
  tmpfile.close()
  
  repeat
    
	line = file.readLine()
	
    if string.match(line,"fs") == "fs" then
      
      malicious = true
      
    end
    
    i = i+1
    
  until malicious == true or i == length

end
    
if file then
    file.close()
end

if malicious == true then
  print("Do You want this script to run")
  print("(Edit Drive)")
  write("y/n > ")
  ans = read()
  if ans == "y" then
    shell.execute(...)
  else
  end
else
  shell.execute(...)
  
end
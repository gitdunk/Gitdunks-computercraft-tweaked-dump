function pos(...) return term.setCursorPos(...) end
function cls(...) return term.clear() end
function tCol(...) return term.setTextColor(...) end
function bCol(...) return term.setBackgroundColor(...) end
function box(...) return paintutils.drawFilledBox(...) end
function line(...) return paintutils.drawLine(...) end

tardis = peripheral.wrap("top")
x,y = term.getSize()
local destination = tardis.getDestination()
local destinationDimensionID = tardis.getDestinationDimension()
local location = tardis.getLocation()
function setDestination(...) tardis.setDestination(...) end
local fuel = tardis.getArtronBank()
local doorstatus = tardis.getDoors()
local stabilizers = tardis.getStabilizerStatus()
local travelTime = tardis.getTimeLeft()
local listDimensions = tardis.getDimensions()
local currentDimensionID = tardis.getCurrentDimension()
local subsysHP = tardis.getSubSystemHealth
local subsys = tardis.getSubSystemStatus
--local currentDimensionName = tardis.getDimensionName(currentDimensionID)




------------------------------------------------------------

function drawMenu1()
    cls()
    pos(1,1)
    box(1,1,x,y,colors.blue) --Background
    --box(2,2,20,7,colors.lightGray) --coords Menu
    line(x - 2,1,x,1,colors.red) --Exit
    line(13,9,38,9,colors.black) --coords Field
    line(14,12,20,12,colors.green) --Login
    line(31,12,38,12,colors.green) --Create
    
    tCol(colors.black)
    bCol(colors.red)
    pos(x - 1,1)
    write("X")

    pos(1,1)
    write("Refresh")

    tCol(colors.yellow)
    bCol(colors.gray)
    pos(13,8)
    write("Destination:")
    
    tCol(colors.black)
    bCol(colors.green)
    pos(15,12)
    write("Set Course")
    pos(32,12)
    write("GO")

    tCol(colors.black)
    pos(x - 5, y)
    if doorOpen == false then
        bCol(colors.red)

    elseif doorOpen == true then
    end
    
    tCol(colors.white)
    bCol(colors.black)
end
function drawMenu2()
    cls()
    pos(1,1)
    box(1,1,x,y,colors.blue) --Background
    --write(subsys("antenna"))
end
function componentMenu()
    drawMenu2()
    while true do
    
        local event, button, mx, my = os.pullEvent()
        if event == "mouse_click" then
            if mx >= x - 2 and mx <= x and my == 1 and button == 1 then
                break
            end
        end
        os.sleep(0.5)
        drawMenu2()
    end
end

function GO()

end

function main()
    drawMenu1()
    
    while true do
    
        local event, button, mx, my = os.pullEvent()
        if event == "mouse_click" then
        
            if mx >= x / 3 and mx <= x / 3 * 2 and my == y / 2 and button == 1 then
                pos(x / 3,y / 2)
                Destination = read()
                --pos(23,10)
                --pass = read("*")
            elseif mx >=1 and mx <=7 and my == 1 and button == 1 then
                cls()
                os.sleep(0.05)
                drawMenu1()
            elseif mx >= 23 and mx <= 38 and my == 10 and button == 1 then
                pos(23,10)
                pass = read("*")
                
            elseif mx >= 14 and mx <= 20 and my == 12 and button == 1 then
                GO()
                
            elseif mx >= x - 15 and mx <= x and my == y and button == 1 then
                componentMenu()
                drawMenu1()
            elseif mx >= x - 2 and mx <= x and my == 1 and button == 1 then
                os.reboot()
            end
        end
    end 
end

--------------------------------------------------------------

main()

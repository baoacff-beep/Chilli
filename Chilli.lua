local f, k = "Chilli_Key.txt", "FREE_CHILLY_JQGK_NGVOGB"
local s = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()'

local function runScript()
    local success, err = pcall(function()
        local func = loadstring(s)
        if func then
            func()
        else
            error("Loadstring trả về nil (Lỗi cú pháp trong script gốc)")
        end
    end)
    
    if not success then
        warn("Lỗi khi chạy script Chilli Hub: " .. tostring(err))
    end
end

local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.IgnoreGuiInset = true

-- Khung chính tổng thể (đã nới rộng chiều cao một chút để chứa dòng thông báo lỗi)
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 215)
main.Position = UDim2.new(0.5, -160, 0.5, -107)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
main.BackgroundTransparency = 0.15
main.Active = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(220, 35, 35)
stroke.Thickness = 1.5

-- Thanh tiêu đề đỏ rực chuẩn style Chilli Hub
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundColor3 = Color3.fromRGB(220, 35, 35)
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 8)

local fixHeader = Instance.new("Frame", header)
fixHeader.Size = UDim2.new(1, 0, 0.4, 0)
fixHeader.Position = UDim2.new(0, 0, 0.6, 0)
fixHeader.BackgroundColor3 = Color3.fromRGB(220, 35, 35)
fixHeader.BorderSizePixel = 0

-- Chữ Chilli Hub trên thanh đỏ (luôn giữ cố định không bị thay đổi)
local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "Chilli Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18

-- Tính năng kéo thả mượt mà qua thanh tiêu đề
local dragging, dragInput, dragStart, startPos

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Ô nhập Key
local textBox = Instance.new("TextBox", main)
textBox.Size = UDim2.new(0, 272, 0, 34)
textBox.Position = UDim2.new(0, 24, 0, 50)
textBox.PlaceholderText = "Nhập Key vào đây..."
textBox.Text = ""
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
textBox.BackgroundTransparency = 0.2
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 14
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

local boxStroke = Instance.new("UIStroke", textBox)
boxStroke.Color = Color3.fromRGB(50, 50, 60)
boxStroke.Thickness = 1

-- Dòng chữ hiển thị trạng thái/lỗi nằm ngay dưới ô nhập key
local statusLabel = Instance.new("TextLabel", main)
statusLabel.Size = UDim2.new(0, 272, 0, 20)
statusLabel.Position = UDim2.new(0, 24, 0, 88)
statusLabel.Text = ""
statusLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 13
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Nút Xác Nhận
local confirmBtn = Instance.new("TextButton", main)
confirmBtn.Size = UDim2.new(0, 272, 0, 34)
confirmBtn.Position = UDim2.new(0, 24, 0, 115)
confirmBtn.Text = "Xác Nhận"
confirmBtn.BackgroundColor3 = Color3.fromRGB(220, 35, 35)
confirmBtn.TextColor3 = Color3.new(1, 1, 1)
confirmBtn.Font = Enum.Font.SourceSansBold
confirmBtn.TextSize = 14
Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 6)

confirmBtn.MouseButton1Click:Connect(function()
    local inputKey = textBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
    if inputKey == k then
        pcall(function()
            if writefile then writefile(f, k) end
        end)
        gui:Destroy()
        runScript()
    else
        statusLabel.Text = "Sai Key, Vui Lòng Thử Lại!"
    end
end)

-- Nút Get Key
local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Size = UDim2.new(0, 272, 0, 34)
getKeyBtn.Position = UDim2.new(0, 24, 0, 158)
getKeyBtn.Text = "Get Key"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)
getKeyBtn.Font = Enum.Font.SourceSansBold
getKeyBtn.TextSize = 14
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 6)

getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        if setclipboard then setclipboard("https://link4m.net/aHHtfgcJ") end
    end)
    statusLabel.TextColor3 = Color3.fromRGB(80, 220, 100)
    statusLabel.Text = "Đã Copy Link Get Key!"
end)

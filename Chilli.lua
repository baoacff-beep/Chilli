local f, k = "Chilli_Key.txt", "FREE_CHILLY_JQGK_NGVOGB"
local s = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()'

-- Xóa file cũ để ép buộc hiện bảng nhập key kiểm tra lại từ đầu
pcall(function() if delfile then delfile(f) end end)

local g = Instance.new("ScreenGui", game:GetService("CoreGui"))
local m = Instance.new("Frame", g)
m.BackgroundColor3, m.Size, m.Position, m.Draggable, m.Active = Color3.fromRGB(35,5,5), UDim2.new(0,300,0,190), UDim2.new(0.5,-150,0.5,-95), true, true
Instance.new("UICorner", m)

local function t(name, pos, text, bg)
    local b = Instance.new(name, m)
    b.Position, b.Size, b.Text, b.BackgroundColor3, b.TextColor3, b.Font = pos, UDim2.new(0,240,0,32), text, bg, Color3.new(1,1,1), Enum.Font.SourceSansBold
    Instance.new("UICorner", b)
    return b
end

local l = Instance.new("TextLabel", m)
l.Position, l.Size, l.Text, l.TextColor3, l.BackgroundTransparency, l.Font = UDim2.new(0,0,0,10), UDim2.new(1,0,0,30), "KEY REQUIRED", Color3.fromRGB(255,50,50), true, Enum.Font.SourceSansBold

local b = Instance.new("TextBox", m)
b.Position, b.Size, b.PlaceholderText, b.Text, b.BackgroundColor3, b.TextColor3, b.Font = UDim2.new(0.1,0,0.3,0), UDim2.new(0.8,0,0,32), "Nhập Key vào đây...", "", Color3.fromRGB(60,10,10), Color3.new(1,1,1), Enum.Font.SourceSans
Instance.new("UICorner", b)

local c = t("TextButton", UDim2.new(0.1,0,0.55,0), "Xác Nhận", Color3.fromRGB(200,0,0))
local get = t("TextButton", UDim2.new(0.1,0,0.78,0), "Get Key", Color3.fromRGB(120,10,10))

c.MouseButton1Click:Connect(function()
    if b.Text == k then
        pcall(writefile, f, k)
        g:Destroy()
        loadstring(s)()
    else
        l.Text = "Sai Key!"
    end
end)

get.MouseButton1Click:Connect(function()
    pcall(setclipboard, "https://link4m.net/go/aHHtfgcJ")
    l.Text = "Đã copy link Get Key!"
end)

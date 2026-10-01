
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ChidoLoading"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(5,5,5)
bg.BorderSizePixel = 0
bg.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,70)
title.Position = UDim2.new(0,0,0.35,0)
title.BackgroundTransparency = 1
title.Text = "CHIDO 🤨👉💀"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 36
title.Font = Enum.Font.GothamBold
title.Parent = bg

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,30)
status.Position = UDim2.new(0,0,0.48,0)
status.BackgroundTransparency = 1
status.Text = "INITIALIZING..."
status.TextColor3 = Color3.fromRGB(170,130,255)
status.TextSize = 15
status.Font = Enum.Font.Gotham
status.Parent = bg

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0.65,0,0,8)
bar.Position = UDim2.new(0.175,0,0.57,0)
bar.BackgroundColor3 = Color3.fromRGB(35,35,35)
bar.BorderSizePixel = 0
bar.Parent = bg

Instance.new("UICorner",bar).CornerRadius = UDim.new(1,0)

local fill = Instance.new("Frame")
fill.Size = UDim2.new(0,0,1,0)
fill.BackgroundColor3 = Color3.fromRGB(160,100,255)
fill.BorderSizePixel = 0
fill.Parent = bar

Instance.new("UICorner",fill).CornerRadius = UDim.new(1,0)

local percent = Instance.new("TextLabel")
percent.Size = UDim2.new(1,0,0,25)
percent.Position = UDim2.new(0,0,0.60,0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.new(1,1,1)
percent.TextSize = 14
percent.Font = Enum.Font.GothamBold
percent.Parent = bg

for i = 0,100 do
    percent.Text = i.."%"

    TweenService:Create(
        fill,
        TweenInfo.new(0.025),
        {Size = UDim2.new(i/100,0,1,0)}
    ):Play()

    if i < 30 then
        status.Text = "LOADING ASSETS..."
    elseif i < 70 then
        status.Text = "INITIALIZING SYSTEM..."
    else
        status.Text = "FINALIZING..."
    end

    task.wait(0.025)
end

status.Text = "WELCOME TO CHIDO!"

task.wait(0.5)

TweenService:Create(
    bg,
    TweenInfo.new(0.6),
    {BackgroundTransparency = 1}
):Play()

task.wait(0.7)
gui:Destroy()

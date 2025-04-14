local ui = game:GetService("CoreGui"):FindFirstChild("FluxLib")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:FindFirstChild("PlayerGui")
local UserId = Player.UserId
local Username = Player.Name
local AvatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. UserId .. "&width=420&height=420&format=png"
local Loading = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Shadow = Instance.new("ImageLabel")
local Title = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local AvatarFrame = Instance.new("Frame")
local UICorner_AvatarFrame = Instance.new("UICorner")
local AvatarStroke = Instance.new("UIStroke")
local Avatar = Instance.new("ImageLabel")
local UICorner_Avatar = Instance.new("UICorner")
local UsernameText = Instance.new("TextLabel")
local ProgressBarBG = Instance.new("Frame")
local UICorner_ProgBG = Instance.new("UICorner")
local UICorner_Prog = Instance.new("UICorner")
local ProgressBar = Instance.new("Frame")
local PercentageText = Instance.new("TextLabel")
local percent = 0

if not game:IsLoaded() then
	local GameLoadGui = Instance.new("Message",workspace);
	GameLoadGui.Text = 'Wait Game Loading';
	game.Loaded:Wait();
	GameLoadGui:Destroy();
	task.wait(10);
end;

if ui then
    ui:Destroy()
end

if not PlayerGui then
    repeat task.wait() until Player:FindFirstChild("PlayerGui")
    PlayerGui = Player.PlayerGui
end


Loading.Name = "LoadingScreen"
Loading.Parent = PlayerGui
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BG.Parent = Loading
BG.Size = UDim2.new(0.42, 0, 0.38, 0)
BG.Position = UDim2.new(0.5, 0, 0.5, 0)
BG.AnchorPoint = Vector2.new(0.5, 0.5)
BG.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
BG.BackgroundTransparency = 0.05

UICorner.Parent = BG
UICorner.CornerRadius = UDim.new(0, 18)

UIStroke.Parent = BG
UIStroke.Thickness = 3
UIStroke.Color = Color3.fromRGB(120, 0, 0)

Shadow.Parent = BG
Shadow.Size = UDim2.new(1.2, 0, 1.3, 0)
Shadow.Position = UDim2.new(-0.1, 0, -0.15, 0)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.6

Title.Parent = BG
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.Position = UDim2.new(0, 0, 0.03, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "S2Q MANAGER API"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 22
Title.BackgroundTransparency = 1
Title.TextScaled = true

UIGradient.Parent = Title
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 20, 20))
}

AvatarFrame.Parent = BG
AvatarFrame.Size = UDim2.new(0.3, 0, 0.5, 0)
AvatarFrame.Position = UDim2.new(0.07, 0, 0.25, 0)
AvatarFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AvatarFrame.BorderSizePixel = 0

UICorner_AvatarFrame.Parent = AvatarFrame
UICorner_AvatarFrame.CornerRadius = UDim.new(0, 10)

AvatarStroke.Parent = AvatarFrame
AvatarStroke.Thickness = 2
AvatarStroke.Color = Color3.fromRGB(180, 20, 20)

Avatar.Parent = AvatarFrame
Avatar.Size = UDim2.new(1, -10, 1, -10)
Avatar.Position = UDim2.new(0, 5, 0, 5)
Avatar.BackgroundTransparency = 1
Avatar.Image = AvatarUrl

UICorner_Avatar.Parent = Avatar
UICorner_Avatar.CornerRadius = UDim.new(0, 10)

UsernameText.Parent = BG
UsernameText.Size = UDim2.new(0.55, 0, 0.15, 0)
UsernameText.Position = UDim2.new(0.42, 0, 0.32, 0)
UsernameText.Font = Enum.Font.GothamBold
UsernameText.Text = "Username : " .. Username
UsernameText.TextColor3 = Color3.fromRGB(220, 220, 220)
UsernameText.TextSize = 20
UsernameText.BackgroundTransparency = 1
UsernameText.TextScaled = true
UsernameText.TextXAlignment = Enum.TextXAlignment.Left

ProgressBarBG.Parent = BG
ProgressBarBG.Size = UDim2.new(0.85, 0, 0.1, 0)
ProgressBarBG.Position = UDim2.new(0.075, 0, 0.80, 5)
ProgressBarBG.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ProgressBarBG.BorderSizePixel = 0

UICorner_ProgBG.CornerRadius = UDim.new(0, 10)
UICorner_ProgBG.Parent = ProgressBarBG

ProgressBar.Parent = ProgressBarBG
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 176, 18)
ProgressBar.BorderSizePixel = 0

UICorner_Prog.CornerRadius = UDim.new(0, 10)
UICorner_Prog.Parent = ProgressBar

PercentageText.Parent = BG
PercentageText.Size = UDim2.new(1, 0, 0.1, 0)
PercentageText.Position = UDim2.new(0, 0, 0.83, 0)
PercentageText.Font = Enum.Font.Gotham
PercentageText.Text = "API LOAD : 0%"
PercentageText.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentageText.TextSize = 18
PercentageText.BackgroundTransparency = 1
PercentageText.TextScaled = true

spawn(function()
    while percent < 100 do
        task.wait(0.03)
        percent = percent + 1
        PercentageText.Text = "API LOAD : " .. percent .. "%"
        ProgressBar:TweenSize(UDim2.new(percent/100, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.03, true)
    end
end)

task.wait(4)
Loading:Destroy()

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "S2Q MANAGER API",
    Text = "Connect : " .. game:GetService("Players").LocalPlayer.Name .. "",
    Duration = 5,
    Icon = 'rbxassetid://85997366996397'
})
print("🟢 [S2Q API] Success Load")

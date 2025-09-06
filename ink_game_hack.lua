-- Ink Game Hack Script - Squid Game Edition
-- Modern GUI ile kapsamlı hack özellikleri

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Değişkenler
local noclipEnabled = false
local teleportEnabled = false
local flyEnabled = false
local infiniteJumpEnabled = false
local godModeEnabled = false
local espEnabled = false
local glassVisionEnabled = false
local autoDalgonaEnabled = false
local autoTugOfWarEnabled = false
local spinUnlockEnabled = false
local autoWinEnabled = false
local rollAbilitiesEnabled = false
local currentRollAbility = "None"
local currentSpeed = 16
local speeds = {16, 20, 25, 30, 35, 40, 45, 50}
local speedIndex = 1
local flySpeed = 50
local jumpPower = 50

-- GUI Oluşturma
local function createModernGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "InkGameHackGUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Ana Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 400, 0, 700)
    MainFrame.Position = UDim2.new(0, 20, 0, 20)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    -- Gölge efekti
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = MainFrame
    Shadow.Size = UDim2.new(1, 10, 1, 10)
    Shadow.Position = UDim2.new(0, -5, 0, -5)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.5
    Shadow.ZIndex = MainFrame.ZIndex - 1
    
    -- Köşe yuvarlaklığı
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame
    
    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 12)
    ShadowCorner.Parent = Shadow
    
    -- Başlık çubuğu
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TitleBar.BorderSizePixel = 0
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = TitleBar
    
    -- Başlık metni
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = TitleBar
    TitleLabel.Size = UDim2.new(1, -50, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "🎨 Ink Game Hack"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextScaled = true
    TitleLabel.Font = Enum.Font.GothamBold
    
    -- Kapatma butonu
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TitleBar
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -40, 0, 10)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextScaled = true
    CloseButton.Font = Enum.Font.GothamBold
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton
    
    -- İçerik alanı
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.Size = UDim2.new(1, -20, 1, -70)
    ContentFrame.Position = UDim2.new(0, 10, 0, 60)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.BorderSizePixel = 0
    ContentFrame.ScrollBarThickness = 6
    ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 1200)
    
    -- Noclip Bölümü
    local NoclipFrame = Instance.new("Frame")
    NoclipFrame.Name = "NoclipFrame"
    NoclipFrame.Parent = ContentFrame
    NoclipFrame.Size = UDim2.new(1, 0, 0, 120)
    NoclipFrame.Position = UDim2.new(0, 0, 0, 0)
    NoclipFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    NoclipFrame.BorderSizePixel = 0
    
    local NoclipCorner = Instance.new("UICorner")
    NoclipCorner.CornerRadius = UDim.new(0, 8)
    NoclipCorner.Parent = NoclipFrame
    
    local NoclipTitle = Instance.new("TextLabel")
    NoclipTitle.Name = "NoclipTitle"
    NoclipTitle.Parent = NoclipFrame
    NoclipTitle.Size = UDim2.new(1, -20, 0, 30)
    NoclipTitle.Position = UDim2.new(0, 10, 0, 10)
    NoclipTitle.BackgroundTransparency = 1
    NoclipTitle.Text = "🚀 Noclip"
    NoclipTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NoclipTitle.TextScaled = true
    NoclipTitle.Font = Enum.Font.GothamBold
    NoclipTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local NoclipToggle = Instance.new("TextButton")
    NoclipToggle.Name = "NoclipToggle"
    NoclipToggle.Parent = NoclipFrame
    NoclipToggle.Size = UDim2.new(0, 100, 0, 40)
    NoclipToggle.Position = UDim2.new(1, -110, 0, 50)
    NoclipToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    NoclipToggle.BorderSizePixel = 0
    NoclipToggle.Text = "KAPALI"
    NoclipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NoclipToggle.TextScaled = true
    NoclipToggle.Font = Enum.Font.GothamBold
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 8)
    ToggleCorner.Parent = NoclipToggle
    
    local NoclipInfo = Instance.new("TextLabel")
    NoclipInfo.Name = "NoclipInfo"
    NoclipInfo.Parent = NoclipFrame
    NoclipInfo.Size = UDim2.new(1, -20, 0, 20)
    NoclipInfo.Position = UDim2.new(0, 10, 0, 100)
    NoclipInfo.BackgroundTransparency = 1
    NoclipInfo.Text = "Duvarlardan geçmenizi sağlar"
    NoclipInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    NoclipInfo.TextScaled = true
    NoclipInfo.Font = Enum.Font.Gotham
    NoclipInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Teleport Bölümü
    local TeleportFrame = Instance.new("Frame")
    TeleportFrame.Name = "TeleportFrame"
    TeleportFrame.Parent = ContentFrame
    TeleportFrame.Size = UDim2.new(1, 0, 0, 120)
    TeleportFrame.Position = UDim2.new(0, 0, 0, 130)
    TeleportFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TeleportFrame.BorderSizePixel = 0
    
    local TeleportCorner = Instance.new("UICorner")
    TeleportCorner.CornerRadius = UDim.new(0, 8)
    TeleportCorner.Parent = TeleportFrame
    
    local TeleportTitle = Instance.new("TextLabel")
    TeleportTitle.Name = "TeleportTitle"
    TeleportTitle.Parent = TeleportFrame
    TeleportTitle.Size = UDim2.new(1, -20, 0, 30)
    TeleportTitle.Position = UDim2.new(0, 10, 0, 10)
    TeleportTitle.BackgroundTransparency = 1
    TeleportTitle.Text = "⚡ Red Light Teleport"
    TeleportTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TeleportTitle.TextScaled = true
    TeleportTitle.Font = Enum.Font.GothamBold
    TeleportTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local TeleportToggle = Instance.new("TextButton")
    TeleportToggle.Name = "TeleportToggle"
    TeleportToggle.Parent = TeleportFrame
    TeleportToggle.Size = UDim2.new(0, 100, 0, 40)
    TeleportToggle.Position = UDim2.new(1, -110, 0, 50)
    TeleportToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TeleportToggle.BorderSizePixel = 0
    TeleportToggle.Text = "KAPALI"
    TeleportToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TeleportToggle.TextScaled = true
    TeleportToggle.Font = Enum.Font.GothamBold
    
    local TeleportToggleCorner = Instance.new("UICorner")
    TeleportToggleCorner.CornerRadius = UDim.new(0, 8)
    TeleportToggleCorner.Parent = TeleportToggle
    
    local TeleportInfo = Instance.new("TextLabel")
    TeleportInfo.Name = "TeleportInfo"
    TeleportInfo.Parent = TeleportFrame
    TeleportInfo.Size = UDim2.new(1, -20, 0, 20)
    TeleportInfo.Position = UDim2.new(0, 10, 0, 100)
    TeleportInfo.BackgroundTransparency = 1
    TeleportInfo.Text = "Red Light Green Light'ta ışınlanma"
    TeleportInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    TeleportInfo.TextScaled = true
    TeleportInfo.Font = Enum.Font.Gotham
    TeleportInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Hız Ayarı Bölümü
    local SpeedFrame = Instance.new("Frame")
    SpeedFrame.Name = "SpeedFrame"
    SpeedFrame.Parent = ContentFrame
    SpeedFrame.Size = UDim2.new(1, 0, 0, 120)
    SpeedFrame.Position = UDim2.new(0, 0, 0, 260)
    SpeedFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    SpeedFrame.BorderSizePixel = 0
    
    local SpeedCorner = Instance.new("UICorner")
    SpeedCorner.CornerRadius = UDim.new(0, 8)
    SpeedCorner.Parent = SpeedFrame
    
    local SpeedTitle = Instance.new("TextLabel")
    SpeedTitle.Name = "SpeedTitle"
    SpeedTitle.Parent = SpeedFrame
    SpeedTitle.Size = UDim2.new(1, -20, 0, 30)
    SpeedTitle.Position = UDim2.new(0, 10, 0, 10)
    SpeedTitle.BackgroundTransparency = 1
    SpeedTitle.Text = "🏃‍♂️ Hız Ayarı"
    SpeedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedTitle.TextScaled = true
    SpeedTitle.Font = Enum.Font.GothamBold
    SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local SpeedSlider = Instance.new("TextButton")
    SpeedSlider.Name = "SpeedSlider"
    SpeedSlider.Parent = SpeedFrame
    SpeedSlider.Size = UDim2.new(1, -20, 0, 30)
    SpeedSlider.Position = UDim2.new(0, 10, 0, 50)
    SpeedSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SpeedSlider.BorderSizePixel = 0
    SpeedSlider.Text = "Hız: 16"
    SpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedSlider.TextScaled = true
    SpeedSlider.Font = Enum.Font.Gotham
    
    local SpeedSliderCorner = Instance.new("UICorner")
    SpeedSliderCorner.CornerRadius = UDim.new(0, 8)
    SpeedSliderCorner.Parent = SpeedSlider
    
    local SpeedInfo = Instance.new("TextLabel")
    SpeedInfo.Name = "SpeedInfo"
    SpeedInfo.Parent = SpeedFrame
    SpeedInfo.Size = UDim2.new(1, -20, 0, 20)
    SpeedInfo.Position = UDim2.new(0, 10, 0, 100)
    SpeedInfo.BackgroundTransparency = 1
    SpeedInfo.Text = "Tıklayarak hızı değiştirin (16-50)"
    SpeedInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    SpeedInfo.TextScaled = true
    SpeedInfo.Font = Enum.Font.Gotham
    SpeedInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Uçma Modu Bölümü
    local FlyFrame = Instance.new("Frame")
    FlyFrame.Name = "FlyFrame"
    FlyFrame.Parent = ContentFrame
    FlyFrame.Size = UDim2.new(1, 0, 0, 120)
    FlyFrame.Position = UDim2.new(0, 0, 0, 390)
    FlyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    FlyFrame.BorderSizePixel = 0
    
    local FlyCorner = Instance.new("UICorner")
    FlyCorner.CornerRadius = UDim.new(0, 8)
    FlyCorner.Parent = FlyFrame
    
    local FlyTitle = Instance.new("TextLabel")
    FlyTitle.Name = "FlyTitle"
    FlyTitle.Parent = FlyFrame
    FlyTitle.Size = UDim2.new(1, -20, 0, 30)
    FlyTitle.Position = UDim2.new(0, 10, 0, 10)
    FlyTitle.BackgroundTransparency = 1
    FlyTitle.Text = "✈️ Uçma Modu"
    FlyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    FlyTitle.TextScaled = true
    FlyTitle.Font = Enum.Font.GothamBold
    FlyTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local FlyToggle = Instance.new("TextButton")
    FlyToggle.Name = "FlyToggle"
    FlyToggle.Parent = FlyFrame
    FlyToggle.Size = UDim2.new(0, 100, 0, 40)
    FlyToggle.Position = UDim2.new(1, -110, 0, 50)
    FlyToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    FlyToggle.BorderSizePixel = 0
    FlyToggle.Text = "KAPALI"
    FlyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    FlyToggle.TextScaled = true
    FlyToggle.Font = Enum.Font.GothamBold
    
    local FlyToggleCorner = Instance.new("UICorner")
    FlyToggleCorner.CornerRadius = UDim.new(0, 8)
    FlyToggleCorner.Parent = FlyToggle
    
    local FlyInfo = Instance.new("TextLabel")
    FlyInfo.Name = "FlyInfo"
    FlyInfo.Parent = FlyFrame
    FlyInfo.Size = UDim2.new(1, -20, 0, 20)
    FlyInfo.Position = UDim2.new(0, 10, 0, 100)
    FlyInfo.BackgroundTransparency = 1
    FlyInfo.Text = "WASD ile uçun, Space ile yükselin"
    FlyInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    FlyInfo.TextScaled = true
    FlyInfo.Font = Enum.Font.Gotham
    FlyInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Sonsuz Zıplama Bölümü
    local JumpFrame = Instance.new("Frame")
    JumpFrame.Name = "JumpFrame"
    JumpFrame.Parent = ContentFrame
    JumpFrame.Size = UDim2.new(1, 0, 0, 120)
    JumpFrame.Position = UDim2.new(0, 0, 0, 520)
    JumpFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    JumpFrame.BorderSizePixel = 0
    
    local JumpCorner = Instance.new("UICorner")
    JumpCorner.CornerRadius = UDim.new(0, 8)
    JumpCorner.Parent = JumpFrame
    
    local JumpTitle = Instance.new("TextLabel")
    JumpTitle.Name = "JumpTitle"
    JumpTitle.Parent = JumpFrame
    JumpTitle.Size = UDim2.new(1, -20, 0, 30)
    JumpTitle.Position = UDim2.new(0, 10, 0, 10)
    JumpTitle.BackgroundTransparency = 1
    JumpTitle.Text = "🦘 Sonsuz Zıplama"
    JumpTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpTitle.TextScaled = true
    JumpTitle.Font = Enum.Font.GothamBold
    JumpTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local JumpToggle = Instance.new("TextButton")
    JumpToggle.Name = "JumpToggle"
    JumpToggle.Parent = JumpFrame
    JumpToggle.Size = UDim2.new(0, 100, 0, 40)
    JumpToggle.Position = UDim2.new(1, -110, 0, 50)
    JumpToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    JumpToggle.BorderSizePixel = 0
    JumpToggle.Text = "KAPALI"
    JumpToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpToggle.TextScaled = true
    JumpToggle.Font = Enum.Font.GothamBold
    
    local JumpToggleCorner = Instance.new("UICorner")
    JumpToggleCorner.CornerRadius = UDim.new(0, 8)
    JumpToggleCorner.Parent = JumpToggle
    
    local JumpInfo = Instance.new("TextLabel")
    JumpInfo.Name = "JumpInfo"
    JumpInfo.Parent = JumpFrame
    JumpInfo.Size = UDim2.new(1, -20, 0, 20)
    JumpInfo.Position = UDim2.new(0, 10, 0, 100)
    JumpInfo.BackgroundTransparency = 1
    JumpInfo.Text = "Sınırsız zıplama yeteneği"
    JumpInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    JumpInfo.TextScaled = true
    JumpInfo.Font = Enum.Font.Gotham
    JumpInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- God Mode Bölümü
    local GodFrame = Instance.new("Frame")
    GodFrame.Name = "GodFrame"
    GodFrame.Parent = ContentFrame
    GodFrame.Size = UDim2.new(1, 0, 0, 120)
    GodFrame.Position = UDim2.new(0, 0, 0, 650)
    GodFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    GodFrame.BorderSizePixel = 0
    
    local GodCorner = Instance.new("UICorner")
    GodCorner.CornerRadius = UDim.new(0, 8)
    GodCorner.Parent = GodFrame
    
    local GodTitle = Instance.new("TextLabel")
    GodTitle.Name = "GodTitle"
    GodTitle.Parent = GodFrame
    GodTitle.Size = UDim2.new(1, -20, 0, 30)
    GodTitle.Position = UDim2.new(0, 10, 0, 10)
    GodTitle.BackgroundTransparency = 1
    GodTitle.Text = "🛡️ God Mode"
    GodTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    GodTitle.TextScaled = true
    GodTitle.Font = Enum.Font.GothamBold
    GodTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local GodToggle = Instance.new("TextButton")
    GodToggle.Name = "GodToggle"
    GodToggle.Parent = GodFrame
    GodToggle.Size = UDim2.new(0, 100, 0, 40)
    GodToggle.Position = UDim2.new(1, -110, 0, 50)
    GodToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    GodToggle.BorderSizePixel = 0
    GodToggle.Text = "KAPALI"
    GodToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    GodToggle.TextScaled = true
    GodToggle.Font = Enum.Font.GothamBold
    
    local GodToggleCorner = Instance.new("UICorner")
    GodToggleCorner.CornerRadius = UDim.new(0, 8)
    GodToggleCorner.Parent = GodToggle
    
    local GodInfo = Instance.new("TextLabel")
    GodInfo.Name = "GodInfo"
    GodInfo.Parent = GodFrame
    GodInfo.Size = UDim2.new(1, -20, 0, 20)
    GodInfo.Position = UDim2.new(0, 10, 0, 100)
    GodInfo.BackgroundTransparency = 1
    GodInfo.Text = "Hasar almazsınız ve ölmezsiniz"
    GodInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    GodInfo.TextScaled = true
    GodInfo.Font = Enum.Font.Gotham
    GodInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Glass Vision Bölümü
    local GlassFrame = Instance.new("Frame")
    GlassFrame.Name = "GlassFrame"
    GlassFrame.Parent = ContentFrame
    GlassFrame.Size = UDim2.new(1, 0, 0, 120)
    GlassFrame.Position = UDim2.new(0, 0, 0, 780)
    GlassFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    GlassFrame.BorderSizePixel = 0
    
    local GlassCorner = Instance.new("UICorner")
    GlassCorner.CornerRadius = UDim.new(0, 8)
    GlassCorner.Parent = GlassFrame
    
    local GlassTitle = Instance.new("TextLabel")
    GlassTitle.Name = "GlassTitle"
    GlassTitle.Parent = GlassFrame
    GlassTitle.Size = UDim2.new(1, -20, 0, 30)
    GlassTitle.Position = UDim2.new(0, 10, 0, 10)
    GlassTitle.BackgroundTransparency = 1
    GlassTitle.Text = "🔍 Glass Vision"
    GlassTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    GlassTitle.TextScaled = true
    GlassTitle.Font = Enum.Font.GothamBold
    GlassTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local GlassToggle = Instance.new("TextButton")
    GlassToggle.Name = "GlassToggle"
    GlassToggle.Parent = GlassFrame
    GlassToggle.Size = UDim2.new(0, 100, 0, 40)
    GlassToggle.Position = UDim2.new(1, -110, 0, 50)
    GlassToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    GlassToggle.BorderSizePixel = 0
    GlassToggle.Text = "KAPALI"
    GlassToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    GlassToggle.TextScaled = true
    GlassToggle.Font = Enum.Font.GothamBold
    
    local GlassToggleCorner = Instance.new("UICorner")
    GlassToggleCorner.CornerRadius = UDim.new(0, 8)
    GlassToggleCorner.Parent = GlassToggle
    
    local GlassInfo = Instance.new("TextLabel")
    GlassInfo.Name = "GlassInfo"
    GlassInfo.Parent = GlassFrame
    GlassInfo.Size = UDim2.new(1, -20, 0, 20)
    GlassInfo.Position = UDim2.new(0, 10, 0, 100)
    GlassInfo.BackgroundTransparency = 1
    GlassInfo.Text = "Güvenli cam panellerini gösterir"
    GlassInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    GlassInfo.TextScaled = true
    GlassInfo.Font = Enum.Font.Gotham
    GlassInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Spin Unlock Bölümü
    local SpinFrame = Instance.new("Frame")
    SpinFrame.Name = "SpinFrame"
    SpinFrame.Parent = ContentFrame
    SpinFrame.Size = UDim2.new(1, 0, 0, 120)
    SpinFrame.Position = UDim2.new(0, 0, 0, 910)
    SpinFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    SpinFrame.BorderSizePixel = 0
    
    local SpinCorner = Instance.new("UICorner")
    SpinCorner.CornerRadius = UDim.new(0, 8)
    SpinCorner.Parent = SpinFrame
    
    local SpinTitle = Instance.new("TextLabel")
    SpinTitle.Name = "SpinTitle"
    SpinTitle.Parent = SpinFrame
    SpinTitle.Size = UDim2.new(1, -20, 0, 30)
    SpinTitle.Position = UDim2.new(0, 10, 0, 10)
    SpinTitle.BackgroundTransparency = 1
    SpinTitle.Text = "🎰 Spin Unlock"
    SpinTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpinTitle.TextScaled = true
    SpinTitle.Font = Enum.Font.GothamBold
    SpinTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local SpinToggle = Instance.new("TextButton")
    SpinToggle.Name = "SpinToggle"
    SpinToggle.Parent = SpinFrame
    SpinToggle.Size = UDim2.new(0, 100, 0, 40)
    SpinToggle.Position = UDim2.new(1, -110, 0, 50)
    SpinToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SpinToggle.BorderSizePixel = 0
    SpinToggle.Text = "KAPALI"
    SpinToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpinToggle.TextScaled = true
    SpinToggle.Font = Enum.Font.GothamBold
    
    local SpinToggleCorner = Instance.new("UICorner")
    SpinToggleCorner.CornerRadius = UDim.new(0, 8)
    SpinToggleCorner.Parent = SpinToggle
    
    local SpinInfo = Instance.new("TextLabel")
    SpinInfo.Name = "SpinInfo"
    SpinInfo.Parent = SpinFrame
    SpinInfo.Size = UDim2.new(1, -20, 0, 20)
    SpinInfo.Position = UDim2.new(0, 10, 0, 100)
    SpinInfo.BackgroundTransparency = 1
    SpinInfo.Text = "Spin ile gelen özellikleri bedavaya aç"
    SpinInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    SpinInfo.TextScaled = true
    SpinInfo.Font = Enum.Font.Gotham
    SpinInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Auto Win Bölümü
    local AutoWinFrame = Instance.new("Frame")
    AutoWinFrame.Name = "AutoWinFrame"
    AutoWinFrame.Parent = ContentFrame
    AutoWinFrame.Size = UDim2.new(1, 0, 0, 120)
    AutoWinFrame.Position = UDim2.new(0, 0, 0, 1040)
    AutoWinFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    AutoWinFrame.BorderSizePixel = 0
    
    local AutoWinCorner = Instance.new("UICorner")
    AutoWinCorner.CornerRadius = UDim.new(0, 8)
    AutoWinCorner.Parent = AutoWinFrame
    
    local AutoWinTitle = Instance.new("TextLabel")
    AutoWinTitle.Name = "AutoWinTitle"
    AutoWinTitle.Parent = AutoWinFrame
    AutoWinTitle.Size = UDim2.new(1, -20, 0, 30)
    AutoWinTitle.Position = UDim2.new(0, 10, 0, 10)
    AutoWinTitle.BackgroundTransparency = 1
    AutoWinTitle.Text = "🏆 Auto Win"
    AutoWinTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutoWinTitle.TextScaled = true
    AutoWinTitle.Font = Enum.Font.GothamBold
    AutoWinTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local AutoWinToggle = Instance.new("TextButton")
    AutoWinToggle.Name = "AutoWinToggle"
    AutoWinToggle.Parent = AutoWinFrame
    AutoWinToggle.Size = UDim2.new(0, 100, 0, 40)
    AutoWinToggle.Position = UDim2.new(1, -110, 0, 50)
    AutoWinToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    AutoWinToggle.BorderSizePixel = 0
    AutoWinToggle.Text = "KAPALI"
    AutoWinToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutoWinToggle.TextScaled = true
    AutoWinToggle.Font = Enum.Font.GothamBold
    
    local AutoWinToggleCorner = Instance.new("UICorner")
    AutoWinToggleCorner.CornerRadius = UDim.new(0, 8)
    AutoWinToggleCorner.Parent = AutoWinToggle
    
    local AutoWinInfo = Instance.new("TextLabel")
    AutoWinInfo.Name = "AutoWinInfo"
    AutoWinInfo.Parent = AutoWinFrame
    AutoWinInfo.Size = UDim2.new(1, -20, 0, 20)
    AutoWinInfo.Position = UDim2.new(0, 10, 0, 100)
    AutoWinInfo.BackgroundTransparency = 1
    AutoWinInfo.Text = "Tüm mini oyunları otomatik kazan"
    AutoWinInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    AutoWinInfo.TextScaled = true
    AutoWinInfo.Font = Enum.Font.Gotham
    AutoWinInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Roll Abilities Bölümü
    local RollFrame = Instance.new("Frame")
    RollFrame.Name = "RollFrame"
    RollFrame.Parent = ContentFrame
    RollFrame.Size = UDim2.new(1, 0, 0, 120)
    RollFrame.Position = UDim2.new(0, 0, 0, 1170)
    RollFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    RollFrame.BorderSizePixel = 0
    
    local RollCorner = Instance.new("UICorner")
    RollCorner.CornerRadius = UDim.new(0, 8)
    RollCorner.Parent = RollFrame
    
    local RollTitle = Instance.new("TextLabel")
    RollTitle.Name = "RollTitle"
    RollTitle.Parent = RollFrame
    RollTitle.Size = UDim2.new(1, -20, 0, 30)
    RollTitle.Position = UDim2.new(0, 10, 0, 10)
    RollTitle.BackgroundTransparency = 1
    RollTitle.Text = "🎲 Roll Abilities"
    RollTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    RollTitle.TextScaled = true
    RollTitle.Font = Enum.Font.GothamBold
    RollTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local RollDropdown = Instance.new("TextButton")
    RollDropdown.Name = "RollDropdown"
    RollDropdown.Parent = RollFrame
    RollDropdown.Size = UDim2.new(1, -20, 0, 40)
    RollDropdown.Position = UDim2.new(0, 10, 0, 50)
    RollDropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    RollDropdown.BorderSizePixel = 0
    RollDropdown.Text = "Özellik Seçin..."
    RollDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    RollDropdown.TextScaled = true
    RollDropdown.Font = Enum.Font.Gotham
    
    local RollDropdownCorner = Instance.new("UICorner")
    RollDropdownCorner.CornerRadius = UDim.new(0, 8)
    RollDropdownCorner.Parent = RollDropdown
    
    local RollInfo = Instance.new("TextLabel")
    RollInfo.Name = "RollInfo"
    RollInfo.Parent = RollFrame
    RollInfo.Size = UDim2.new(1, -20, 0, 20)
    RollInfo.Position = UDim2.new(0, 10, 0, 100)
    RollInfo.BackgroundTransparency = 1
    RollInfo.Text = "Roll ile gelen özellikleri bedavaya equip et"
    RollInfo.TextColor3 = Color3.fromRGB(150, 150, 150)
    RollInfo.TextScaled = true
    RollInfo.Font = Enum.Font.Gotham
    RollInfo.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Footer
    local FooterFrame = Instance.new("Frame")
    FooterFrame.Name = "FooterFrame"
    FooterFrame.Parent = MainFrame
    FooterFrame.Size = UDim2.new(1, 0, 0, 40)
    FooterFrame.Position = UDim2.new(0, 0, 1, -40)
    FooterFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    FooterFrame.BorderSizePixel = 0
    
    local FooterCorner = Instance.new("UICorner")
    FooterCorner.CornerRadius = UDim.new(0, 12)
    FooterCorner.Parent = FooterFrame
    
    local FooterLabel = Instance.new("TextLabel")
    FooterLabel.Name = "FooterLabel"
    FooterLabel.Parent = FooterFrame
    FooterLabel.Size = UDim2.new(1, 0, 1, 0)
    FooterLabel.Position = UDim2.new(0, 0, 0, 0)
    FooterLabel.BackgroundTransparency = 1
    FooterLabel.Text = "Ink Game Hack v2.0 | F1 - Menüyü Aç/Kapat"
    FooterLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    FooterLabel.TextScaled = true
    FooterLabel.Font = Enum.Font.Gotham
    
    return ScreenGui, MainFrame, NoclipToggle, TeleportToggle, SpeedSlider, FlyToggle, JumpToggle, GodToggle, GlassToggle, SpinToggle, AutoWinToggle, RollDropdown, CloseButton
end

-- Roll Abilities Listesi
local rollAbilities = {
    "Lightning God",
    "The Doctor", 
    "Time Stop",
    "Ultra Instinct",
    "Medic",
    "Phantom Step",
    "Teleporting Gambit",
    "Baseball Star",
    "Hercules",
    "Parkour Artist",
    "Trickster",
    "Blackflash",
    "Quicksilver",
    "Player 100",
    "Super Strength",
    "Bulldozer",
    "Weapon Smuggler",
    "Sharp Shooter",
    "Player 120"
}

local rollAbilityIndex = 1

-- Roll Abilities Fonksiyonu
local function equipRollAbility(abilityName)
    currentRollAbility = abilityName
    rollAbilitiesEnabled = true
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    -- RemoteEvent'leri bul ve tetikle
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvents = {}
    
    -- Roll ile ilgili RemoteEvent'leri bul
    for _, obj in pairs(replicatedStorage:GetChildren()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            if obj.Name:lower():find("roll") or obj.Name:lower():find("ability") or obj.Name:lower():find("power") then
                table.insert(remoteEvents, obj)
            end
        end
    end
    
    -- PlayerGui'deki roll GUI'lerini kontrol et
    local playerGui = player.PlayerGui
    for _, gui in pairs(playerGui:GetChildren()) do
        if gui.Name:lower():find("roll") or gui.Name:lower():find("ability") or gui.Name:lower():find("power") then
            gui.Enabled = true
            
            -- Ability seçim butonlarını bul
            for _, child in pairs(gui:GetDescendants()) do
                if child:IsA("TextButton") and child.Text:lower():find(abilityName:lower()) then
                    child.Activated:Fire()
                end
            end
        end
    end
    
    -- RemoteEvent'leri tetikle
    for _, remoteEvent in pairs(remoteEvents) do
        if remoteEvent:IsA("RemoteEvent") then
            remoteEvent:FireServer(abilityName)
        elseif remoteEvent:IsA("RemoteFunction") then
            remoteEvent:InvokeServer(abilityName)
        end
    end
    
    print("🎲 Roll Ability Equipped: " .. abilityName)
end

-- Roll Abilities sürekli kontrol
local function handleRollAbilities()
    if not rollAbilitiesEnabled or currentRollAbility == "None" then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    -- Seçilen ability'ye göre özel davranışlar
    if currentRollAbility == "Lightning God" then
        -- Lightning God özellikleri
        if humanoid.Health < humanoid.MaxHealth * 0.25 then
            humanoid.Health = humanoid.MaxHealth * 0.25 -- %25 heal
        end
    elseif currentRollAbility == "The Doctor" then
        -- The Doctor özellikleri
        if humanoid.Health < humanoid.MaxHealth * 0.5 then
            humanoid.Health = humanoid.MaxHealth -- Full heal
        end
    elseif currentRollAbility == "Ultra Instinct" then
        -- Ultra Instinct özellikleri
        humanoid.WalkSpeed = currentSpeed * 1.5
    elseif currentRollAbility == "Medic" then
        -- Medic özellikleri
        if humanoid.Health < humanoid.MaxHealth then
            humanoid.Health = humanoid.Health + 1 -- Slow heal
        end
    elseif currentRollAbility == "Phantom Step" then
        -- Phantom Step özellikleri
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local camera = Workspace.CurrentCamera
                local direction = camera.CFrame.LookVector
                humanoidRootPart.CFrame = humanoidRootPart.CFrame + direction * 20
            end
        end
    elseif currentRollAbility == "Teleporting Gambit" then
        -- Teleporting Gambit özellikleri
        if UserInputService:IsKeyDown(Enum.KeyCode.E) then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local camera = Workspace.CurrentCamera
                local direction = camera.CFrame.LookVector
                humanoidRootPart.CFrame = humanoidRootPart.CFrame + direction * 50
            end
        end
    elseif currentRollAbility == "Baseball Star" then
        -- Baseball Star özellikleri
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            local baseballBat = backpack:FindFirstChild("BaseballBat")
            if not baseballBat then
                -- Baseball bat spawn et
                local tool = Instance.new("Tool")
                tool.Name = "BaseballBat"
                tool.Parent = backpack
            end
        end
    elseif currentRollAbility == "Hercules" then
        -- Hercules özellikleri
        humanoid.WalkSpeed = currentSpeed * 0.8 -- Slower but stronger
    elseif currentRollAbility == "Parkour Artist" then
        -- Parkour Artist özellikleri
        humanoid.JumpPower = 100
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            humanoid.Jump = true
        end
    elseif currentRollAbility == "Trickster" then
        -- Trickster özellikleri
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
            -- Banana peel spawn
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local bananaPeel = Instance.new("Part")
                bananaPeel.Name = "BananaPeel"
                bananaPeel.Size = Vector3.new(2, 0.2, 2)
                bananaPeel.Position = humanoidRootPart.Position
                bananaPeel.BrickColor = BrickColor.new("Bright yellow")
                bananaPeel.Parent = Workspace
            end
        end
    elseif currentRollAbility == "Quicksilver" then
        -- Quicksilver özellikleri
        humanoid.WalkSpeed = currentSpeed * 2
    elseif currentRollAbility == "Super Strength" then
        -- Super Strength özellikleri
        humanoid.WalkSpeed = currentSpeed * 0.7 -- Slower but stronger
    elseif currentRollAbility == "Bulldozer" then
        -- Bulldozer özellikleri
        if UserInputService:IsKeyDown(Enum.KeyCode.R) then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local camera = Workspace.CurrentCamera
                local direction = camera.CFrame.LookVector
                humanoidRootPart.CFrame = humanoidRootPart.CFrame + direction * 30
            end
        end
    elseif currentRollAbility == "Weapon Smuggler" then
        -- Weapon Smuggler özellikleri
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            local weapon = backpack:FindFirstChild("SpecialWeapon")
            if not weapon then
                -- Special weapon spawn et
                local tool = Instance.new("Tool")
                tool.Name = "SpecialWeapon"
                tool.Parent = backpack
            end
        end
    elseif currentRollAbility == "Sharp Shooter" then
        -- Sharp Shooter özellikleri
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            local revolver = backpack:FindFirstChild("Revolver")
            if not revolver then
                -- Revolver spawn et
                local tool = Instance.new("Tool")
                tool.Name = "Revolver"
                tool.Parent = backpack
            end
        end
    end
end

-- Yeni özellik fonksiyonları

-- Uçma Modu Fonksiyonu
local function toggleFly()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
        end
    else
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end
end

-- Sonsuz Zıplama Fonksiyonu
local function toggleInfiniteJump()
    infiniteJumpEnabled = not infiniteJumpEnabled
end

-- God Mode Fonksiyonu
local function toggleGodMode()
    godModeEnabled = not godModeEnabled
    
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            if godModeEnabled then
                humanoid.MaxHealth = math.huge
                humanoid.Health = math.huge
                humanoid.WalkSpeed = currentSpeed
                
                -- Hasar alma event'ini engelle
                humanoid.HealthChanged:Connect(function()
                    if godModeEnabled then
                        humanoid.Health = math.huge
                    end
                end)
            else
                humanoid.MaxHealth = 100
                humanoid.Health = 100
            end
        end
    end
end

-- God Mode sürekli kontrol
local function handleGodMode()
    if not godModeEnabled then return end
    
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            if humanoid.Health < math.huge then
                humanoid.Health = math.huge
            end
        end
    end
end

-- Glass Vision Fonksiyonu
local function toggleGlassVision()
    glassVisionEnabled = not glassVisionEnabled
    
    if glassVisionEnabled then
        -- Cam panellerini vurgula
        for _, obj in pairs(Workspace:GetChildren()) do
            if obj.Name:lower():find("glass") or obj.Name:lower():find("pane") then
                if obj:IsA("BasePart") then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = obj
                    highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    highlight.OutlineColor = Color3.fromRGB(0, 200, 0)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                end
            end
        end
    else
        -- Highlight'ları kaldır
        for _, obj in pairs(Workspace:GetChildren()) do
            if obj.Name:lower():find("glass") or obj.Name:lower():find("pane") then
                if obj:IsA("BasePart") then
                    local highlight = obj:FindFirstChild("Highlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end
end

-- ESP Fonksiyonu
local function toggleESP()
    espEnabled = not espEnabled
    
    if espEnabled then
        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = humanoidRootPart
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = otherPlayer.Name
                    nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.GothamBold
                end
            end
        end
    else
        for _, otherPlayer in pairs(Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local character = otherPlayer.Character
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoidRootPart then
                    local billboard = humanoidRootPart:FindFirstChild("BillboardGui")
                    if billboard then
                        billboard:Destroy()
                    end
                end
            end
        end
    end
end

-- Spin Unlock Fonksiyonu
local function toggleSpinUnlock()
    spinUnlockEnabled = not spinUnlockEnabled
    
    if spinUnlockEnabled then
        -- Spin wheel'i bul ve tüm ödülleri aç
        local workspace = game:GetService("Workspace")
        local spinWheel = workspace:FindFirstChild("SpinWheel") or workspace:FindFirstChild("Wheel") or workspace:FindFirstChild("LuckyWheel")
        
        if spinWheel then
            -- Spin wheel'e tıkla
            local clickDetector = spinWheel:FindFirstChild("ClickDetector")
            if clickDetector then
                fireclickdetector(clickDetector)
            end
        end
        
        -- PlayerGui'de spin ile ilgili GUI'leri kontrol et
        local playerGui = player.PlayerGui
        for _, gui in pairs(playerGui:GetChildren()) do
            if gui.Name:lower():find("spin") or gui.Name:lower():find("wheel") or gui.Name:lower():find("lucky") then
                -- Spin GUI'sini aç
                gui.Enabled = true
                
                -- Spin butonunu bul ve tıkla
                local spinButton = gui:FindFirstChild("SpinButton") or gui:FindFirstChild("Spin") or gui:FindFirstChild("Play")
                if spinButton and spinButton:IsA("TextButton") then
                    spinButton.Activated:Fire()
                end
            end
        end
        
        -- ReplicatedStorage'da spin ile ilgili RemoteEvent'leri kontrol et
        local replicatedStorage = game:GetService("ReplicatedStorage")
        for _, obj in pairs(replicatedStorage:GetChildren()) do
            if obj.Name:lower():find("spin") or obj.Name:lower():find("wheel") or obj.Name:lower():find("lucky") then
                if obj:IsA("RemoteEvent") then
                    obj:FireServer()
                elseif obj:IsA("RemoteFunction") then
                    obj:InvokeServer()
                end
            end
        end
    end
end

-- Auto Win Fonksiyonu
local function toggleAutoWin()
    autoWinEnabled = not autoWinEnabled
end

-- Auto Win sürekli kontrol
local function handleAutoWin()
    if not autoWinEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    -- Red Light Green Light
    if humanoid.MoveDirection.Magnitude > 0 then
        teleportToFinish()
    end
    
    -- Dalgona oyunu için otomatik tamamlama
    local workspace = game:GetService("Workspace")
    local dalgona = workspace:FindFirstChild("Dalgona") or workspace:FindFirstChild("Cookie")
    if dalgona then
        -- Dalgona oyununu otomatik tamamla
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = dalgona.CFrame + Vector3.new(0, 5, 0)
        end
    end
    
    -- Tug of War için otomatik kazanma
    local tugOfWar = workspace:FindFirstChild("TugOfWar") or workspace:FindFirstChild("Rope")
    if tugOfWar then
        -- Tug of War oyununu otomatik kazan
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = tugOfWar.CFrame + Vector3.new(0, 5, 0)
        end
    end
    
    -- Jump Rope için otomatik zıplama
    local jumpRope = workspace:FindFirstChild("JumpRope") or workspace:FindFirstChild("Rope")
    if jumpRope then
        humanoid.Jump = true
    end
end

-- Noclip Fonksiyonu
local function toggleNoclip()
    noclipEnabled = not noclipEnabled
end

-- Noclip sürekli kontrol
local function handleNoclip()
    if not noclipEnabled then return end
    
    local character = player.Character
    if character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

-- Teleport Fonksiyonu
local function teleportToFinish()
    if not teleportEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    -- Bitiş çizgisini bul (genellikle en yüksek Z pozisyonunda)
    local workspace = game:GetService("Workspace")
    local finishLine = nil
    local maxZ = -math.huge
    
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name:lower():find("finish") or obj.Name:lower():find("end") or obj.Name:lower():find("goal") then
            if obj:IsA("BasePart") and obj.Position.Z > maxZ then
                finishLine = obj
                maxZ = obj.Position.Z
            end
        end
    end
    
    -- Eğer finish line bulunamazsa, en yüksek Z pozisyonuna git
    if not finishLine then
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("BasePart") and obj.Position.Z > maxZ then
                finishLine = obj
                maxZ = obj.Position.Z
            end
        end
    end
    
    if finishLine then
        humanoidRootPart.CFrame = finishLine.CFrame + Vector3.new(0, 5, 0)
    else
        -- Varsayılan olarak ileriye doğru teleport
        local currentPos = humanoidRootPart.Position
        humanoidRootPart.CFrame = CFrame.new(currentPos.X, currentPos.Y, currentPos.Z + 100)
    end
end

-- Hız değiştirme fonksiyonu
local function changeSpeed()
    speedIndex = speedIndex + 1
    if speedIndex > #speeds then
        speedIndex = 1
    end
    
    currentSpeed = speeds[speedIndex]
    
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = currentSpeed
            humanoid.JumpPower = 50 -- Zıplama gücünü de ayarla
        end
    end
end

-- Hız sürekli kontrol
local function handleSpeed()
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            -- Hız değişirse tekrar ayarla
            if humanoid.WalkSpeed ~= currentSpeed then
                humanoid.WalkSpeed = currentSpeed
            end
        end
    end
end

-- Ana GUI oluşturma ve event'leri bağlama
local ScreenGui, MainFrame, NoclipToggle, TeleportToggle, SpeedSlider, FlyToggle, JumpToggle, GodToggle, GlassToggle, SpinToggle, AutoWinToggle, RollDropdown, CloseButton = createModernGUI()

-- Noclip toggle event
NoclipToggle.MouseButton1Click:Connect(function()
    toggleNoclip()
    
    if noclipEnabled then
        NoclipToggle.Text = "AÇIK"
        NoclipToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        -- Animasyon efekti
        local tween = TweenService:Create(NoclipToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(NoclipToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        NoclipToggle.Text = "KAPALI"
        NoclipToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Teleport toggle event
TeleportToggle.MouseButton1Click:Connect(function()
    teleportEnabled = not teleportEnabled
    
    if teleportEnabled then
        TeleportToggle.Text = "AÇIK"
        TeleportToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        -- Animasyon efekti
        local tween = TweenService:Create(TeleportToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(TeleportToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        TeleportToggle.Text = "KAPALI"
        TeleportToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Hız değiştirme event
SpeedSlider.MouseButton1Click:Connect(function()
    changeSpeed()
    SpeedSlider.Text = "Hız: " .. currentSpeed
    
    -- Animasyon efekti
    local tween = TweenService:Create(SpeedSlider, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Size = UDim2.new(1, -25, 0, 35)
        })
    tween:Play()
    tween.Completed:Connect(function()
        local tween2 = TweenService:Create(SpeedSlider, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Size = UDim2.new(1, -20, 0, 30)
        })
        tween2:Play()
    end)
end)

-- Uçma Modu toggle event
FlyToggle.MouseButton1Click:Connect(function()
    toggleFly()
    
    if flyEnabled then
        FlyToggle.Text = "AÇIK"
        FlyToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        local tween = TweenService:Create(FlyToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(FlyToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        FlyToggle.Text = "KAPALI"
        FlyToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Sonsuz Zıplama toggle event
JumpToggle.MouseButton1Click:Connect(function()
    toggleInfiniteJump()
    
    if infiniteJumpEnabled then
        JumpToggle.Text = "AÇIK"
        JumpToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        local tween = TweenService:Create(JumpToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(JumpToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        JumpToggle.Text = "KAPALI"
        JumpToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- God Mode toggle event
GodToggle.MouseButton1Click:Connect(function()
    toggleGodMode()
    
    if godModeEnabled then
        GodToggle.Text = "AÇIK"
        GodToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        local tween = TweenService:Create(GodToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(GodToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        GodToggle.Text = "KAPALI"
        GodToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Glass Vision toggle event
GlassToggle.MouseButton1Click:Connect(function()
    toggleGlassVision()
    
    if glassVisionEnabled then
        GlassToggle.Text = "AÇIK"
        GlassToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        local tween = TweenService:Create(GlassToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(GlassToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        GlassToggle.Text = "KAPALI"
        GlassToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Spin Unlock toggle event
SpinToggle.MouseButton1Click:Connect(function()
    toggleSpinUnlock()
    
    if spinUnlockEnabled then
        SpinToggle.Text = "AÇIK"
        SpinToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        local tween = TweenService:Create(SpinToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(SpinToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        SpinToggle.Text = "KAPALI"
        SpinToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Auto Win toggle event
AutoWinToggle.MouseButton1Click:Connect(function()
    toggleAutoWin()
    
    if autoWinEnabled then
        AutoWinToggle.Text = "AÇIK"
        AutoWinToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        local tween = TweenService:Create(AutoWinToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 110, 0, 45)
        })
        tween:Play()
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(AutoWinToggle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 100, 0, 40)
            })
            tween2:Play()
        end)
    else
        AutoWinToggle.Text = "KAPALI"
        AutoWinToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end
end)

-- Roll Dropdown event
RollDropdown.MouseButton1Click:Connect(function()
    rollAbilityIndex = rollAbilityIndex + 1
    if rollAbilityIndex > #rollAbilities then
        rollAbilityIndex = 1
    end
    
    local selectedAbility = rollAbilities[rollAbilityIndex]
    RollDropdown.Text = selectedAbility
    
    -- Seçilen ability'yi equip et
    equipRollAbility(selectedAbility)
    
    -- Animasyon efekti
    local tween = TweenService:Create(RollDropdown, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
        Size = UDim2.new(1, -25, 0, 45)
    })
    tween:Play()
    tween.Completed:Connect(function()
        local tween2 = TweenService:Create(RollDropdown, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            Size = UDim2.new(1, -20, 0, 40)
        })
        tween2:Play()
    end)
end)

-- Kapatma butonu event
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Klavye kısayolları
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F1 then
        MainFrame.Visible = not MainFrame.Visible
    elseif input.KeyCode == Enum.KeyCode.F2 then
        toggleNoclip()
    elseif input.KeyCode == Enum.KeyCode.F3 then
        teleportToFinish()
    elseif input.KeyCode == Enum.KeyCode.F4 then
        changeSpeed()
    elseif input.KeyCode == Enum.KeyCode.F5 then
        toggleFly()
    elseif input.KeyCode == Enum.KeyCode.F6 then
        toggleInfiniteJump()
    elseif input.KeyCode == Enum.KeyCode.F7 then
        toggleGodMode()
    elseif input.KeyCode == Enum.KeyCode.F8 then
        toggleGlassVision()
    elseif input.KeyCode == Enum.KeyCode.F9 then
        toggleESP()
    elseif input.KeyCode == Enum.KeyCode.F10 then
        toggleSpinUnlock()
    elseif input.KeyCode == Enum.KeyCode.F11 then
        toggleAutoWin()
    elseif input.KeyCode == Enum.KeyCode.F12 then
        -- Roll ability değiştir
        rollAbilityIndex = rollAbilityIndex + 1
        if rollAbilityIndex > #rollAbilities then
            rollAbilityIndex = 1
        end
        local selectedAbility = rollAbilities[rollAbilityIndex]
        equipRollAbility(selectedAbility)
        RollDropdown.Text = selectedAbility
    end
end)

-- Red Light Green Light algılama ve otomatik teleport
local function checkForRedLight()
    if not teleportEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    -- Red light algılama - daha kapsamlı
    local workspace = game:GetService("Workspace")
    local redLight = nil
    
    -- Farklı red light isimlerini kontrol et
    for _, obj in pairs(workspace:GetChildren()) do
        local name = obj.Name:lower()
        if name:find("red") and (name:find("light") or name:find("lamp")) then
            redLight = obj
            break
        end
    end
    
    -- Eğer red light bulunamazsa, oyun durumunu kontrol et
    if not redLight then
        -- Oyun durumunu kontrol et (genellikle bir GUI veya değer olur)
        local gameGui = player.PlayerGui:FindFirstChild("GameGui") or player.PlayerGui:FindFirstChild("MainGui")
        if gameGui then
            local statusLabel = gameGui:FindFirstChild("Status") or gameGui:FindFirstChild("GameStatus")
            if statusLabel and statusLabel:IsA("TextLabel") then
                local text = statusLabel.Text:lower()
                if text:find("red") or text:find("stop") or text:find("don't move") then
                    redLight = true -- Red light aktif
                end
            end
        end
    end
    
    -- Eğer karakter hareket ediyorsa ve red light varsa teleport et
    if redLight and humanoid.MoveDirection.Magnitude > 0 then
        teleportToFinish()
    end
end

-- Uçma modu kontrolü
local function handleFly()
    if not flyEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    local camera = Workspace.CurrentCamera
    local moveVector = Vector3.new(0, 0, 0)
    
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        moveVector = moveVector + camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        moveVector = moveVector - camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveVector = moveVector - camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveVector = moveVector + camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        moveVector = moveVector + Vector3.new(0, 1, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        moveVector = moveVector - Vector3.new(0, 1, 0)
    end
    
    if moveVector.Magnitude > 0 then
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + moveVector * flySpeed * 0.1
    end
end

-- Sonsuz zıplama kontrolü
local function handleInfiniteJump()
    if not infiniteJumpEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        humanoid.Jump = true
    end
end

-- Sürekli kontrol
RunService.Heartbeat:Connect(function()
    checkForRedLight()
    handleFly()
    handleInfiniteJump()
    handleNoclip()
    handleGodMode()
    handleSpeed()
    handleAutoWin()
    handleRollAbilities()
end)

-- Karakter spawn olduğunda ayarları uygula
player.CharacterAdded:Connect(function(character)
    wait(1)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = currentSpeed
        humanoid.JumpPower = 50
    end
    
    -- Noclip'i yeniden uygula
    if noclipEnabled then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
    
    -- God Mode'u yeniden uygula
    if godModeEnabled and humanoid then
        humanoid.MaxHealth = math.huge
        humanoid.Health = math.huge
    end
end)

-- Mevcut karakter için ayarları uygula
if player.Character then
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = currentSpeed
        humanoid.JumpPower = 50
    end
end

print("🎨 Ink Game Hack v2.2 yüklendi!")
print("=== KLAVYE KISAYOLLARI ===")
print("F1 - Menüyü aç/kapat")
print("F2 - Noclip aç/kapat")
print("F3 - Red Light Teleport")
print("F4 - Hızı değiştir")
print("F5 - Uçma modu aç/kapat")
print("F6 - Sonsuz zıplama aç/kapat")
print("F7 - God Mode aç/kapat")
print("F8 - Glass Vision aç/kapat")
print("F9 - ESP aç/kapat")
print("F10 - Spin Unlock aç/kapat")
print("F11 - Auto Win aç/kapat")
print("F12 - Roll Ability değiştir")
print("=== ÖZELLİKLER ===")
print("✅ Noclip - Duvarlardan geçme")
print("✅ Teleport - Red Light Green Light'ta ışınlanma")
print("✅ Uçma Modu - WASD + Space/Shift ile uçma")
print("✅ Sonsuz Zıplama - Sınırsız zıplama")
print("✅ God Mode - Ölümsüzlük")
print("✅ Glass Vision - Güvenli cam panellerini gösterme")
print("✅ ESP - Diğer oyuncuları görme")
print("✅ Hız Ayarı - 16-50 arası hız seçenekleri")
print("✅ Spin Unlock - Spin ile gelen özellikleri bedavaya aç")
print("✅ Auto Win - Tüm mini oyunları otomatik kazan")
print("✅ Roll Abilities - Roll ile gelen güçleri bedavaya equip et")
print("=== YENİ ROLL ABILITIES ===")
print("⚡ Lightning God - Hasar verirken şimşek çarptırır")
print("👨‍⚕️ The Doctor - Ölümden dirilme ve iyileştirme")
print("⏰ Time Stop - 90 saniyede bir oyuncuları dondurur")
print("🥋 Ultra Instinct - 5 dodge ve hız artışı")
print("🏥 Medic - Bandaj düşürme ve taşıma hızı")
print("👻 Phantom Step - 3 hızlı dash")
print("🔄 Teleporting Gambit - E ile teleport (E tuşu)")
print("⚾ Baseball Star - Baseball bat spawn eder")
print("💪 Hercules - Oyuncuları kaldırıp fırlatma")
print("🏃 Parkour Artist - Çift zıplama ve kayma")
print("🍌 Trickster - Muz kabuğu düşürme (Q tuşu)")
print("⚡ Blackflash - Güçlü saldırı")
print("💨 Quicksilver - Yavaştan hızlıya")
print("🛡️ Player 100 - 10 saniye ragdoll + iyileşme")
print("💪 Super Strength - 3x itme gücü")
print("🚜 Bulldozer - İleri koşma (R tuşu)")
print("🔫 Weapon Smuggler - Özel silah spawn")
print("🎯 Sharp Shooter - Revolver spawn")
print("👤 Player 120 - Yakındaki düşmanları indirme")
print("=== KULLANIM ===")
print("Menüyü açmak için F1 tuşuna basın!")
print("Roll Abilities için dropdown'dan seçin veya F12 ile değiştirin!")
print("Tüm özellikler modern GUI ile kontrol edilebilir.")

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
    
    return ScreenGui, MainFrame, NoclipToggle, TeleportToggle, SpeedSlider, FlyToggle, JumpToggle, GodToggle, GlassToggle, CloseButton
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
            else
                humanoid.MaxHealth = 100
                humanoid.Health = 100
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

-- Noclip Fonksiyonu
local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    
    if noclipEnabled then
        -- Noclip'i aç
        local character = player.Character
        if character then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = false
                end
            end
            
            -- HumanoidRootPart'ı da kontrol et
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CanCollide = false
            end
        end
        
        -- Karakter spawn olduğunda noclip'i yeniden uygula
        player.CharacterAdded:Connect(function(character)
            if noclipEnabled then
                wait(1) -- Karakterin yüklenmesini bekle
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = false
                    end
                end
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.CanCollide = false
                end
            end
        end)
    else
        -- Noclip'i kapat
        local character = player.Character
        if character then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = true
                end
            end
            
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CanCollide = true
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
        end
    end
end

-- Ana GUI oluşturma ve event'leri bağlama
local ScreenGui, MainFrame, NoclipToggle, TeleportToggle, SpeedSlider, FlyToggle, JumpToggle, GodToggle, GlassToggle, CloseButton = createModernGUI()

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
    end
end)

-- Red Light Green Light algılama ve otomatik teleport
local function checkForRedLight()
    if not teleportEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid then return end
    
    -- Eğer karakter hareket ediyorsa ve red light varsa teleport et
    if humanoid.MoveDirection.Magnitude > 0 then
        -- Red light algılama (basit versiyon)
        local workspace = game:GetService("Workspace")
        local redLight = workspace:FindFirstChild("RedLight") or workspace:FindFirstChild("Red Light")
        
        if redLight then
            teleportToFinish()
        end
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
end)

-- Karakter spawn olduğunda hızı ayarla
player.CharacterAdded:Connect(function(character)
    wait(1)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = currentSpeed
    end
end)

-- Mevcut karakter için hızı ayarla
if player.Character then
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = currentSpeed
    end
end

print("🎨 Ink Game Hack v2.0 yüklendi!")
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
print("=== ÖZELLİKLER ===")
print("✅ Noclip - Duvarlardan geçme")
print("✅ Teleport - Red Light Green Light'ta ışınlanma")
print("✅ Uçma Modu - WASD + Space/Shift ile uçma")
print("✅ Sonsuz Zıplama - Sınırsız zıplama")
print("✅ God Mode - Ölümsüzlük")
print("✅ Glass Vision - Güvenli cam panellerini gösterme")
print("✅ ESP - Diğer oyuncuları görme")
print("✅ Hız Ayarı - 16-50 arası hız seçenekleri")
print("=== KULLANIM ===")
print("Menüyü açmak için F1 tuşuna basın!")
print("Tüm özellikler modern GUI ile kontrol edilebilir.")

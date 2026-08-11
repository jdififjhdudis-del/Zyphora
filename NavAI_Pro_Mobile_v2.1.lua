--[[
    ╔══════════════════════════════════════════════════════════════════════╗
    ║         NAV AI PRO - Mobile Responsive Edition v2.1                ║
    ║         نظام ملاحة ذكاء اصطناعي - نسخة متجاوبة مع الجوال            ║
    ╚══════════════════════════════════════════════════════════════════════╝
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local PathfindingService = game:GetService("PathfindingService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE THEME SYSTEM
-- ═══════════════════════════════════════════════════════════════════════

local THEME = {
    Primary = Color3.fromHex("#0A0A0F"),
    Secondary = Color3.fromHex("#12121A"),
    Surface = Color3.fromHex("#1A1A25"),
    Elevated = Color3.fromHex("#252535"),
    AccentRed = Color3.fromHex("#FF2D2D"),
    AccentCrimson = Color3.fromHex("#E81123"),
    Success = Color3.fromHex("#00E676"),
    Warning = Color3.fromHex("#FFD600"),
    Danger = Color3.fromHex("#FF1744"),
    TextPrimary = Color3.fromHex("#FFFFFF"),
    TextSecondary = Color3.fromHex("#B0B0C0"),
    TextMuted = Color3.fromHex("#6E6E80"),
}

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE UTILITY MODULE
-- ═══════════════════════════════════════════════════════════════════════

local Utils = {}

function Utils.SafeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then warn("[NAV AI] Error: " .. tostring(result)) return nil, result end
    return result, nil
end

function Utils.Create(className, parent, props)
    return Utils.SafeCall(function()
        local element = Instance.new(className)
        for prop, value in pairs(props or {}) do element[prop] = value end
        element.Parent = parent
        return element
    end)
end

function Utils.Tween(obj, props, duration, style, direction, delay)
    if not obj then return nil end
    local tweenInfo = TweenInfo.new(duration or 0.5, style or Enum.EasingStyle.Quart, direction or Enum.EasingDirection.Out, 0, false, delay or 0)
    local tween = TweenService:Create(obj, tweenInfo, props)
    tween:Play()
    return tween
end

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE GUI BUILDER
-- ═══════════════════════════════════════════════════════════════════════

local GUI = {}
GUI.ScreenGui = nil
GUI.MainContainer = nil

function GUI.Init()
    GUI.ScreenGui = Utils.Create("ScreenGui", playerGui, {
        Name = "NAVAIPRO", ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999
    })
    GUI.MainContainer = Utils.Create("Frame", GUI.ScreenGui, {
        Name = "MainContainer", Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1, BorderSizePixel = 0
    })
end

function GUI.CreateStyledFrame(parent, name, size, pos, bgColor, cornerRadius, zIndex)
    local frame = Utils.Create("Frame", parent, {
        Name = name, Size = size, Position = pos,
        BackgroundColor3 = bgColor or THEME.Surface,
        BorderSizePixel = 0, ZIndex = zIndex or 10, ClipsDescendants = true
    })
    Utils.Create("UICorner", frame, { CornerRadius = UDim.new(0, cornerRadius or 12) })
    return frame
end

function GUI.CreateResponsiveButton(parent, name, size, pos, text, primaryColor, zIndex)
    local btn = Utils.Create("TextButton", parent, {
        Name = name, Size = size, Position = pos,
        BackgroundColor3 = primaryColor or THEME.AccentRed,
        Text = text or "Button", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 14,
        TextScaled = true, AutoButtonColor = false,
        ZIndex = zIndex or 10, ClipsDescendants = true
    })
    Utils.Create("UICorner", btn, { CornerRadius = UDim.new(0, 8) })
    Utils.Create("UIPadding", btn, {
        PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4)
    })

    local glow = Utils.Create("ImageLabel", btn, {
        Name = "Glow", Size = UDim2.new(1, 16, 1, 16),
        Position = UDim2.new(0, -8, 0, -8),
        BackgroundTransparency = 1, Image = "rbxassetid://5028857084",
        ImageColor3 = primaryColor or THEME.AccentRed,
        ImageTransparency = 0.9, ZIndex = zIndex and zIndex - 1 or 9
    })

    btn.MouseEnter:Connect(function()
        Utils.Tween(btn, { BackgroundColor3 = primaryColor:Lerp(Color3.new(1, 1, 1), 0.2) }, 0.2)
        Utils.Tween(glow, { ImageTransparency = 0.7 }, 0.3)
    end)
    btn.MouseLeave:Connect(function()
        Utils.Tween(btn, { BackgroundColor3 = primaryColor or THEME.AccentRed }, 0.2)
        Utils.Tween(glow, { ImageTransparency = 0.9 }, 0.3)
    end)
    btn.MouseButton1Down:Connect(function()
        Utils.Tween(btn, { Size = UDim2.new(size.X.Scale * 0.97, size.X.Offset * 0.97, size.Y.Scale * 0.97, size.Y.Offset * 0.97) }, 0.1)
    end)
    btn.MouseButton1Up:Connect(function()
        Utils.Tween(btn, { Size = size }, 0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)

    return btn
end

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE SPLASH SCREEN
-- ═══════════════════════════════════════════════════════════════════════

function GUI.BuildSplashScreen()
    local splash = GUI.CreateStyledFrame(GUI.MainContainer, "SplashScreen",
        UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), THEME.Primary, 0, 100)

    -- Particles (responsive count based on screen)
    for i = 1, 15 do
        local particle = Utils.Create("Frame", splash, {
            Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5)),
            Position = UDim2.new(math.random(), 0, math.random(), 0),
            BackgroundColor3 = THEME.AccentRed,
            BackgroundTransparency = math.random(3, 8) / 10,
            BorderSizePixel = 0, ZIndex = 101
        })
        Utils.Create("UICorner", particle, { CornerRadius = UDim.new(1, 0) })

        task.spawn(function()
            while particle and particle.Parent do
                Utils.Tween(particle, {
                    Position = UDim2.new(particle.Position.X.Scale, math.random(-30, 30),
                        particle.Position.Y.Scale - 0.08, math.random(-30, 30)),
                    BackgroundTransparency = math.random(3, 9) / 10
                }, math.random(3, 6), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(math.random(3, 6))
            end
        end)
    end

    -- Logo container - responsive (80% width)
    local logoContainer = Utils.Create("Frame", splash, {
        Name = "LogoContainer",
        Size = UDim2.new(0.8, 0, 0, 0),
        Position = UDim2.new(0.1, 0, 0.35, 0),
        BackgroundTransparency = 1, ZIndex = 102,
        AutomaticSize = Enum.AutomaticSize.Y
    })

    Utils.Create("UIListLayout", logoContainer, {
        Padding = UDim.new(0, 8),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    local logoText = Utils.Create("TextLabel", logoContainer, {
        Name = "LogoText", Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1, Text = "NAV AI",
        TextColor3 = THEME.TextPrimary, Font = Enum.Font.FredokaOne,
        TextSize = 72, TextScaled = true, TextTransparency = 1,
        ZIndex = 103, LayoutOrder = 1
    })
    Utils.Create("UITextSizeConstraint", logoText, { MaxTextSize = 96, MinTextSize = 32 })

    local subtitle = Utils.Create("TextLabel", logoContainer, {
        Name = "Subtitle", Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1, Text = "PRO EDITION",
        TextColor3 = THEME.AccentRed, Font = Enum.Font.GothamBold,
        TextSize = 24, TextScaled = true, TextTransparency = 1,
        ZIndex = 103, LayoutOrder = 2
    })
    Utils.Create("UITextSizeConstraint", subtitle, { MaxTextSize = 32, MinTextSize = 14 })

    local line = Utils.Create("Frame", logoContainer, {
        Name = "Line", Size = UDim2.new(0, 0, 0, 3),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0,
        ZIndex = 103, LayoutOrder = 3
    })

    local desc = Utils.Create("TextLabel", logoContainer, {
        Name = "Description", Size = UDim2.new(1, -20, 0, 0),
        BackgroundTransparency = 1,
        Text = "Advanced AI Navigation & Behavioral Intelligence System",
        TextColor3 = THEME.TextSecondary, Font = Enum.Font.GothamBold,
        TextSize = 14, TextScaled = true, TextTransparency = 1,
        TextWrapped = true, ZIndex = 103, LayoutOrder = 4
    })
    Utils.Create("UITextSizeConstraint", desc, { MaxTextSize = 18, MinTextSize = 10 })

    local versionBadge = Utils.Create("Frame", logoContainer, {
        Name = "VersionBadge", Size = UDim2.new(0, 70, 0, 26),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0,
        BackgroundTransparency = 1, ZIndex = 103, LayoutOrder = 5
    })
    Utils.Create("UICorner", versionBadge, { CornerRadius = UDim.new(0, 13) })
    Utils.Create("UIAspectRatioConstraint", versionBadge, { AspectRatio = 2.7 })

    Utils.Create("TextLabel", versionBadge, {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Text = "v2.1", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 14, ZIndex = 104
    })

    return { Frame = splash, LogoText = logoText, Subtitle = subtitle,
        Line = line, Desc = desc, VersionBadge = versionBadge }
end

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE TOP CENTER TOGGLE BUTTON
-- ═══════════════════════════════════════════════════════════════════════

function GUI.BuildTopToggle()
    local toggleContainer = Utils.Create("Frame", GUI.MainContainer, {
        Name = "TopToggle",
        Size = UDim2.new(0.35, 0, 0, 40),
        Position = UDim2.new(0.5, 0, 0, -50),
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1, ZIndex = 200
    })

    Utils.Create("UIAspectRatioConstraint", toggleContainer, { AspectRatio = 5, DominantAxis = Enum.DominantAxis.Width })

    local bg = Utils.Create("Frame", toggleContainer, {
        Name = "Background", Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = THEME.Surface, BorderSizePixel = 0, ZIndex = 200
    })
    Utils.Create("UICorner", bg, { CornerRadius = UDim.new(1, 0) })
    Utils.Create("UIStroke", bg, { Color = THEME.AccentRed, Thickness = 2, Transparency = 0.5 })

    local statusDot = Utils.Create("Frame", toggleContainer, {
        Name = "StatusDot", Size = UDim2.new(0, 8, 0, 8),
        Position = UDim2.new(0, 12, 0.5, -4),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 202
    })
    Utils.Create("UICorner", statusDot, { CornerRadius = UDim.new(1, 0) })

    local text = Utils.Create("TextLabel", toggleContainer, {
        Name = "ToggleText", Size = UDim2.new(1, -30, 1, 0),
        Position = UDim2.new(0, 24, 0, 0), BackgroundTransparency = 1,
        Text = "فتح الواجهة", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 13,
        TextScaled = true, ZIndex = 202
    })
    Utils.Create("UITextSizeConstraint", text, { MaxTextSize = 15, MinTextSize = 9 })

    local clickArea = Utils.Create("TextButton", toggleContainer, {
        Name = "ClickArea", Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1, Text = "", ZIndex = 203
    })

    clickArea.MouseEnter:Connect(function()
        Utils.Tween(bg, { BackgroundColor3 = THEME.Elevated }, 0.2)
        Utils.Tween(bg:FindFirstChildOfClass("UIStroke"), { Transparency = 0.2 }, 0.2)
    end)
    clickArea.MouseLeave:Connect(function()
        Utils.Tween(bg, { BackgroundColor3 = THEME.Surface }, 0.2)
        Utils.Tween(bg:FindFirstChildOfClass("UIStroke"), { Transparency = 0.5 }, 0.2)
    end)

    return { Container = toggleContainer, Background = bg,
        StatusDot = statusDot, Text = text, ClickArea = clickArea }
end

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE MAIN CONTROL PANEL
-- ═══════════════════════════════════════════════════════════════════════

function GUI.BuildMainPanel()
    -- Panel: 90% width, auto height, max width 400px
    local panel = GUI.CreateStyledFrame(GUI.MainContainer, "MainPanel",
        UDim2.new(0.9, 0, 0, 0), UDim2.new(-1, 0, 0.5, 0),
        THEME.Secondary, 16, 60)
    panel.AutomaticSize = Enum.AutomaticSize.Y
    panel.Position = UDim2.new(-0.95, 0, 0.5, 0) -- Start off-screen
    panel.AnchorPoint = Vector2.new(0, 0.5)

    -- Max width constraint for large screens
    Utils.Create("UISizeConstraint", panel, { MaxSize = Vector2.new(400, math.huge) })

    -- Header
    local header = Utils.Create("Frame", panel, {
        Name = "Header", Size = UDim2.new(1, 0, 0, 60),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 61
    })
    Utils.Create("UICorner", header, { CornerRadius = UDim.new(0, 16) })
    Utils.Create("Frame", header, {
        Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 1, -20),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 61
    })

    Utils.Create("TextLabel", header, {
        Size = UDim2.new(1, -50, 0, 30), Position = UDim2.new(0, 12, 0, 8),
        BackgroundTransparency = 1, Text = "مركز التحكم",
        TextColor3 = THEME.TextPrimary, Font = Enum.Font.FredokaOne,
        TextSize = 22, TextScaled = true, ZIndex = 62
    })

    Utils.Create("TextLabel", header, {
        Size = UDim2.new(1, -50, 0, 16), Position = UDim2.new(0, 12, 0, 38),
        BackgroundTransparency = 1, Text = "AI Control Center",
        TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBold,
        TextSize = 10, TextScaled = true, TextTransparency = 0.3, ZIndex = 62
    })

    local closeBtn = Utils.Create("TextButton", header, {
        Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(1, -36, 0, 8),
        BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9,
        Text = "✕", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 14,
        AutoButtonColor = false, ZIndex = 63
    })
    Utils.Create("UICorner", closeBtn, { CornerRadius = UDim.new(0, 8) })

    -- Content with padding
    local content = Utils.Create("Frame", panel, {
        Name = "Content", Size = UDim2.new(1, -16, 0, 0),
        Position = UDim2.new(0, 8, 0, 65),
        BackgroundTransparency = 1, ZIndex = 61,
        AutomaticSize = Enum.AutomaticSize.Y
    })

    Utils.Create("UIListLayout", content, {
        Padding = UDim.new(0, 10),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder
    })
    Utils.Create("UIPadding", content, {
        PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4),
        PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 12)
    })

    -- Status Card
    local statusCard = GUI.CreateStyledFrame(content, "StatusCard",
        UDim2.new(1, 0, 0, 70), UDim2.new(0, 0, 0, 0), THEME.Surface, 12, 62)
    statusCard.LayoutOrder = 1

    local statusIcon = Utils.Create("Frame", statusCard, {
        Size = UDim2.new(0, 10, 0, 10), Position = UDim2.new(0, 12, 0, 14),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 63
    })
    Utils.Create("UICorner", statusIcon, { CornerRadius = UDim.new(1, 0) })

    local statusLabel = Utils.Create("TextLabel", statusCard, {
        Size = UDim2.new(1, -40, 0, 20), Position = UDim2.new(0, 28, 0, 10),
        BackgroundTransparency = 1, Text = "الحالة: غير نشط",
        TextColor3 = THEME.TextPrimary, Font = Enum.Font.GothamBold,
        TextSize = 14, TextScaled = true, ZIndex = 63
    })
    Utils.Create("UITextSizeConstraint", statusLabel, { MaxTextSize = 16, MinTextSize = 10 })

    local statusDetail = Utils.Create("TextLabel", statusCard, {
        Size = UDim2.new(1, -24, 0, 18), Position = UDim2.new(0, 12, 0, 38),
        BackgroundTransparency = 1, Text = "في وضع الاستعداد",
        TextColor3 = THEME.TextMuted, Font = Enum.Font.GothamBold,
        TextSize = 12, TextScaled = true, ZIndex = 63
    })
    Utils.Create("UITextSizeConstraint", statusDetail, { MaxTextSize = 14, MinTextSize = 9 })

    -- Mode Card
    local modeCard = GUI.CreateStyledFrame(content, "ModeCard",
        UDim2.new(1, 0, 0, 90), UDim2.new(0, 0, 0, 0), THEME.Surface, 12, 62)
    modeCard.LayoutOrder = 2

    Utils.Create("TextLabel", modeCard, {
        Size = UDim2.new(1, -16, 0, 20), Position = UDim2.new(0, 10, 0, 8),
        BackgroundTransparency = 1, Text = "وضع الذكاء الاصطناعي",
        TextColor3 = THEME.TextSecondary, Font = Enum.Font.GothamBold,
        TextSize = 12, TextScaled = true, ZIndex = 63
    })

    local modeOffensive = GUI.CreateResponsiveButton(modeCard, "ModeOffensive",
        UDim2.new(0.48, 0, 0, 36), UDim2.new(0, 6, 0, 34),
        "هجومي", THEME.AccentRed, 63)

    local modeDefensive = GUI.CreateResponsiveButton(modeCard, "ModeDefensive",
        UDim2.new(0.48, 0, 0, 36), UDim2.new(0.52, -2, 0, 34),
        "دفاعي", THEME.Elevated, 63)

    -- Performance Card
    local perfCard = GUI.CreateStyledFrame(content, "PerfCard",
        UDim2.new(1, 0, 0, 90), UDim2.new(0, 0, 0, 0), THEME.Surface, 12, 62)
    perfCard.LayoutOrder = 3

    Utils.Create("TextLabel", perfCard, {
        Size = UDim2.new(1, -16, 0, 20), Position = UDim2.new(0, 10, 0, 8),
        BackgroundTransparency = 1, Text = "مستوى الأداء",
        TextColor3 = THEME.TextSecondary, Font = Enum.Font.GothamBold,
        TextSize = 12, TextScaled = true, ZIndex = 63
    })

    local perfLow = GUI.CreateResponsiveButton(perfCard, "PerfLow",
        UDim2.new(0.3, -4, 0, 32), UDim2.new(0, 4, 0, 32),
        "منخفض", THEME.Elevated, 63)

    local perfMed = GUI.CreateResponsiveButton(perfCard, "PerfMed",
        UDim2.new(0.3, -4, 0, 32), UDim2.new(0.35, -2, 0, 32),
        "متوسط", THEME.AccentRed, 63)

    local perfHigh = GUI.CreateResponsiveButton(perfCard, "PerfHigh",
        UDim2.new(0.3, -4, 0, 32), UDim2.new(0.7, -2, 0, 32),
        "عالي", THEME.Elevated, 63)

    -- Action Button
    local actionBtn = GUI.CreateResponsiveButton(content, "ActionBtn",
        UDim2.new(1, 0, 0, 44), UDim2.new(0, 0, 0, 0),
        "▶ تشغيل النظام", THEME.Success, 62)
    actionBtn.LayoutOrder = 4

    -- Stats
    local statsFrame = Utils.Create("Frame", content, {
        Size = UDim2.new(1, 0, 0, 24), BackgroundTransparency = 1,
        ZIndex = 62, LayoutOrder = 5
    })

    local statLabels = {}
    local statNames = { "FPS", "PATH", "STATE" }
    for i, name in ipairs(statNames) do
        local lbl = Utils.Create("TextLabel", statsFrame, {
            Size = UDim2.new(0.33, -4, 1, 0),
            Position = UDim2.new((i-1) * 0.33, 2, 0, 0),
            BackgroundTransparency = 1, Text = name .. ": --",
            TextColor3 = THEME.TextMuted, Font = Enum.Font.GothamBold,
            TextSize = 10, TextScaled = true, ZIndex = 63
        })
        Utils.Create("UITextSizeConstraint", lbl, { MaxTextSize = 12, MinTextSize = 8 })
        statLabels[name] = lbl
    end

    return {
        Panel = panel, CloseBtn = closeBtn,
        StatusIcon = statusIcon, StatusLabel = statusLabel,
        StatusDetail = statusDetail, ModeOffensive = modeOffensive,
        ModeDefensive = modeDefensive, PerfLow = perfLow,
        PerfMed = perfMed, PerfHigh = perfHigh,
        ActionBtn = actionBtn, StatLabels = statLabels
    }
end

-- ═══════════════════════════════════════════════════════════════════════
-- ADVANCED AI NAVIGATION SYSTEM v2.1 (Same robust AI, mobile UI)
-- ═══════════════════════════════════════════════════════════════════════

local AIPro = {}
AIPro.__index = AIPro

local AIConfig = {
    [1] = { PathUpdateRate = 1.2, RaycastDistance = 25, StuckThreshold = 4,
        TargetRange = 50, AgentRadius = 2.5, AgentHeight = 5, ScanFrequency = 1.0 },
    [2] = { PathUpdateRate = 0.6, RaycastDistance = 50, StuckThreshold = 2.5,
        TargetRange = 100, AgentRadius = 2, AgentHeight = 5, ScanFrequency = 0.5 },
    [3] = { PathUpdateRate = 0.25, RaycastDistance = 80, StuckThreshold = 1.5,
        TargetRange = 150, AgentRadius = 1.5, AgentHeight = 5, ScanFrequency = 0.2 }
}

function AIPro.new(character)
    local self = setmetatable({}, AIPro)
    self.Character = character
    self.Humanoid = character:WaitForChild("Humanoid")
    self.RootPart = character:WaitForChild("HumanoidRootPart")

    self.States = { IDLE = "IDLE", OFFENSIVE = "OFFENSIVE", DEFENSIVE = "DEFENSIVE",
        FLANKING = "FLANKING", STUCK = "STUCK", RECOVERING = "RECOVERING" }
    self.State = self.States.IDLE
    self.PreviousState = self.States.IDLE

    self.IsRunning = false
    self.CurrentTarget = nil
    self.LastTargetPos = nil
    self.TargetVelocity = Vector3.new()
    self.CurrentPath = nil
    self.Waypoints = {}
    self.WaypointIndex = 1
    self.PathFailures = 0
    self.LastPathTime = 0
    self.PositionHistory = {}
    self.StuckCounter = 0
    self.RecoveryAttempts = 0
    self.NearbyEntities = {}
    self.Threats = {}
    self.Obstacles = {}
    self.LastScanTime = 0
    self.CurrentTier = 2
    self.Config = AIConfig[2]
    self.Stats = { PathsComputed = 0, ObstaclesAvoided = 0,
        StateChanges = 0, TargetsAcquired = 0, StuckEvents = 0 }
    return self
end

function AIPro:SetPerformanceTier(tier)
    self.CurrentTier = math.clamp(tier, 1, 3)
    self.Config = AIConfig[self.CurrentTier]
    self.PathParams = { AgentRadius = self.Config.AgentRadius,
        AgentHeight = self.Config.AgentHeight, AgentCanJump = true,
        AgentCanClimb = false, WaypointSpacing = math.max(2, self.Config.AgentRadius) }
end

function AIPro:MultiRaycast(startPos, endPos, angles)
    angles = angles or {0}
    local baseDir = (endPos - startPos).Unit
    local distance = math.min((endPos - startPos).Magnitude, self.Config.RaycastDistance)
    local results = {}
    local rayParams = RaycastParams.new()
    rayParams.FilterDescendantsInstances = { self.Character }
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    rayParams.IgnoreWater = true
    for _, angle in ipairs(angles) do
        local rotatedDir = baseDir
        if angle ~= 0 then rotatedDir = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), math.rad(angle)) * baseDir end
        local result = workspace:Raycast(startPos, rotatedDir * distance, rayParams)
        table.insert(results, { Hit = result ~= nil, Position = result and result.Position or startPos + rotatedDir * distance,
            Normal = result and result.Normal or Vector3.new(), Instance = result and result.Instance or nil, Angle = angle })
    end
    return results
end

function AIPro:PredictTargetPosition(targetPos, dt)
    if not self.LastTargetPos then self.LastTargetPos = targetPos return targetPos end
    local rawVelocity = (targetPos - self.LastTargetPos) / math.max(dt, 0.016)
    self.TargetVelocity = self.TargetVelocity:Lerp(rawVelocity, 0.3)
    self.LastTargetPos = targetPos
    return targetPos + self.TargetVelocity * 0.5
end

function AIPro:AnalyzeObstacles(targetPos)
    local myPos = self.RootPart.Position
    local rayResults = self:MultiRaycast(myPos + Vector3.new(0, 2, 0), targetPos, {-30, -15, 0, 15, 30})
    local obstacles = {}
    local bestAngle, maxClearance = 0, 0
    for _, result in ipairs(rayResults) do
        if result.Hit then table.insert(obstacles, { Position = result.Position, Normal = result.Normal,
            Instance = result.Instance, Distance = (result.Position - myPos).Magnitude })
        else
            local clearance = self.Config.RaycastDistance - (result.Position - myPos).Magnitude
            if clearance > maxClearance then maxClearance = clearance bestAngle = result.Angle end
        end
    end
    self.Obstacles = obstacles
    return obstacles, bestAngle, maxClearance
end

function AIPro:CalculateTacticalFlank(obstaclePos, targetPos, threatLevel)
    local myPos = self.RootPart.Position
    local toObstacle = (obstaclePos - myPos).Unit
    local right = Vector3.new(-toObstacle.Z, 0, toObstacle.X).Unit
    local left = -right
    local testDist = self.Config.AgentRadius * 4
    local rightClear = not self:MultiRaycast(obstaclePos, obstaclePos + right * testDist, {0})[1].Hit
    local leftClear = not self:MultiRaycast(obstaclePos, obstaclePos + left * testDist, {0})[1].Hit
    local flankDir
    if rightClear and leftClear then
        local rightToTarget = (obstaclePos + right * 10 - targetPos).Magnitude
        local leftToTarget = (obstaclePos + left * 10 - targetPos).Magnitude
        flankDir = (rightToTarget < leftToTarget) and right or left
    elseif rightClear then flankDir = right
    elseif leftClear then flankDir = left
    else return obstaclePos + Vector3.new(0, 10, 0) end
    return obstaclePos + flankDir * (10 * (1 + (threatLevel or 0) * 0.5))
end

function AIPro:ComputeSmartPath(targetPos)
    local success, path = pcall(function()
        local path = PathfindingService:CreatePath(self.PathParams)
        path:ComputeAsync(self.RootPart.Position, targetPos)
        return path
    end)
    if success and path and path.Status == Enum.PathStatus.Success then
        self.CurrentPath = path self.Waypoints = path:GetWaypoints()
        self.WaypointIndex = 1 self.PathFailures = 0
        self.Stats.PathsComputed = self.Stats.PathsComputed + 1
        return true, "SUCCESS"
    end
    self.PathFailures = self.PathFailures + 1
    return false, path and path.Status.Name or "ERROR"
end

function AIPro:SmartScan()
    local currentTime = tick()
    if currentTime - self.LastScanTime < self.Config.ScanFrequency then return self.NearbyEntities end
    self.LastScanTime = currentTime
    local myPos = self.RootPart.Position
    local entities, threats = {}, {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj ~= self.Character then
            local humanoid = obj:FindFirstChildOfClass("Humanoid")
            local rootPart = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")
            if humanoid and rootPart and humanoid.Health > 0 then
                local distance = (rootPart.Position - myPos).Magnitude
                if distance <= self.Config.TargetRange then
                    local hasLOS = self:MultiRaycast(myPos + Vector3.new(0, 2, 0), rootPart.Position + Vector3.new(0, 2, 0), {0})[1].Hit == false
                    local hasObj = obj:GetAttribute("HasObjective") == true
                    local charTool = obj:FindFirstChildOfClass("Tool")
                    if charTool and charTool:GetAttribute("IsObjective") then hasObj = true end
                    local threatLevel = 0
                    local lookDir = rootPart.CFrame.LookVector
                    local toUs = (myPos - rootPart.Position).Unit
                    if lookDir:Dot(toUs) > 0.6 and distance < 40 then threatLevel = threatLevel + 2 end
                    if hasObj then threatLevel = threatLevel + 1 end
                    if humanoid.WalkSpeed > 20 then threatLevel = threatLevel + 0.5 end
                    local entity = { Model = obj, Humanoid = humanoid, RootPart = rootPart,
                        Distance = distance, HasObjective = hasObj, ThreatLevel = threatLevel,
                        HasLOS = hasLOS, LastSeen = tick() }
                    table.insert(entities, entity)
                    if threatLevel >= 1.5 then table.insert(threats, entity) end
                end
            end
        end
    end
    table.sort(entities, function(a, b) if a.HasObjective ~= b.HasObjective then return a.HasObjective end return a.Distance < b.Distance end)
    self.NearbyEntities = entities self.Threats = threats
    return entities
end

function AIPro:EvaluateState()
    local prevState = self.State
    if not self.IsRunning then self.State = self.States.IDLE
    else
        local threatCount = #self.Threats
        local avgThreatLevel = 0
        for _, t in ipairs(self.Threats) do avgThreatLevel = avgThreatLevel + t.ThreatLevel end
        if #self.Threats > 0 then avgThreatLevel = avgThreatLevel / #self.Threats end
        if self.State == self.States.OFFENSIVE then
            if threatCount >= 3 or avgThreatLevel >= 3 then self.State = self.States.DEFENSIVE
            elseif self.StuckCounter >= 2 then self.State = self.States.FLANKING end
        elseif self.State == self.States.DEFENSIVE then
            if threatCount == 0 then self.State = self.States.OFFENSIVE
            elseif self.StuckCounter >= 2 then self.State = self.States.FLANKING end
        elseif self.State == self.States.FLANKING then
            if self.StuckCounter == 0 then self.State = (threatCount >= 2) and self.States.DEFENSIVE or self.States.OFFENSIVE end
        elseif self.State == self.States.STUCK then
            if self.RecoveryAttempts > 3 then self.State = self.States.RECOVERING end
        elseif self.State == self.States.RECOVERING then
            if self.StuckCounter == 0 then self.State = self.States.OFFENSIVE end
        end
        if self.State == self.States.IDLE and self.IsRunning then self.State = self.States.OFFENSIVE end
    end
    if self.State ~= prevState then self.Stats.StateChanges = self.Stats.StateChanges + 1 self.PreviousState = prevState end
end

function AIPro:SelectOptimalTarget()
    if #self.NearbyEntities == 0 then return nil end
    if self.State == self.States.OFFENSIVE or self.State == self.States.FLANKING then
        for _, entity in ipairs(self.NearbyEntities) do
            if entity.HasObjective then self.Stats.TargetsAcquired = self.Stats.TargetsAcquired + 1 return entity end
        end
        for _, entity in ipairs(self.NearbyEntities) do if entity.HasLOS then return entity end end
        return self.NearbyEntities[1]
    elseif self.State == self.States.DEFENSIVE then
        if #self.Threats == 0 then return nil end
        local avgThreatPos = Vector3.new(0, 0, 0)
        for _, threat in ipairs(self.Threats) do avgThreatPos = avgThreatPos + threat.RootPart.Position end
        avgThreatPos = avgThreatPos / #self.Threats
        local awayDir = (self.RootPart.Position - avgThreatPos).Unit
        local retreatPos = self.RootPart.Position + awayDir * 40
        local groundResult = workspace:Raycast(retreatPos + Vector3.new(0, 50, 0), Vector3.new(0, -100, 0))
        if groundResult then retreatPos = groundResult.Position + Vector3.new(0, 2, 0) end
        return { RootPart = { Position = retreatPos }, IsRetreatPoint = true }
    end
    return nil
end

function AIPro:CheckStuck()
    local currentPos = self.RootPart.Position
    table.insert(self.PositionHistory, 1, { Pos = currentPos, Time = tick() })
    while #self.PositionHistory > 20 do table.remove(self.PositionHistory) end
    if #self.PositionHistory >= 10 then
        local oldPos = self.PositionHistory[10].Pos
        local distance = (currentPos - oldPos).Magnitude
        if distance < 2 then
            self.StuckCounter = self.StuckCounter + 1
            if self.StuckCounter > 2 then self.Stats.StuckEvents = self.Stats.StuckEvents + 1 end
        else self.StuckCounter = math.max(0, self.StuckCounter - 1) self.RecoveryAttempts = 0 end
    end
end

function AIPro:Update(deltaTime)
    if not self.IsRunning then return end
    if not self.Character or not self.Humanoid or not self.RootPart then return end
    if self.Humanoid.Health <= 0 then return end
    self:CheckStuck()
    self:SmartScan()
    self:EvaluateState()
    self.LastPathTime = self.LastPathTime + deltaTime
    local shouldRepath = self.LastPathTime >= self.Config.PathUpdateRate
    if shouldRepath or self.StuckCounter >= 2 then
        self.LastPathTime = 0
        local target = self:SelectOptimalTarget()
        if target then
            local targetPos = target.RootPart.Position
            if not target.IsRetreatPoint then targetPos = self:PredictTargetPosition(targetPos, deltaTime) end
            local obstacles, bestAngle, clearance = self:AnalyzeObstacles(targetPos)
            if #obstacles == 0 or clearance > 20 then
                self.Humanoid:MoveTo(targetPos)
                self.Waypoints = {} self.CurrentPath = nil
            else
                local pathSuccess, status = self:ComputeSmartPath(targetPos)
                if not pathSuccess and #obstacles > 0 then
                    local flankPos = self:CalculateTacticalFlank(obstacles[1].Position, targetPos, #self.Threats)
                    self:ComputeSmartPath(flankPos)
                    self.Stats.ObstaclesAvoided = self.Stats.ObstaclesAvoided + 1
                end
            end
            self.CurrentTarget = target
        else self.Humanoid:MoveTo(self.RootPart.Position) self.Waypoints = {} end
    end
    if self.CurrentPath and #self.Waypoints > 0 then
        if self.WaypointIndex <= #self.Waypoints then
            local wp = self.Waypoints[self.WaypointIndex]
            local dist = (wp.Position - self.RootPart.Position).Magnitude
            if dist < 3 then
                self.WaypointIndex = self.WaypointIndex + 1
                if self.WaypointIndex <= #self.Waypoints then self.Humanoid:MoveTo(self.Waypoints[self.WaypointIndex].Position) end
            elseif self.WaypointIndex == 1 then self.Humanoid:MoveTo(wp.Position) end
            if wp.Action == Enum.PathWaypointAction.Jump then self.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
    if self.State == self.States.STUCK or self.State == self.States.RECOVERING then
        self.RecoveryAttempts = self.RecoveryAttempts + 1
        self.Humanoid:MoveTo(self.RootPart.Position + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10)))
        task.wait(0.5)
    end
end

function AIPro:Toggle()
    self.IsRunning = not self.IsRunning
    if self.IsRunning then
        self.State = self.States.OFFENSIVE
        self.StuckCounter = 0 self.RecoveryAttempts = 0 self.PositionHistory = {}
    else
        self.Humanoid:MoveTo(self.RootPart.Position)
        self.State = self.States.IDLE self.CurrentTarget = nil
    end
    return self.IsRunning
end

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE CONTROLLER & UI FLOW
-- ═══════════════════════════════════════════════════════════════════════

local Controller = {
    AI = nil, PanelOpen = false,
    SelectedMode = 1, SelectedPerf = 2, IsRunning = false
}

function Controller.Init()
    GUI.Init()
    local splash = GUI.BuildSplashScreen()
    local topToggle = GUI.BuildTopToggle()
    local mainPanel = GUI.BuildMainPanel()

    Controller.Splash = splash
    Controller.TopToggle = topToggle
    Controller.MainPanel = mainPanel

    Controller.SetupInteractions()
    Controller.PlayIntro()
end

function Controller.SetupInteractions()
    Controller.TopToggle.ClickArea.MouseButton1Click:Connect(function()
        Controller.TogglePanel()
    end)
    Controller.MainPanel.CloseBtn.MouseButton1Click:Connect(function()
        Controller.TogglePanel()
    end)
    Controller.MainPanel.ModeOffensive.MouseButton1Click:Connect(function() Controller.SetMode(1) end)
    Controller.MainPanel.ModeDefensive.MouseButton1Click:Connect(function() Controller.SetMode(2) end)
    Controller.MainPanel.PerfLow.MouseButton1Click:Connect(function() Controller.SetPerf(1) end)
    Controller.MainPanel.PerfMed.MouseButton1Click:Connect(function() Controller.SetPerf(2) end)
    Controller.MainPanel.PerfHigh.MouseButton1Click:Connect(function() Controller.SetPerf(3) end)
    Controller.MainPanel.ActionBtn.MouseButton1Click:Connect(function() Controller.ToggleAI() end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.F1 then Controller.TogglePanel()
        elseif input.KeyCode == Enum.KeyCode.F2 then Controller.ToggleAI() end
    end)
end

function Controller.SetMode(mode)
    Controller.SelectedMode = mode
    local activeColor, inactiveColor = THEME.AccentRed, THEME.Elevated
    Controller.MainPanel.ModeOffensive.BackgroundColor3 = (mode == 1) and activeColor or inactiveColor
    Controller.MainPanel.ModeDefensive.BackgroundColor3 = (mode == 2) and activeColor or inactiveColor
    if Controller.AI and Controller.AI.IsRunning then
        Controller.AI.State = (mode == 1) and Controller.AI.States.OFFENSIVE or Controller.AI.States.DEFENSIVE
    end
end

function Controller.SetPerf(tier)
    Controller.SelectedPerf = tier
    local activeColor, inactiveColor = THEME.AccentRed, THEME.Elevated
    Controller.MainPanel.PerfLow.BackgroundColor3 = (tier == 1) and activeColor or inactiveColor
    Controller.MainPanel.PerfMed.BackgroundColor3 = (tier == 2) and activeColor or inactiveColor
    Controller.MainPanel.PerfHigh.BackgroundColor3 = (tier == 3) and activeColor or inactiveColor
    if Controller.AI then Controller.AI:SetPerformanceTier(tier) end
end

function Controller.ToggleAI()
    if not Controller.AI then
        local character = player.Character or player.CharacterAdded:Wait()
        Controller.AI = AIPro.new(character)
        Controller.AI:SetPerformanceTier(Controller.SelectedPerf)
    end
    Controller.IsRunning = Controller.AI:Toggle()
    if Controller.IsRunning then
        Controller.MainPanel.ActionBtn.Text = "⏹ إيقاف النظام"
        Controller.MainPanel.ActionBtn.BackgroundColor3 = THEME.Danger
        Controller.MainPanel.StatusLabel.Text = "الحالة: نشط"
        Controller.MainPanel.StatusDetail.Text = "وضع: " .. (Controller.SelectedMode == 1 and "هجومي" or "دفاعي")
        Controller.MainPanel.StatusIcon.BackgroundColor3 = THEME.Success
        Controller.TopToggle.StatusDot.BackgroundColor3 = THEME.Success
        Controller.TopToggle.Text.Text = "النظام يعمل"
    else
        Controller.MainPanel.ActionBtn.Text = "▶ تشغيل النظام"
        Controller.MainPanel.ActionBtn.BackgroundColor3 = THEME.Success
        Controller.MainPanel.StatusLabel.Text = "الحالة: غير نشط"
        Controller.MainPanel.StatusDetail.Text = "في وضع الاستعداد"
        Controller.MainPanel.StatusIcon.BackgroundColor3 = THEME.AccentRed
        Controller.TopToggle.StatusDot.BackgroundColor3 = THEME.AccentRed
        Controller.TopToggle.Text.Text = "النظام متوقف"
    end
end

function Controller.TogglePanel()
    Controller.PanelOpen = not Controller.PanelOpen
    if Controller.PanelOpen then
        Utils.Tween(Controller.MainPanel.Panel, { Position = UDim2.new(0.05, 0, 0.5, 0) },
            0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        Controller.TopToggle.Text.Text = "إخفاء الواجهة"
    else
        Utils.Tween(Controller.MainPanel.Panel, { Position = UDim2.new(-0.95, 0, 0.5, 0) },
            0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        Controller.TopToggle.Text.Text = Controller.IsRunning and "إظهار الواجهة" or "فتح الواجهة"
    end
end

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE CINEMATIC INTRO
-- ═══════════════════════════════════════════════════════════════════════

function Controller.PlayIntro()
    task.spawn(function()
        -- Logo reveal
        Utils.Tween(Controller.Splash.LogoText, { TextTransparency = 0 }, 1.0, Enum.EasingStyle.Quart)
        task.wait(0.3)
        Utils.Tween(Controller.Splash.Subtitle, { TextTransparency = 0 }, 0.5)
        Utils.Tween(Controller.Splash.Line, { Size = UDim2.new(0.7, 0, 0, 3) }, 0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        task.wait(0.4)
        Utils.Tween(Controller.Splash.Desc, { TextTransparency = 0 }, 0.5)
        Utils.Tween(Controller.Splash.VersionBadge, { BackgroundTransparency = 0 }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        task.wait(2.0)

        -- Exit splash
        Utils.Tween(Controller.Splash.Frame, { BackgroundTransparency = 1 }, 0.5)
        Utils.Tween(Controller.Splash.LogoText, { TextTransparency = 1 }, 0.5)
        Utils.Tween(Controller.Splash.Subtitle, { TextTransparency = 1 }, 0.4)
        Utils.Tween(Controller.Splash.Line, { BackgroundTransparency = 1 }, 0.4)
        Utils.Tween(Controller.Splash.Desc, { TextTransparency = 1 }, 0.4)
        Utils.Tween(Controller.Splash.VersionBadge, { BackgroundTransparency = 1 }, 0.4)
        task.wait(0.6)
        Controller.Splash.Frame.Visible = false

        -- Show top toggle
        Utils.Tween(Controller.TopToggle.Container, { Position = UDim2.new(0.5, 0, 0, 10) },
            0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        task.wait(0.3)

        -- Show main panel
        Controller.PanelOpen = true
        Utils.Tween(Controller.MainPanel.Panel, { Position = UDim2.new(0.05, 0, 0.5, 0) },
            0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)
end

-- ═══════════════════════════════════════════════════════════════════════
-- RESPONSIVE UPDATE LOOP
-- ═══════════════════════════════════════════════════════════════════════

local lastFpsUpdate = 0
local frameCount = 0
local currentFps = 60

RunService.Heartbeat:Connect(function(deltaTime)
    frameCount = frameCount + 1
    lastFpsUpdate = lastFpsUpdate + deltaTime
    if lastFpsUpdate >= 1 then
        currentFps = frameCount
        frameCount = 0
        lastFpsUpdate = 0
        if Controller.MainPanel and Controller.MainPanel.StatLabels then
            Controller.MainPanel.StatLabels.FPS.Text = "FPS: " .. currentFps
            if Controller.AI then
                Controller.MainPanel.StatLabels.PATH.Text = "PATH: " .. Controller.AI.Stats.PathsComputed
                Controller.MainPanel.StatLabels.STATE.Text = "ST: " .. string.sub(Controller.AI.State, 1, 4)
            end
        end
    end
    if Controller.AI and Controller.IsRunning then
        local success, err = pcall(function() Controller.AI:Update(deltaTime) end)
        if not success then
            warn("[NAV AI] Error: " .. tostring(err))
            Controller.IsRunning = false
            if Controller.AI then Controller.AI.IsRunning = false end
            Controller.MainPanel.ActionBtn.Text = "▶ تشغيل النظام"
            Controller.MainPanel.ActionBtn.BackgroundColor3 = THEME.Success
            Controller.MainPanel.StatusLabel.Text = "خطأ في النظام"
            Controller.MainPanel.StatusDetail.Text = "تم الإيقاف تلقائياً"
        end
    end
end)

player.CharacterAdded:Connect(function(newCharacter)
    task.wait(1)
    if Controller.IsRunning and Controller.AI then
        Controller.AI = AIPro.new(newCharacter)
        Controller.AI:SetPerformanceTier(Controller.SelectedPerf)
        Controller.AI.IsRunning = true
        Controller.AI.State = (Controller.SelectedMode == 1) and Controller.AI.States.OFFENSIVE or Controller.AI.States.DEFENSIVE
    end
end)

-- ═══════════════════════════════════════════════════════════════════════
-- INITIALIZATION
-- ═══════════════════════════════════════════════════════════════════════

Controller.Init()
print("[NAV AI PRO Mobile] System initialized! F1 = Toggle Panel | F2 = Toggle AI")

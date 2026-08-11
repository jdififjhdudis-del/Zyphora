--[[
    ╔══════════════════════════════════════════════════════════════════════╗
    ║         NAV AI PRO - Advanced AI Navigation System v2.0              ║
    ║         نظام ملاحة ذكاء اصطناعي متقدم - النسخة المحسنة               ║
    ╚══════════════════════════════════════════════════════════════════════╝

    Educational Research Project - Enhanced Edition
    مخصص للأغراض التعليمية والبحثية
]]

-- ═══════════════════════════════════════════════════════════════════════
-- SERVICES & CORE UTILITIES
-- ═══════════════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local PathfindingService = game:GetService("PathfindingService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ═══════════════════════════════════════════════════════════════════════
-- ADVANCED COLOR PALETTE & THEME SYSTEM
-- ═══════════════════════════════════════════════════════════════════════

local THEME = {
    Primary = Color3.fromHex("#0A0A0F"),
    Secondary = Color3.fromHex("#12121A"),
    Surface = Color3.fromHex("#1A1A25"),
    Elevated = Color3.fromHex("#252535"),
    AccentRed = Color3.fromHex("#FF2D2D"),
    AccentCrimson = Color3.fromHex("#E81123"),
    AccentGlow = Color3.fromHex("#FF4444"),
    Success = Color3.fromHex("#00E676"),
    Warning = Color3.fromHex("#FFD600"),
    Info = Color3.fromHex("#00B0FF"),
    Danger = Color3.fromHex("#FF1744"),
    TextPrimary = Color3.fromHex("#FFFFFF"),
    TextSecondary = Color3.fromHex("#B0B0C0"),
    TextMuted = Color3.fromHex("#6E6E80"),
}

-- ═══════════════════════════════════════════════════════════════════════
-- ADVANCED UTILITY MODULE
-- ═══════════════════════════════════════════════════════════════════════

local Utils = {}

function Utils.SafeCall(func, ...)
    local success, result = pcall(func, ...)
    if not success then
        warn("[NAV AI] Error: " .. tostring(result))
        return nil, result
    end
    return result, nil
end

function Utils.Create(className, parent, props)
    return Utils.SafeCall(function()
        local element = Instance.new(className)
        for prop, value in pairs(props or {}) do
            element[prop] = value
        end
        element.Parent = parent
        return element
    end)
end

function Utils.Tween(obj, props, duration, style, direction, delay)
    if not obj then return nil end
    local tweenInfo = TweenInfo.new(
        duration or 0.5,
        style or Enum.EasingStyle.Quart,
        direction or Enum.EasingDirection.Out,
        0, false, delay or 0
    )
    local tween = TweenService:Create(obj, tweenInfo, props)
    tween:Play()
    return tween
end

function Utils.Lerp(a, b, t)
    return a + (b - a) * math.clamp(t, 0, 1)
end

-- ═══════════════════════════════════════════════════════════════════════
-- VISUAL EFFECTS SYSTEM
-- ═══════════════════════════════════════════════════════════════════════

local FX = {}

function FX.TypewriterEffect(label, text, speed)
    label.Text = ""
    task.spawn(function()
        for i = 1, #text do
            if not label or not label.Parent then return end
            label.Text = string.sub(text, 1, i)
            task.wait(speed or 0.03)
        end
    end)
end

function FX.PulseEffect(element, minScale, maxScale, duration)
    local originalSize = element.Size
    task.spawn(function()
        while element and element.Parent do
            Utils.Tween(element, {
                Size = UDim2.new(originalSize.X.Scale * maxScale, originalSize.X.Offset,
                    originalSize.Y.Scale * maxScale, originalSize.Y.Offset)
            }, duration / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(duration / 2)
            if not element or not element.Parent then break end
            Utils.Tween(element, {
                Size = UDim2.new(originalSize.X.Scale * minScale, originalSize.X.Offset,
                    originalSize.Y.Scale * minScale, originalSize.Y.Offset)
            }, duration / 2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(duration / 2)
        end
    end)
end

function FX.Shake(element, intensity, duration)
    local originalPos = element.Position
    local startTime = tick()
    task.spawn(function()
        while tick() - startTime < duration do
            local progress = (tick() - startTime) / duration
            local currentIntensity = intensity * (1 - progress)
            element.Position = UDim2.new(
                originalPos.X.Scale, originalPos.X.Offset + math.random(-currentIntensity, currentIntensity),
                originalPos.Y.Scale, originalPos.Y.Offset + math.random(-currentIntensity, currentIntensity)
            )
            task.wait(0.03)
        end
        element.Position = originalPos
    end)
end

-- ═══════════════════════════════════════════════════════════════════════
-- ADVANCED GUI BUILDER
-- ═══════════════════════════════════════════════════════════════════════

local GUI = {}
GUI.ScreenGui = nil
GUI.MainContainer = nil

function GUI.Init()
    GUI.ScreenGui = Utils.Create("ScreenGui", playerGui, {
        Name = "NAVAIPRO",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 999
    })
    GUI.MainContainer = Utils.Create("Frame", GUI.ScreenGui, {
        Name = "MainContainer",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0
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

function GUI.CreateGradientButton(parent, name, size, pos, text, primaryColor, zIndex)
    local btn = Utils.Create("TextButton", parent, {
        Name = name, Size = size, Position = pos,
        BackgroundColor3 = primaryColor or THEME.AccentRed,
        Text = text or "Button", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 16,
        AutoButtonColor = false, ZIndex = zIndex or 10, ClipsDescendants = true
    })
    Utils.Create("UICorner", btn, { CornerRadius = UDim.new(0, 10) })

    local gradient = Utils.Create("UIGradient", btn, {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
            ColorSequenceKeypoint.new(1, Color3.new(0.8, 0.8, 0.9))
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.7),
            NumberSequenceKeypoint.new(1, 0.9)
        }),
        Rotation = 90
    })

    local glow = Utils.Create("ImageLabel", btn, {
        Name = "Glow", Size = UDim2.new(1, 20, 1, 20),
        Position = UDim2.new(0, -10, 0, -10),
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
        Utils.Tween(btn, { Size = UDim2.new(size.X.Scale * 0.95, size.X.Offset * 0.95,
            size.Y.Scale * 0.95, size.Y.Offset * 0.95) }, 0.1)
    end)
    btn.MouseButton1Up:Connect(function()
        Utils.Tween(btn, { Size = size }, 0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)

    return btn
end

-- ═══════════════════════════════════════════════════════════════════════
-- SPLASH SCREEN - CINEMATIC INTRO
-- ═══════════════════════════════════════════════════════════════════════

function GUI.BuildSplashScreen()
    local splash = GUI.CreateStyledFrame(GUI.MainContainer, "SplashScreen", 
        UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), THEME.Primary, 0, 100)

    -- Animated background particles
    for i = 1, 20 do
        local particle = Utils.Create("Frame", splash, {
            Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6)),
            Position = UDim2.new(math.random(), 0, math.random(), 0),
            BackgroundColor3 = THEME.AccentRed,
            BackgroundTransparency = math.random(3, 8) / 10,
            BorderSizePixel = 0, ZIndex = 101
        })
        Utils.Create("UICorner", particle, { CornerRadius = UDim.new(1, 0) })

        task.spawn(function()
            while particle and particle.Parent do
                Utils.Tween(particle, {
                    Position = UDim2.new(particle.Position.X.Scale, math.random(-50, 50), 
                        particle.Position.Y.Scale - 0.1, math.random(-50, 50)),
                    BackgroundTransparency = math.random(3, 9) / 10
                }, math.random(3, 6), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                task.wait(math.random(3, 6))
            end
        end)
    end

    local logoContainer = Utils.Create("Frame", splash, {
        Name = "LogoContainer", Size = UDim2.new(0, 500, 0, 300),
        Position = UDim2.new(0.5, -250, 0.4, -150),
        BackgroundTransparency = 1, ZIndex = 102
    })

    local logoText = Utils.Create("TextLabel", logoContainer, {
        Name = "LogoText", Size = UDim2.new(1, 0, 0, 100),
        Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1,
        Text = "NAV AI", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.FredokaOne, TextSize = 96,
        TextTransparency = 1, ZIndex = 103
    })

    local subtitle = Utils.Create("TextLabel", logoContainer, {
        Name = "Subtitle", Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0.45, 0), BackgroundTransparency = 1,
        Text = "PRO EDITION", TextColor3 = THEME.AccentRed,
        Font = Enum.Font.GothamBold, TextSize = 28,
        TextTransparency = 1, ZIndex = 103
    })

    local line = Utils.Create("Frame", logoContainer, {
        Name = "Line", Size = UDim2.new(0, 0, 0, 3),
        Position = UDim2.new(0.5, 0, 0.65, 0),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 103
    })

    local desc = Utils.Create("TextLabel", logoContainer, {
        Name = "Description", Size = UDim2.new(1, -40, 0, 60),
        Position = UDim2.new(0, 20, 0.72, 0), BackgroundTransparency = 1,
        Text = "Advanced AI Navigation & Behavioral Intelligence System",
        TextColor3 = THEME.TextSecondary, Font = Enum.Font.GothamBold,
        TextSize = 16, TextTransparency = 1, TextWrapped = true, ZIndex = 103
    })

    local versionBadge = Utils.Create("Frame", logoContainer, {
        Name = "VersionBadge", Size = UDim2.new(0, 80, 0, 28),
        Position = UDim2.new(0.5, -40, 0.92, 0),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0,
        BackgroundTransparency = 1, ZIndex = 103
    })
    Utils.Create("UICorner", versionBadge, { CornerRadius = UDim.new(0, 14) })

    Utils.Create("TextLabel", versionBadge, {
        Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1,
        Text = "v2.0", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 14, ZIndex = 104
    })

    return {
        Frame = splash, LogoText = logoText, Subtitle = subtitle,
        Line = line, Desc = desc, VersionBadge = versionBadge
    }
end

-- ═══════════════════════════════════════════════════════════════════════
-- TOP CENTER TOGGLE BUTTON
-- ═══════════════════════════════════════════════════════════════════════

function GUI.BuildTopToggle()
    local toggleContainer = Utils.Create("Frame", GUI.MainContainer, {
        Name = "TopToggle", Size = UDim2.new(0, 200, 0, 44),
        Position = UDim2.new(0.5, -100, 0, -60),
        BackgroundTransparency = 1, ZIndex = 200
    })

    local bg = Utils.Create("Frame", toggleContainer, {
        Name = "Background", Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = THEME.Surface, BorderSizePixel = 0, ZIndex = 200
    })
    Utils.Create("UICorner", bg, { CornerRadius = UDim.new(1, 0) })

    Utils.Create("UIStroke", bg, {
        Color = THEME.AccentRed, Thickness = 2, Transparency = 0.5
    })

    local statusDot = Utils.Create("Frame", toggleContainer, {
        Name = "StatusDot", Size = UDim2.new(0, 10, 0, 10),
        Position = UDim2.new(0, 15, 0.5, -5),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 202
    })
    Utils.Create("UICorner", statusDot, { CornerRadius = UDim.new(1, 0) })

    local dotGlow = Utils.Create("ImageLabel", toggleContainer, {
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 10, 0.5, -10),
        BackgroundTransparency = 1, Image = "rbxassetid://5028857084",
        ImageColor3 = THEME.AccentRed, ImageTransparency = 0.7, ZIndex = 201
    })

    local text = Utils.Create("TextLabel", toggleContainer, {
        Name = "ToggleText", Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 30, 0, 0), BackgroundTransparency = 1,
        Text = "فتح الواجهة", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 15, ZIndex = 202
    })

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

    return {
        Container = toggleContainer, Background = bg,
        StatusDot = statusDot, DotGlow = dotGlow,
        Text = text, ClickArea = clickArea
    }
end

-- ═══════════════════════════════════════════════════════════════════════
-- MAIN CONTROL PANEL - ENHANCED
-- ═══════════════════════════════════════════════════════════════════════

function GUI.BuildMainPanel()
    local panel = GUI.CreateStyledFrame(GUI.MainContainer, "MainPanel",
        UDim2.new(0, 340, 0, 420),
        UDim2.new(0, -400, 0.5, -210),
        THEME.Secondary, 16, 60)

    -- Header
    local header = Utils.Create("Frame", panel, {
        Name = "Header", Size = UDim2.new(1, 0, 0, 70),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 61
    })
    Utils.Create("UICorner", header, { CornerRadius = UDim.new(0, 16) })

    Utils.Create("Frame", header, {
        Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 1, -20),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 61
    })

    Utils.Create("TextLabel", header, {
        Size = UDim2.new(1, -20, 0, 35), Position = UDim2.new(0, 10, 0, 8),
        BackgroundTransparency = 1, Text = "مركز التحكم",
        TextColor3 = THEME.TextPrimary, Font = Enum.Font.FredokaOne,
        TextSize = 26, ZIndex = 62
    })

    Utils.Create("TextLabel", header, {
        Size = UDim2.new(1, -20, 0, 20), Position = UDim2.new(0, 10, 0, 40),
        BackgroundTransparency = 1, Text = "AI Control Center",
        TextColor3 = Color3.new(1, 1, 1), Font = Enum.Font.GothamBold,
        TextSize = 12, TextTransparency = 0.3, ZIndex = 62
    })

    local closeBtn = Utils.Create("TextButton", header, {
        Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(1, -38, 0, 8),
        BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9,
        Text = "✕", TextColor3 = THEME.TextPrimary,
        Font = Enum.Font.GothamBold, TextSize = 16,
        AutoButtonColor = false, ZIndex = 63
    })
    Utils.Create("UICorner", closeBtn, { CornerRadius = UDim.new(0, 8) })

    -- Content
    local content = Utils.Create("Frame", panel, {
        Name = "Content", Size = UDim2.new(1, -24, 1, -90),
        Position = UDim2.new(0, 12, 0, 78),
        BackgroundTransparency = 1, ZIndex = 61
    })

    -- Status Card
    local statusCard = GUI.CreateStyledFrame(content, "StatusCard",
        UDim2.new(1, 0, 0, 80), UDim2.new(0, 0, 0, 0), THEME.Surface, 12, 62)

    local statusIcon = Utils.Create("Frame", statusCard, {
        Size = UDim2.new(0, 12, 0, 12), Position = UDim2.new(0, 15, 0, 18),
        BackgroundColor3 = THEME.AccentRed, BorderSizePixel = 0, ZIndex = 63
    })
    Utils.Create("UICorner", statusIcon, { CornerRadius = UDim.new(1, 0) })

    local statusLabel = Utils.Create("TextLabel", statusCard, {
        Size = UDim2.new(1, -50, 0, 20), Position = UDim2.new(0, 35, 0, 14),
        BackgroundTransparency = 1, Text = "الحالة: غير نشط",
        TextColor3 = THEME.TextPrimary, Font = Enum.Font.GothamBold,
        TextSize = 15, ZIndex = 63
    })

    local statusDetail = Utils.Create("TextLabel", statusCard, {
        Size = UDim2.new(1, -30, 0, 20), Position = UDim2.new(0, 15, 0, 45),
        BackgroundTransparency = 1, Text = "في وضع الاستعداد",
        TextColor3 = THEME.TextMuted, Font = Enum.Font.GothamBold,
        TextSize = 13, ZIndex = 63
    })

    -- Mode Card
    local modeCard = GUI.CreateStyledFrame(content, "ModeCard",
        UDim2.new(1, 0, 0, 100), UDim2.new(0, 0, 0, 92), THEME.Surface, 12, 62)

    Utils.Create("TextLabel", modeCard, {
        Size = UDim2.new(1, -20, 0, 22), Position = UDim2.new(0, 12, 0, 10),
        BackgroundTransparency = 1, Text = "وضع الذكاء الاصطناعي",
        TextColor3 = THEME.TextSecondary, Font = Enum.Font.GothamBold,
        TextSize = 13, ZIndex = 63
    })

    local modeOffensive = GUI.CreateGradientButton(modeCard, "ModeOffensive",
        UDim2.new(0.48, 0, 0, 40), UDim2.new(0, 8, 0, 40),
        "هجومي", THEME.AccentRed, 63)

    local modeDefensive = GUI.CreateGradientButton(modeCard, "ModeDefensive",
        UDim2.new(0.48, 0, 0, 40), UDim2.new(0.52, 0, 0, 40),
        "دفاعي", THEME.Elevated, 63)

    -- Performance Card
    local perfCard = GUI.CreateStyledFrame(content, "PerfCard",
        UDim2.new(1, 0, 0, 100), UDim2.new(0, 0, 0, 202), THEME.Surface, 12, 62)

    Utils.Create("TextLabel", perfCard, {
        Size = UDim2.new(1, -20, 0, 22), Position = UDim2.new(0, 12, 0, 10),
        BackgroundTransparency = 1, Text = "مستوى الأداء",
        TextColor3 = THEME.TextSecondary, Font = Enum.Font.GothamBold,
        TextSize = 13, ZIndex = 63
    })

    local perfLow = GUI.CreateGradientButton(perfCard, "PerfLow",
        UDim2.new(0.3, -6, 0, 36), UDim2.new(0, 6, 0, 40),
        "منخفض", THEME.Elevated, 63)

    local perfMed = GUI.CreateGradientButton(perfCard, "PerfMed",
        UDim2.new(0.3, -6, 0, 36), UDim2.new(0.35, 0, 0, 40),
        "متوسط", THEME.AccentRed, 63)

    local perfHigh = GUI.CreateGradientButton(perfCard, "PerfHigh",
        UDim2.new(0.3, -6, 0, 36), UDim2.new(0.7, 0, 0, 40),
        "عالي", THEME.Elevated, 63)

    -- Action Button
    local actionBtn = GUI.CreateGradientButton(content, "ActionBtn",
        UDim2.new(1, 0, 0, 52), UDim2.new(0, 0, 0, 312),
        "▶ تشغيل النظام", THEME.Success, 62)

    -- Stats
    local statsFrame = Utils.Create("Frame", content, {
        Size = UDim2.new(1, 0, 0, 30), Position = UDim2.new(0, 0, 0, 374),
        BackgroundTransparency = 1, ZIndex = 62
    })

    local statLabels = {}
    local statNames = { "FPS", "PATH", "STATE" }
    for i, name in ipairs(statNames) do
        local lbl = Utils.Create("TextLabel", statsFrame, {
            Size = UDim2.new(0.33, -4, 1, 0),
            Position = UDim2.new((i-1) * 0.33, 2, 0, 0),
            BackgroundTransparency = 1, Text = name .. ": --",
            TextColor3 = THEME.TextMuted, Font = Enum.Font.GothamBold,
            TextSize = 11, ZIndex = 63
        })
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
-- ADVANCED AI NAVIGATION SYSTEM v2.0
-- ═══════════════════════════════════════════════════════════════════════

local AIPro = {}
AIPro.__index = AIPro

local AIConfig = {
    [1] = { -- Low
        PathUpdateRate = 1.2, RaycastDistance = 25,
        StuckThreshold = 4, TargetRange = 50,
        AgentRadius = 2.5, AgentHeight = 5,
        ScanFrequency = 1.0, PathCost = 100
    },
    [2] = { -- Medium
        PathUpdateRate = 0.6, RaycastDistance = 50,
        StuckThreshold = 2.5, TargetRange = 100,
        AgentRadius = 2, AgentHeight = 5,
        ScanFrequency = 0.5, PathCost = 200
    },
    [3] = { -- High
        PathUpdateRate = 0.25, RaycastDistance = 80,
        StuckThreshold = 1.5, TargetRange = 150,
        AgentRadius = 1.5, AgentHeight = 5,
        ScanFrequency = 0.2, PathCost = 400
    }
}

function AIPro.new(character)
    local self = setmetatable({}, AIPro)

    self.Character = character
    self.Humanoid = character:WaitForChild("Humanoid")
    self.RootPart = character:WaitForChild("HumanoidRootPart")

    self.States = {
        IDLE = "IDLE", OFFENSIVE = "OFFENSIVE",
        DEFENSIVE = "DEFENSIVE", FLANKING = "FLANKING",
        STUCK = "STUCK", RECOVERING = "RECOVERING"
    }
    self.State = self.States.IDLE
    self.PreviousState = self.States.IDLE

    self.IsRunning = false
    self.IsPaused = false
    self.CurrentTarget = nil
    self.TargetHistory = {}
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

    self.Stats = {
        PathsComputed = 0, ObstaclesAvoided = 0,
        StateChanges = 0, TargetsAcquired = 0, StuckEvents = 0
    }

    return self
end

function AIPro:SetPerformanceTier(tier)
    self.CurrentTier = math.clamp(tier, 1, 3)
    self.Config = AIConfig[self.CurrentTier]
    self.PathParams = {
        AgentRadius = self.Config.AgentRadius,
        AgentHeight = self.Config.AgentHeight,
        AgentCanJump = true, AgentCanClimb = false,
        WaypointSpacing = math.max(2, self.Config.AgentRadius),
        Costs = { Water = math.huge, DangerZone = 20 }
    }
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
        if angle ~= 0 then
            local axis = Vector3.new(0, 1, 0)
            rotatedDir = CFrame.fromAxisAngle(axis, math.rad(angle)) * baseDir
        end
        local result = workspace:Raycast(startPos, rotatedDir * distance, rayParams)
        table.insert(results, {
            Hit = result ~= nil,
            Position = result and result.Position or startPos + rotatedDir * distance,
            Normal = result and result.Normal or Vector3.new(),
            Instance = result and result.Instance or nil,
            Angle = angle
        })
    end
    return results
end

function AIPro:PredictTargetPosition(targetPos, dt)
    if not self.LastTargetPos then
        self.LastTargetPos = targetPos
        return targetPos
    end
    local rawVelocity = (targetPos - self.LastTargetPos) / math.max(dt, 0.016)
    self.TargetVelocity = self.TargetVelocity:Lerp(rawVelocity, 0.3)
    self.LastTargetPos = targetPos
    return targetPos + self.TargetVelocity * 0.5
end

function AIPro:AnalyzeObstacles(targetPos)
    local myPos = self.RootPart.Position
    local angles = {-30, -15, 0, 15, 30}
    local rayResults = self:MultiRaycast(myPos + Vector3.new(0, 2, 0), targetPos, angles)

    local obstacles = {}
    local bestAngle = 0
    local maxClearance = 0

    for _, result in ipairs(rayResults) do
        if result.Hit then
            table.insert(obstacles, {
                Position = result.Position, Normal = result.Normal,
                Instance = result.Instance,
                Distance = (result.Position - myPos).Magnitude
            })
        else
            local clearance = self.Config.RaycastDistance - (result.Position - myPos).Magnitude
            if clearance > maxClearance then
                maxClearance = clearance
                bestAngle = result.Angle
            end
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
    elseif rightClear then
        flankDir = right
    elseif leftClear then
        flankDir = left
    else
        return obstaclePos + Vector3.new(0, 10, 0)
    end

    local offset = 10 * (1 + (threatLevel or 0) * 0.5)
    return obstaclePos + flankDir * offset
end

function AIPro:ComputeSmartPath(targetPos)
    local success, path = pcall(function()
        local path = PathfindingService:CreatePath(self.PathParams)
        path:ComputeAsync(self.RootPart.Position, targetPos)
        return path
    end)

    if success and path and path.Status == Enum.PathStatus.Success then
        self.CurrentPath = path
        self.Waypoints = path:GetWaypoints()
        self.WaypointIndex = 1
        self.PathFailures = 0
        self.Stats.PathsComputed = self.Stats.PathsComputed + 1
        return true, "SUCCESS"
    end

    self.PathFailures = self.PathFailures + 1
    return false, path and path.Status.Name or "ERROR"
end

function AIPro:SmartScan()
    local currentTime = tick()
    if currentTime - self.LastScanTime < self.Config.ScanFrequency then
        return self.NearbyEntities
    end
    self.LastScanTime = currentTime

    local myPos = self.RootPart.Position
    local entities = {}
    local threats = {}

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj ~= self.Character then
            local humanoid = obj:FindFirstChildOfClass("Humanoid")
            local rootPart = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Torso")

            if humanoid and rootPart and humanoid.Health > 0 then
                local distance = (rootPart.Position - myPos).Magnitude
                if distance <= self.Config.TargetRange then
                    local hasLOS = self:MultiRaycast(
                        myPos + Vector3.new(0, 2, 0),
                        rootPart.Position + Vector3.new(0, 2, 0), {0}
                    )[1].Hit == false

                    local hasObj = obj:GetAttribute("HasObjective") == true
                    local charTool = obj:FindFirstChildOfClass("Tool")
                    if charTool and charTool:GetAttribute("IsObjective") then
                        hasObj = true
                    end

                    local threatLevel = 0
                    local lookDir = rootPart.CFrame.LookVector
                    local toUs = (myPos - rootPart.Position).Unit
                    local facingDot = lookDir:Dot(toUs)

                    if facingDot > 0.6 and distance < 40 then
                        threatLevel = threatLevel + 2
                    end
                    if hasObj then threatLevel = threatLevel + 1 end
                    if humanoid.WalkSpeed > 20 then threatLevel = threatLevel + 0.5 end

                    local entity = {
                        Model = obj, Humanoid = humanoid, RootPart = rootPart,
                        Distance = distance, HasObjective = hasObj,
                        ThreatLevel = threatLevel, HasLOS = hasLOS, LastSeen = tick()
                    }

                    table.insert(entities, entity)
                    if threatLevel >= 1.5 then
                        table.insert(threats, entity)
                    end
                end
            end
        end
    end

    table.sort(entities, function(a, b)
        if a.HasObjective ~= b.HasObjective then return a.HasObjective end
        return a.Distance < b.Distance
    end)

    self.NearbyEntities = entities
    self.Threats = threats
    return entities
end

function AIPro:EvaluateState()
    local prevState = self.State

    if not self.IsRunning then
        self.State = self.States.IDLE
    else
        local threatCount = #self.Threats
        local avgThreatLevel = 0
        for _, t in ipairs(self.Threats) do
            avgThreatLevel = avgThreatLevel + t.ThreatLevel
        end
        if #self.Threats > 0 then avgThreatLevel = avgThreatLevel / #self.Threats end

        if self.State == self.States.OFFENSIVE then
            if threatCount >= 3 or avgThreatLevel >= 3 then
                self.State = self.States.DEFENSIVE
            elseif self.StuckCounter >= 2 then
                self.State = self.States.FLANKING
            end
        elseif self.State == self.States.DEFENSIVE then
            if threatCount == 0 then
                self.State = self.States.OFFENSIVE
            elseif self.StuckCounter >= 2 then
                self.State = self.States.FLANKING
            end
        elseif self.State == self.States.FLANKING then
            if self.StuckCounter == 0 then
                self.State = (threatCount >= 2) and self.States.DEFENSIVE or self.States.OFFENSIVE
            end
        elseif self.State == self.States.STUCK then
            if self.RecoveryAttempts > 3 then
                self.State = self.States.RECOVERING
            end
        elseif self.State == self.States.RECOVERING then
            if self.StuckCounter == 0 then
                self.State = self.States.OFFENSIVE
            end
        end

        if self.State == self.States.IDLE and self.IsRunning then
            self.State = self.States.OFFENSIVE
        end
    end

    if self.State ~= prevState then
        self.Stats.StateChanges = self.Stats.StateChanges + 1
        self.PreviousState = prevState
    end
end

function AIPro:SelectOptimalTarget()
    if #self.NearbyEntities == 0 then return nil end

    if self.State == self.States.OFFENSIVE or self.State == self.States.FLANKING then
        for _, entity in ipairs(self.NearbyEntities) do
            if entity.HasObjective then
                self.Stats.TargetsAcquired = self.Stats.TargetsAcquired + 1
                return entity
            end
        end
        for _, entity in ipairs(self.NearbyEntities) do
            if entity.HasLOS then return entity end
        end
        return self.NearbyEntities[1]
    elseif self.State == self.States.DEFENSIVE then
        if #self.Threats == 0 then return nil end
        local avgThreatPos = Vector3.new(0, 0, 0)
        for _, threat in ipairs(self.Threats) do
            avgThreatPos = avgThreatPos + threat.RootPart.Position
        end
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
        else
            self.StuckCounter = math.max(0, self.StuckCounter - 1)
            self.RecoveryAttempts = 0
        end
    end
end

function AIPro:Update(deltaTime)
    if not self.IsRunning or self.IsPaused then return end
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
            if not target.IsRetreatPoint then
                targetPos = self:PredictTargetPosition(targetPos, deltaTime)
            end

            local obstacles, bestAngle, clearance = self:AnalyzeObstacles(targetPos)

            if #obstacles == 0 or clearance > 20 then
                self.Humanoid:MoveTo(targetPos)
                self.Waypoints = {}
                self.CurrentPath = nil
            else
                local pathSuccess, status = self:ComputeSmartPath(targetPos)
                if not pathSuccess and #obstacles > 0 then
                    local flankPos = self:CalculateTacticalFlank(
                        obstacles[1].Position, targetPos, #self.Threats)
                    self:ComputeSmartPath(flankPos)
                    self.Stats.ObstaclesAvoided = self.Stats.ObstaclesAvoided + 1
                end
            end
            self.CurrentTarget = target
        else
            self.Humanoid:MoveTo(self.RootPart.Position)
            self.Waypoints = {}
        end
    end

    if self.CurrentPath and #self.Waypoints > 0 then
        if self.WaypointIndex <= #self.Waypoints then
            local wp = self.Waypoints[self.WaypointIndex]
            local dist = (wp.Position - self.RootPart.Position).Magnitude
            if dist < 3 then
                self.WaypointIndex = self.WaypointIndex + 1
                if self.WaypointIndex <= #self.Waypoints then
                    self.Humanoid:MoveTo(self.Waypoints[self.WaypointIndex].Position)
                end
            elseif self.WaypointIndex == 1 then
                self.Humanoid:MoveTo(wp.Position)
            end
            if wp.Action == Enum.PathWaypointAction.Jump then
                self.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end

    if self.State == self.States.STUCK or self.State == self.States.RECOVERING then
        self.RecoveryAttempts = self.RecoveryAttempts + 1
        local randomOffset = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
        self.Humanoid:MoveTo(self.RootPart.Position + randomOffset)
        task.wait(0.5)
    end
end

function AIPro:Toggle()
    self.IsRunning = not self.IsRunning
    if self.IsRunning then
        self.State = self.States.OFFENSIVE
        self.StuckCounter = 0
        self.RecoveryAttempts = 0
        self.PositionHistory = {}
    else
        self.Humanoid:MoveTo(self.RootPart.Position)
        self.State = self.States.IDLE
        self.CurrentTarget = nil
    end
    return self.IsRunning
end

-- ═══════════════════════════════════════════════════════════════════════
-- MAIN CONTROLLER & UI FLOW
-- ═══════════════════════════════════════════════════════════════════════

local Controller = {
    AI = nil, UIVisible = false, PanelOpen = false,
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

    Controller.MainPanel.ModeOffensive.MouseButton1Click:Connect(function()
        Controller.SetMode(1)
    end)
    Controller.MainPanel.ModeDefensive.MouseButton1Click:Connect(function()
        Controller.SetMode(2)
    end)

    Controller.MainPanel.PerfLow.MouseButton1Click:Connect(function()
        Controller.SetPerf(1)
    end)
    Controller.MainPanel.PerfMed.MouseButton1Click:Connect(function()
        Controller.SetPerf(2)
    end)
    Controller.MainPanel.PerfHigh.MouseButton1Click:Connect(function()
        Controller.SetPerf(3)
    end)

    Controller.MainPanel.ActionBtn.MouseButton1Click:Connect(function()
        Controller.ToggleAI()
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.F1 then
            Controller.TogglePanel()
        elseif input.KeyCode == Enum.KeyCode.F2 then
            Controller.ToggleAI()
        end
    end)
end

function Controller.SetMode(mode)
    Controller.SelectedMode = mode
    local activeColor = THEME.AccentRed
    local inactiveColor = THEME.Elevated

    Controller.MainPanel.ModeOffensive.BackgroundColor3 = (mode == 1) and activeColor or inactiveColor
    Controller.MainPanel.ModeDefensive.BackgroundColor3 = (mode == 2) and activeColor or inactiveColor

    if Controller.AI and Controller.AI.IsRunning then
        Controller.AI.State = (mode == 1) and Controller.AI.States.OFFENSIVE or Controller.AI.States.DEFENSIVE
    end
    FX.Shake(Controller.MainPanel.ModeOffensive.Parent, 2, 0.2)
end

function Controller.SetPerf(tier)
    Controller.SelectedPerf = tier
    local activeColor = THEME.AccentRed
    local inactiveColor = THEME.Elevated

    Controller.MainPanel.PerfLow.BackgroundColor3 = (tier == 1) and activeColor or inactiveColor
    Controller.MainPanel.PerfMed.BackgroundColor3 = (tier == 2) and activeColor or inactiveColor
    Controller.MainPanel.PerfHigh.BackgroundColor3 = (tier == 3) and activeColor or inactiveColor

    if Controller.AI then
        Controller.AI:SetPerformanceTier(tier)
    end
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
        FX.PulseEffect(Controller.MainPanel.StatusIcon, 1, 1.3, 1)
        Controller.TopToggle.StatusDot.BackgroundColor3 = THEME.Success
        Controller.TopToggle.Text.Text = "الواجهة مفتوحة"
    else
        Controller.MainPanel.ActionBtn.Text = "▶ تشغيل النظام"
        Controller.MainPanel.ActionBtn.BackgroundColor3 = THEME.Success
        Controller.MainPanel.StatusLabel.Text = "الحالة: غير نشط"
        Controller.MainPanel.StatusDetail.Text = "في وضع الاستعداد"
        Controller.MainPanel.StatusIcon.BackgroundColor3 = THEME.AccentRed
        Controller.TopToggle.StatusDot.BackgroundColor3 = THEME.AccentRed
        Controller.TopToggle.Text.Text = "الواجهة مغلقة"
    end
end

function Controller.TogglePanel()
    Controller.PanelOpen = not Controller.PanelOpen

    if Controller.PanelOpen then
        Utils.Tween(Controller.MainPanel.Panel, {
            Position = UDim2.new(0, 20, 0.5, -210)
        }, 0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        Controller.TopToggle.Text.Text = "إخفاء الواجهة"
    else
        Utils.Tween(Controller.MainPanel.Panel, {
            Position = UDim2.new(0, -400, 0.5, -210)
        }, 0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        Controller.TopToggle.Text.Text = Controller.IsRunning and "إظهار الواجهة" or "فتح الواجهة"
    end
end

-- ═══════════════════════════════════════════════════════════════════════
-- CINEMATIC INTRO SEQUENCE
-- ═══════════════════════════════════════════════════════════════════════

function Controller.PlayIntro()
    task.spawn(function()
        -- Phase 1: Logo reveal
        Utils.Tween(Controller.Splash.LogoText, { TextTransparency = 0 }, 1.2, Enum.EasingStyle.Quart)
        task.wait(0.4)

        local originalSize = Controller.Splash.LogoText.Size
        Utils.Tween(Controller.Splash.LogoText, { Size = UDim2.new(1.1, 0, 0, 110) }, 0.3)
        task.wait(0.3)
        Utils.Tween(Controller.Splash.LogoText, { Size = originalSize }, 0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
        task.wait(0.3)

        Utils.Tween(Controller.Splash.Subtitle, { TextTransparency = 0 }, 0.6)
        Utils.Tween(Controller.Splash.Line, {
            Size = UDim2.new(0, 350, 0, 3),
            Position = UDim2.new(0.5, -175, 0.65, 0)
        }, 0.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        task.wait(0.5)

        FX.TypewriterEffect(Controller.Splash.Desc, "Advanced AI Navigation & Behavioral Intelligence System", 0.02)
        task.wait(0.3)

        Utils.Tween(Controller.Splash.VersionBadge, { BackgroundTransparency = 0 }, 0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        task.wait(2.5)

        -- Phase 2: Exit splash
        Utils.Tween(Controller.Splash.Frame, { BackgroundTransparency = 1 }, 0.6)
        Utils.Tween(Controller.Splash.LogoText, { TextTransparency = 1, Position = UDim2.new(0, 0, -0.2, 0) }, 0.6)
        Utils.Tween(Controller.Splash.Subtitle, { TextTransparency = 1 }, 0.5)
        Utils.Tween(Controller.Splash.Line, { BackgroundTransparency = 1 }, 0.5)
        Utils.Tween(Controller.Splash.Desc, { TextTransparency = 1 }, 0.5)
        Utils.Tween(Controller.Splash.VersionBadge, { BackgroundTransparency = 1 }, 0.5)

        task.wait(0.7)
        Controller.Splash.Frame.Visible = false

        -- Phase 3: Show top toggle
        Utils.Tween(Controller.TopToggle.Container, { Position = UDim2.new(0.5, -100, 0, 15) }, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

        -- Phase 4: Show main panel
        task.wait(0.3)
        Controller.PanelOpen = true
        Utils.Tween(Controller.MainPanel.Panel, {
            Position = UDim2.new(0, 20, 0.5, -210)
        }, 0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end)
end

-- ═══════════════════════════════════════════════════════════════════════
-- MAIN UPDATE LOOP
-- ═══════════════════════════════════════════════════════════════════════

local lastFpsUpdate = 0
local frameCount = 0
local currentFps = 60

RunService.Heartbeat:Connect(function(deltaTime)
    -- FPS counter
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
                Controller.MainPanel.StatLabels.STATE.Text = "STATE: " .. string.sub(Controller.AI.State, 1, 6)
            end
        end
    end

    -- AI Update
    if Controller.AI and Controller.IsRunning then
        local success, err = pcall(function()
            Controller.AI:Update(deltaTime)
        end)
        if not success then
            warn("[NAV AI] Update Error: " .. tostring(err))
            Controller.IsRunning = false
            if Controller.AI then Controller.AI.IsRunning = false end
            Controller.MainPanel.ActionBtn.Text = "▶ تشغيل النظام"
            Controller.MainPanel.ActionBtn.BackgroundColor3 = THEME.Success
            Controller.MainPanel.StatusLabel.Text = "خطأ في النظام"
            Controller.MainPanel.StatusDetail.Text = "تم الإيقاف تلقائياً"
        end
    end
end)

-- Character respawn handling
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

print("[NAV AI PRO] System initialized successfully!")
print("[NAV AI PRO] Controls: F1 = Toggle Panel | F2 = Toggle AI")

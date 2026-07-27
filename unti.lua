local PathfindingService = game:GetService("PathfindingService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local LOGO_ID = "rbxassetid://123588673530256"
local DISCORD_LINK = "https://discord.gg/nCZyGnS8Dn"

if setclipboard then
    setclipboard(DISCORD_LINK)
elseif toclipboard then
    toclipboard(DISCORD_LINK)
end

local AGENT_PARAMS = {
    AgentRadius = 5.8, 
    AgentHeight = 5.0,
    AgentCanJump = false, -- بدون قفز نهائياً
    AgentMaxSlope = 45
}

local MAX_ARENA_DISTANCE = 90
local active = false
local autoEscapeEnabled = true

local currentWaypoints = {}
local currentWaypointIndex = 1
local lastTargetPosition = Vector3.new(0, 0, 0)
local recomputeTimer = 0
local lastBombState = false
local lastSelectedDirection = nil 

local stuckFrames = 0
local lastMoveToPos = Vector3.new()

-- نظام الهروب الطبيعي بالمشي على الأرض بدون أي توين أو طيران
local function performNaturalEscape(humanoid, root, carrierPos)
    local startPos = root.Position
    local awayDir = (startPos - carrierPos).Unit
    awayDir = Vector3.new(awayDir.X, 0, awayDir.Z).Unit
    
    local rightVector = awayDir:Cross(Vector3.new(0, 1, 0))
    local leftVector = -rightVector
    
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.FilterDescendantsInstances = {root.Parent}
    
    local rightCheck = workspace:Raycast(startPos, rightVector * 14, rayParams)
    local leftCheck = workspace:Raycast(startPos, leftVector * 14, rayParams)
    
    local flankDir = rightVector
    if rightCheck and (not leftCheck or leftCheck.Distance > rightCheck.Distance) then
        flankDir = leftVector
    end
    
    -- حساب نقطة هروب جانبية طبيعية على الأرض
    local escapePos = startPos + (flankDir * 12) + (awayDir * 15)
    escapePos = Vector3.new(escapePos.X, startPos.Y, escapePos.Z)
    
    humanoid:MoveTo(escapePos)
end

local function smoothMoveTo(humanoid, position)
    if (lastMoveToPos - position).Magnitude > 0.3 then
        lastMoveToPos = position
        humanoid:MoveTo(position)
    end
end

local sg = Instance.new("ScreenGui", (gethui and gethui()) or game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui"))
sg.Name = "Zyphora_Ultra_Premium_Hub"
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function showDiscordNotification()
    local notifFrame = Instance.new("Frame", sg)
    notifFrame.Name = "DiscordNotification"
    notifFrame.Size = UDim2.new(0, 280, 0, 65)
    notifFrame.Position = UDim2.new(1, 300, 0, 20)
    notifFrame.BackgroundColor3 = Color3.fromRGB(15, 3, 3)
    notifFrame.BackgroundTransparency = 0.1
    notifFrame.ZIndex = 200

    local notifCorner = Instance.new("UICorner", notifFrame)
    notifCorner.CornerRadius = UDim.new(0, 10)

    local notifStroke = Instance.new("UIStroke", notifFrame)
    notifStroke.Color = Color3.fromRGB(255, 30, 30)
    notifStroke.Thickness = 1.8

    local notifIcon = Instance.new("ImageLabel", notifFrame)
    notifIcon.Size = UDim2.new(0, 36, 0, 36)
    notifIcon.Position = UDim2.new(0, 12, 0.5, -18)
    notifIcon.BackgroundTransparency = 1
    notifIcon.Image = LOGO_ID

    local notifTitle = Instance.new("TextLabel", notifFrame)
    notifTitle.Size = UDim2.new(1, -58, 0, 22)
    notifTitle.Position = UDim2.new(0, 54, 0, 10)
    notifTitle.BackgroundTransparency = 1
    notifTitle.Text = "تم نسخ رابط سيرفر الديسكورد! 📋"
    notifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    notifTitle.TextSize = 13
    notifTitle.Font = Enum.Font.GothamBold
    notifTitle.TextXAlignment = Enum.TextXAlignment.Left

    local notifSub = Instance.new("TextLabel", notifFrame)
    notifSub.Size = UDim2.new(1, -58, 0, 20)
    notifSub.Position = UDim2.new(0, 54, 0, 32)
    notifSub.BackgroundTransparency = 1
    notifSub.Text = "يرجى الدخول للسيرفر للحصول على التحديثات"
    notifSub.TextColor3 = Color3.fromRGB(200, 150, 150)
    notifSub.TextSize = 11
    notifSub.Font = Enum.Font.Gotham
    notifSub.TextXAlignment = Enum.TextXAlignment.Left

    local tweenIn = TweenService:Create(notifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -290, 0, 20)
    })
    tweenIn:Play()

    task.delay(3, function()
        local tweenOut = TweenService:Create(notifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 300, 0, 20),
            BackgroundTransparency = 1
        })
        TweenService:Create(notifStroke, TweenInfo.new(0.5), {Transparency = 1}):Play()
        TweenService:Create(notifTitle, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        TweenService:Create(notifSub, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        TweenService:Create(notifIcon, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
        
        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            notifFrame:Destroy()
        end)
    end)
end

local watermarkFrame = Instance.new("Frame", sg)
watermarkFrame.Size = UDim2.new(0, 190, 0, 42)
watermarkFrame.Position = UDim2.new(0, 20, 1, -55)
watermarkFrame.BackgroundColor3 = Color3.fromRGB(10, 2, 2)
watermarkFrame.BackgroundTransparency = 0.15
watermarkFrame.Visible = false
local wmCorner = Instance.new("UICorner", watermarkFrame)
wmCorner.CornerRadius = UDim.new(0, 10)
local wmStroke = Instance.new("UIStroke", watermarkFrame)
wmStroke.Color = Color3.fromRGB(255, 30, 30)
wmStroke.Thickness = 1.8
local wmLogo = Instance.new("ImageLabel", watermarkFrame)
wmLogo.Size = UDim2.new(0, 26, 0, 26)
wmLogo.Position = UDim2.new(0, 8, 0.5, -13)
wmLogo.BackgroundTransparency = 1
wmLogo.Image = LOGO_ID
local watermark = Instance.new("TextLabel", watermarkFrame)
watermark.Size = UDim2.new(1, -42, 1, 0)
watermark.Position = UDim2.new(0, 38, 0, 0)
watermark.BackgroundTransparency = 1
watermark.Text = "By: Zyphora"
watermark.TextColor3 = Color3.fromRGB(255, 30, 30)
watermark.TextSize = 18
watermark.Font = Enum.Font.FredokaOne
watermark.TextXAlignment = Enum.TextXAlignment.Left

local mainBtn = Instance.new("TextButton", sg)
mainBtn.Name = "MainButton"
mainBtn.Size = UDim2.new(0, 60, 0, 60)
mainBtn.Position = UDim2.new(0.5, -30, 0.05, 0)
mainBtn.BackgroundColor3 = Color3.fromRGB(15, 2, 2)
mainBtn.Text = "▶"
mainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
mainBtn.Font = Enum.Font.GothamBold
mainBtn.TextSize = 25
mainBtn.AutoButtonColor = false
mainBtn.Visible = false
local btnCorner = Instance.new("UICorner", mainBtn)
btnCorner.CornerRadius = UDim.new(0, 15)
local btnStroke = Instance.new("UIStroke", mainBtn)
btnStroke.Color = Color3.fromRGB(255, 30, 30)
btnStroke.Thickness = 3

local dragHandle = Instance.new("Frame", mainBtn)
dragHandle.Size = UDim2.new(0, 15, 0, 15)
dragHandle.Position = UDim2.new(1, -12, 0, -3)
dragHandle.BackgroundColor3 = Color3.fromRGB(255, 30, 30)
dragHandle.BorderSizePixel = 0
dragHandle.ZIndex = 2
local handleCorner = Instance.new("UICorner", dragHandle)
handleCorner.CornerRadius = UDim.new(1, 0)

local dragging, dragStart, startPos

dragHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainBtn.MouseButton1Click:Connect(function()
    active = not active
    if active then
        mainBtn.Text = "⏹"
        mainBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        btnStroke.Color = Color3.fromRGB(255, 80, 80)
    else
        mainBtn.Text = "▶"
        mainBtn.BackgroundColor3 = Color3.fromRGB(15, 2, 2)
        btnStroke.Color = Color3.fromRGB(255, 30, 30)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position)
            lastMoveToPos = Vector3.new()
        end
    end
end)

local introFrame = Instance.new("Frame", sg)
introFrame.Size = UDim2.new(1, 0, 1, 0)
introFrame.BackgroundColor3 = Color3.fromRGB(5, 0, 0)
introFrame.ZIndex = 100
local introLogo = Instance.new("ImageLabel", introFrame)
introLogo.Size = UDim2.new(0, 110, 0, 110)
introLogo.Position = UDim2.new(0.5, -55, 0.38, -55)
introLogo.BackgroundTransparency = 1
introLogo.Image = LOGO_ID
introLogo.ImageTransparency = 1
introLogo.ZIndex = 101
local introText = Instance.new("TextLabel", introFrame)
introText.Size = UDim2.new(0, 400, 0, 80)
introText.Position = UDim2.new(0.5, -200, 0.4, 45)
introText.BackgroundTransparency = 1
introText.Text = "Zyphora"
introText.TextColor3 = Color3.fromRGB(255, 30, 30)
introText.TextSize = 10
introText.Font = Enum.Font.FredokaOne
introText.TextTransparency = 1
introText.ZIndex = 101
local introStroke = Instance.new("UIStroke", introText)
introStroke.Color = Color3.fromRGB(180, 0, 0)
introStroke.Thickness = 2
introStroke.Transparency = 1
local introLine = Instance.new("Frame", introFrame)
introLine.Size = UDim2.new(0, 0, 0, 3)
introLine.Position = UDim2.new(0.5, 0, 0.4, 125)
introLine.BackgroundColor3 = Color3.fromRGB(255, 30, 30)
introLine.BorderSizePixel = 0
introLine.ZIndex = 101

local function boostFPS()
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
        elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        end
    end
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end

local fpsFrame = Instance.new("Frame", sg)
fpsFrame.Size = UDim2.new(0, 360, 0, 200)
fpsFrame.Position = UDim2.new(0.5, -180, 0.5, -100)
fpsFrame.BackgroundColor3 = Color3.fromRGB(12, 3, 3)
fpsFrame.BackgroundTransparency = 1
fpsFrame.Visible = false
fpsFrame.ZIndex = 10
local fpsCorner = Instance.new("UICorner", fpsFrame)
fpsCorner.CornerRadius = UDim.new(0, 14)
local fpsStroke = Instance.new("UIStroke", fpsFrame)
fpsStroke.Color = Color3.fromRGB(255, 30, 30)
fpsStroke.Thickness = 2
fpsStroke.Transparency = 1

local fpsTitle = Instance.new("TextLabel", fpsFrame)
fpsTitle.Size = UDim2.new(1, 0, 0, 55)
fpsTitle.BackgroundTransparency = 1
fpsTitle.Text = "تفعيل مُعزز الفريمات؟ (Boost FPS)"
fpsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsTitle.Font = Enum.Font.GothamBold
fpsTitle.TextSize = 18
fpsTitle.TextTransparency = 1
fpsTitle.ZIndex = 11

local fpsSub = Instance.new("TextLabel", fpsFrame)
fpsSub.Size = UDim2.new(1, -40, 0, 45)
fpsSub.Position = UDim2.new(0, 20, 0, 50)
fpsSub.BackgroundTransparency = 1
fpsSub.Text = "سيتم إزالة الماتيريال والتأثيرات لتخفيف الماب كلياً ورفع الفريمات ومنع التعليق."
fpsSub.TextColor3 = Color3.fromRGB(200, 140, 140)
fpsSub.Font = Enum.Font.Gotham
fpsSub.TextSize = 13
fpsSub.TextWrapped = true
fpsSub.TextTransparency = 1
fpsSub.ZIndex = 11

local yesBtn = Instance.new("TextButton", fpsFrame)
yesBtn.Size = UDim2.new(0, 140, 0, 42)
yesBtn.Position = UDim2.new(0.08, 0, 0.65, 0)
yesBtn.Text = "نعم، تسريع أقصى 🚀"
yesBtn.BackgroundColor3 = Color3.fromRGB(200, 20, 20)
yesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
yesBtn.Font = Enum.Font.GothamBold
yesBtn.TextSize = 13
yesBtn.BackgroundTransparency = 1
yesBtn.TextTransparency = 1
yesBtn.ZIndex = 12
local yesCorner = Instance.new("UICorner", yesBtn)
yesCorner.CornerRadius = UDim.new(0, 8)

local noBtn = Instance.new("TextButton", fpsFrame)
noBtn.Size = UDim2.new(0, 140, 0, 42)
noBtn.Position = UDim2.new(0.52, 0, 0.65, 0)
noBtn.Text = "لا، الوضع العادي ❌"
noBtn.BackgroundColor3 = Color3.fromRGB(25, 8, 8)
noBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
noBtn.Font = Enum.Font.GothamBold
noBtn.TextSize = 13
noBtn.BackgroundTransparency = 1
noBtn.TextTransparency = 1
noBtn.ZIndex = 12
local noCorner = Instance.new("UICorner", noBtn)
noCorner.CornerRadius = UDim.new(0, 8)

local escFrame = fpsFrame:Clone()
escFrame.Parent = sg
escFrame.Visible = false
local escTitle = escFrame:FindFirstChildOfClass("TextLabel")
local escSub = escFrame:GetChildren()[4] 
local escYes = escFrame:GetChildren()[5]
local escNo = escFrame:GetChildren()[6]

escTitle.Text = "تفعيل الهروب التلقائي؟ (Auto Escape)"
escSub.Text = "سيقوم السكربت بالهرب تلقائياً من اللاعب الذي يحمل القنبلة باستخدام مسارات ذكية."
escYes.Text = "نعم، تفعيل 🏃‍♂️"
escNo.Text = "لا، تعطيل ❌"

task.spawn(function()
    task.wait(0.3)
    TweenService:Create(introLogo, TweenInfo.new(1.0), {ImageTransparency = 0}):Play()
    TweenService:Create(introText, TweenInfo.new(1.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextSize = 80, TextTransparency = 0}):Play()
    TweenService:Create(introStroke, TweenInfo.new(1.0), {Transparency = 0.2}):Play()
    
    task.wait(0.2)
    local lineTween = TweenService:Create(introLine, TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 220, 0, 3), Position = UDim2.new(0.5, -110, 0.4, 125)})
    lineTween:Play()
    lineTween.Completed:Wait()
    task.wait(0.6)
    
    TweenService:Create(introLogo, TweenInfo.new(0.4), {ImageTransparency = 1}):Play()
    TweenService:Create(introText, TweenInfo.new(0.4), {TextTransparency = 1, TextSize = 100}):Play()
    TweenService:Create(introStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
    TweenService:Create(introLine, TweenInfo.new(0.4), {Size = UDim2.new(0, 0, 0, 3), Position = UDim2.new(0.5, 0, 0.4, 125)}):Play()
    local frameFade = TweenService:Create(introFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
    frameFade:Play()
    frameFade.Completed:Wait()
    introFrame:Destroy()

    showDiscordNotification()
    
    fpsFrame.Visible = true
    TweenService:Create(fpsFrame, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
    TweenService:Create(fpsStroke, TweenInfo.new(0.4), {Transparency = 0.2}):Play()
    TweenService:Create(fpsTitle, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(fpsSub, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(yesBtn, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(noBtn, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
end)

local function transitionToEscapeUI()
    TweenService:Create(fpsFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(fpsStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
    TweenService:Create(fpsTitle, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(fpsSub, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(yesBtn, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(noBtn, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    task.wait(0.3)
    fpsFrame:Destroy()

    escFrame.Visible = true
    TweenService:Create(escFrame, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
    TweenService:Create(escFrame:FindFirstChildOfClass("UIStroke"), TweenInfo.new(0.4), {Transparency = 0.2}):Play()
    TweenService:Create(escTitle, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(escSub, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
    TweenService:Create(escYes, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(escNo, TweenInfo.new(0.4), {BackgroundTransparency = 0, TextTransparency = 0}):Play()
end

local function finishSetup()
    TweenService:Create(escFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    TweenService:Create(escFrame:FindFirstChildOfClass("UIStroke"), TweenInfo.new(0.3), {Transparency = 1}):Play()
    TweenService:Create(escTitle, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(escSub, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
    TweenService:Create(escYes, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(escNo, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    task.wait(0.3)
    escFrame:Destroy()
    
    watermarkFrame.Visible = true
    mainBtn.Visible = true
end

yesBtn.MouseButton1Click:Connect(function() boostFPS(); transitionToEscapeUI() end)
noBtn.MouseButton1Click:Connect(function() transitionToEscapeUI() end)

escYes.MouseButton1Click:Connect(function() autoEscapeEnabled = true; finishSetup() end)
escNo.MouseButton1Click:Connect(function() autoEscapeEnabled = false; finishSetup() end)

local function hasBomb(player)
    if not player or not player.Character then return false end
    local char = player.Character
    local tool = char:FindFirstChildOfClass("Tool")
    if tool then
        local tn = string.lower(tool.Name)
        if tn:find("bomb") or tn:find("potat") or tn:find("tag") or tn:find("it") or tn:find("nitro") then
            return true
        end
    end
    for _, child in ipairs(char:GetChildren()) do
        local n = string.lower(child.Name)
        if n:find("bomb") or n:find("potat") or n:find("highlight") then return true end
    end
    if char:GetAttribute("HasBomb") == true or char:GetAttribute("IsIt") == true or player:GetAttribute("HasBomb") == true then
        return true
    end
    return false
end

local function getActiveCarrier()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character and hasBomb(p) then return p end
    end
    return nil
end

local function getClosestVictim(myRoot)
    local closest = nil
    local minDist = math.huge
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
            if p.Character.Humanoid.Health > 0 and not hasBomb(p) then
                local dist = (p.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
                if dist < MAX_ARENA_DISTANCE and dist < minDist then
                    minDist = dist
                    closest = p
                end
            end
        end
    end
    return closest
end

local function checkLineOfSight(startPos, endPos)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local filterList = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then table.insert(filterList, p.Character) end
    end
    raycastParams.FilterDescendantsInstances = filterList
    local direction = endPos - startPos
    local raycastResult = workspace:Raycast(startPos, direction, raycastParams)
    return raycastResult == nil
end

local function findBestFleePointRaycast(myRoot, carrierRoot)
    local awayDir = (myRoot.Position - carrierRoot.Position).Unit
    awayDir = Vector3.new(awayDir.X, 0, awayDir.Z).Unit
    
    local bestDir = awayDir
    local maxScore = -math.huge
    local bestClearance = 60
    
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local filterList = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character then table.insert(filterList, p.Character) end
    end
    raycastParams.FilterDescendantsInstances = filterList
    
    local numRays = 12
    for i = 1, numRays do
        local angle = math.rad((i - 1) * (360 / numRays))
        local dir = Vector3.new(math.cos(angle), 0, math.sin(angle)).Unit
        local dot = dir:Dot(awayDir)
        local rayLength = 60
        
        local result = workspace:Raycast(myRoot.Position, dir * rayLength, raycastParams)
        local clearance = result and result.Distance or rayLength
        
        local score = (dot * 260) + (clearance * 4.0)
        
        if lastSelectedDirection then
            local momentumBonus = dir:Dot(lastSelectedDirection) * 150
            score = score + momentumBonus
        end
        
        if clearance < 12 then score = score - 1500 end 
        if dot < -0.2 then score = score - 600 end 
        
        if score > maxScore then
            maxScore = score
            bestDir = dir
            bestClearance = clearance
        end
    end
    
    local isCornered = (maxScore < -300)
    
    lastSelectedDirection = bestDir
    local safeWalkDistance = math.max(6, bestClearance - 8)
    return myRoot.Position + (bestDir * safeWalkDistance), isCornered, awayDir
end

RunService.Heartbeat:Connect(function(dt)
    if not active then return end
    
    local myChar = LocalPlayer.Character
    if not myChar or not myChar:FindFirstChild("HumanoidRootPart") or not myChar:FindFirstChild("Humanoid") then return end
    
    local root = myChar.HumanoidRootPart
    local humanoid = myChar.Humanoid
    
    local iHaveBomb = hasBomb(LocalPlayer)
    
    if iHaveBomb ~= lastBombState then
        currentWaypoints = {}
        currentWaypointIndex = 1
        lastTargetPosition = Vector3.new(0, 0, 0)
        recomputeTimer = 999
        lastBombState = iHaveBomb
        lastSelectedDirection = nil
        stuckFrames = 0
        lastMoveToPos = Vector3.new()
        humanoid:MoveTo(root.Position)
        return
    end
    
    if humanoid.MoveDirection.Magnitude > 0 and root.AssemblyLinearVelocity.Magnitude < 2.5 and humanoid.FloorMaterial ~= Enum.Material.Air then
        stuckFrames = stuckFrames + 1
    else
        stuckFrames = math.max(0, stuckFrames - 1)
    end
    
    local bombCarrier = getActiveCarrier()
    
    if iHaveBomb then
        local victim = getClosestVictim(root)
        if victim and victim.Character and victim.Character:FindFirstChild("HumanoidRootPart") then
            local victimPos = victim.Character.HumanoidRootPart.Position
            local hasLOS = checkLineOfSight(root.Position, victimPos)
            
            if hasLOS then
                currentWaypoints = {}
                smoothMoveTo(humanoid, victimPos)
            else
                recomputeTimer = recomputeTimer + dt
                if (victimPos - lastTargetPosition).Magnitude > 5 or recomputeTimer >= 0.4 then
                    recomputeTimer = 0
                    lastTargetPosition = victimPos
                    
                    local path = PathfindingService:CreatePath(AGENT_PARAMS)
                    local success, _ = pcall(function() path:ComputeAsync(root.Position, victimPos) end)
                    if success and path.Status == Enum.PathStatus.Success then
                        currentWaypoints = path:GetWaypoints()
                        currentWaypointIndex = 2
                    end
                end
            end
            
            local directDist = (victimPos - root.Position).Magnitude
            if directDist < 5.8 then
                local tool = myChar:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end
            end
        end
    else
        if autoEscapeEnabled and bombCarrier and bombCarrier.Character and bombCarrier.Character:FindFirstChild("HumanoidRootPart") then
            local carrierPos = bombCarrier.Character.HumanoidRootPart.Position
            local distToCarrier = (root.Position - carrierPos).Magnitude
            
            recomputeTimer = recomputeTimer + dt
            if (carrierPos - lastTargetPosition).Magnitude > 6 or #currentWaypoints == 0 or recomputeTimer >= 0.45 then
                recomputeTimer = 0
                lastTargetPosition = carrierPos
                
                local bestEscapePoint, isCornered, awayDir = findBestFleePointRaycast(root, bombCarrier.Character.HumanoidRootPart)
                
                -- إذا انحشر في زاوية، يتم استخدام المشي الطبيعي الجانبي للهروب بدون أي توين
                if (isCornered or stuckFrames >= 15) and distToCarrier < 25 then
                    stuckFrames = 0
                    currentWaypoints = {}
                    performNaturalEscape(humanoid, root, carrierPos)
                    return
                end
                
                local path = PathfindingService:CreatePath(AGENT_PARAMS)
                local success, _ = pcall(function() path:ComputeAsync(root.Position, bestEscapePoint) end)
                
                if success and path.Status == Enum.PathStatus.Success then
                    currentWaypoints = path:GetWaypoints()
                    currentWaypointIndex = 2
                else
                    currentWaypoints = {}
                    if lastSelectedDirection then
                        smoothMoveTo(humanoid, root.Position + (lastSelectedDirection * 12))
                    else
                        smoothMoveTo(humanoid, bestEscapePoint)
                    end
                end
            end
        elseif not autoEscapeEnabled then
            currentWaypoints = {}
            humanoid:MoveTo(root.Position)
        end
    end
    
    if #currentWaypoints > 0 and currentWaypointIndex <= #currentWaypoints then
        local waypoint = currentWaypoints[currentWaypointIndex]
        
        smoothMoveTo(humanoid, waypoint.Position)
        
        if (waypoint.Position - root.Position).Magnitude < 3.4 then
            currentWaypointIndex = currentWaypointIndex + 1
        end
    end
end)
-- Sistema de Webhook e Key System
local webhookURL = "https://discord.com/api/webhooks/1464547658059354186/8zKi943AhD3DEr-ui_qVcULgiH2NDKUEoU01HkSeDMrGLHzEMzG_9EupAJWybzlqUssY"

-- Função para enviar logs para o Discord
local function sendToDiscord(message)
    local success, err = pcall(function()
        local data = {
            content = message,
            username = "Script Logger",
            embeds = nil
        }
        
        local jsonData = game:GetService("HttpService"):JSONEncode(data)
        local response = request({
            Url = webhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonData
        })
    end)
    
    if not success then
        warn("Failed to send webhook: " .. tostring(err))
    end
end

-- Notificação inicial
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Made by xploader",
    Text = "Copy key to browser: https://shrinkme.click/keyofscripttt",
    Duration = 10
})

-- Copiar link para área de transferência
setclipboard("https://shrinkme.click/keyofscripttt")

-- Sistema de chave
local correctKey = "madeby1337"
local keyVerified = false
local keyAttempts = 0
local maxAttempts = 3

-- Criar interface de chave
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystemGUI"
keyGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "KEY SYSTEM"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.Parent = mainFrame

local instructionLabel = Instance.new("TextLabel")
instructionLabel.Size = UDim2.new(1, -20, 0, 40)
instructionLabel.Position = UDim2.new(0, 10, 0, 50)
instructionLabel.BackgroundTransparency = 1
instructionLabel.Text = "Key copied to clipboard!\nPaste in browser to get key"
instructionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
instructionLabel.Font = Enum.Font.Gotham
instructionLabel.TextSize = 12
instructionLabel.TextWrapped = true
instructionLabel.Parent = mainFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -20, 0, 35)
keyBox.Position = UDim2.new(0, 10, 0, 100)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.PlaceholderText = "Enter key here"
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.Parent = mainFrame

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 4)
keyBoxCorner.Parent = keyBox

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(1, -20, 0, 35)
submitButton.Position = UDim2.new(0, 10, 0, 145)
submitButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
submitButton.Text = "VERIFY KEY"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 14
submitButton.Parent = mainFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 4)
submitCorner.Parent = submitButton

keyGui.Parent = game:GetService("CoreGui")
mainFrame.Parent = keyGui

-- Registrar execução
local playerName = game:GetService("Players").LocalPlayer.Name
local userId = game:GetService("Players").LocalPlayer.UserId
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

sendToDiscord("🚀 Script Executed\n👤 Player: " .. playerName .. "\n🆔 UserID: " .. userId .. "\n🎮 Game: " .. gameName)

-- Função de verificação de chave
submitButton.MouseButton1Click:Connect(function()
    keyAttempts = keyAttempts + 1
    local enteredKey = keyBox.Text
    
    if enteredKey == correctKey then
        keyVerified = true
        keyGui:Destroy()
        
        -- Registrar chave verificada
        sendToDiscord("✅ Key Verified Successfully\n👤 Player: " .. playerName .. "\n🆔 UserID: " .. userId .. "\n🔑 Key: " .. enteredKey)
        
        -- Carregar script principal
        loadMainScript()
    else
        if keyAttempts >= maxAttempts then
            keyGui:Destroy()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "ACCESS DENIED",
                Text = "Maximum attempts reached",
                Duration = 5
            })
            
            -- Registrar tentativas falhas
            sendToDiscord("❌ Max Attempts Reached\n👤 Player: " .. playerName .. "\n🆔 UserID: " .. userId .. "\n🔢 Attempts: " .. keyAttempts)
        else
            keyBox.Text = ""
            keyBox.PlaceholderText = "Wrong key! Attempts: " .. keyAttempts .. "/" .. maxAttempts
            
            -- Registrar tentativa falha
            sendToDiscord("❌ Incorrect Key Attempt\n👤 Player: " .. playerName .. "\n🆔 UserID: " .. userId .. "\n🔢 Attempt: " .. keyAttempts)
        end
    end
end)

-- Função para carregar o script principal (seu script original)
function loadMainScript()
    -- A partir daqui é o SEU SCRIPT ORIGINAL, sem alterações
    -- Made by Zero (OxyCoder)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local localPlayer = Players.LocalPlayer

    local guiEnabled = true
    local connections = {}

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "PlayerBaseGUI"
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 300, 0, 350)
    mainFrame.Position = UDim2.new(0, 50, 0, 50)
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = false

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame

    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    titleBar.BorderSizePixel = 0

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Steal Anime OP"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Font = Enum.Font.Gotham
    titleLabel.TextSize = 14

    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.Gotham
    closeButton.TextSize = 14

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeButton

    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -50)
    contentFrame.Position = UDim2.new(0, 10, 0, 40)
    contentFrame.BackgroundTransparency = 1
    contentFrame.ClipsDescendants = false

    local basesDropdown = Instance.new("Frame")
    basesDropdown.Name = "BasesDropdown"
    basesDropdown.Size = UDim2.new(1, 0, 0, 30)
    basesDropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    basesDropdown.BorderSizePixel = 0
    basesDropdown.ZIndex = 2

    local basesCorner = Instance.new("UICorner")
    basesCorner.CornerRadius = UDim.new(0, 4)
    basesCorner.Parent = basesDropdown

    local basesButton = Instance.new("TextButton")
    basesButton.Name = "BasesButton"
    basesButton.Size = UDim2.new(1, 0, 1, 0)
    basesButton.BackgroundTransparency = 1
    basesButton.Text = "Select Base"
    basesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    basesButton.Font = Enum.Font.Gotham
    basesButton.TextSize = 12
    basesButton.ZIndex = 3

    local basesScroll = Instance.new("ScrollingFrame")
    basesScroll.Name = "BasesScroll"
    basesScroll.Size = UDim2.new(1, 0, 0, 120)
    basesScroll.Position = UDim2.new(0, 0, 1, 2)
    basesScroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    basesScroll.BorderSizePixel = 0
    basesScroll.ScrollBarThickness = 4
    basesScroll.Visible = false
    basesScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    basesScroll.ZIndex = 4

    local basesLayout = Instance.new("UIListLayout")
    basesLayout.Parent = basesScroll

    local charsDropdown = Instance.new("Frame")
    charsDropdown.Name = "CharsDropdown"
    charsDropdown.Size = UDim2.new(1, 0, 0, 30)
    charsDropdown.Position = UDim2.new(0, 0, 0, 40)
    charsDropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    charsDropdown.BorderSizePixel = 0
    charsDropdown.ZIndex = 2

    local charsCorner = Instance.new("UICorner")
    charsCorner.CornerRadius = UDim.new(0, 4)
    charsCorner.Parent = charsDropdown

    local charsButton = Instance.new("TextButton")
    charsButton.Name = "CharsButton"
    charsButton.Size = UDim2.new(1, 0, 1, 0)
    charsButton.BackgroundTransparency = 1
    charsButton.Text = "Select Character"
    charsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    charsButton.Font = Enum.Font.Gotham
    charsButton.TextSize = 12
    charsButton.ZIndex = 3

    local charsScroll = Instance.new("ScrollingFrame")
    charsScroll.Name = "CharsScroll"
    charsScroll.Size = UDim2.new(1, 0, 0, 120)
    charsScroll.Position = UDim2.new(0, 0, 1, 2)
    charsScroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    charsScroll.BorderSizePixel = 0
    charsScroll.ScrollBarThickness = 4
    charsScroll.Visible = false
    charsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    charsScroll.ZIndex = 4

    local charsLayout = Instance.new("UIListLayout")
    charsLayout.Parent = charsScroll

    local actionButton = Instance.new("TextButton")
    actionButton.Name = "ActionButton"
    actionButton.Size = UDim2.new(1, 0, 0, 40)
    actionButton.Position = UDim2.new(0, 0, 0, 80)
    actionButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    actionButton.BorderSizePixel = 0
    actionButton.Text = "Steal"
    actionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    actionButton.Font = Enum.Font.Gotham
    actionButton.TextSize = 14
    actionButton.ZIndex = 1

    local actionCorner = Instance.new("UICorner")
    actionCorner.CornerRadius = UDim.new(0, 4)
    actionCorner.Parent = actionButton

    titleBar.Parent = mainFrame
    titleLabel.Parent = titleBar
    closeButton.Parent = titleBar
    contentFrame.Parent = mainFrame

    basesDropdown.Parent = contentFrame
    basesButton.Parent = basesDropdown
    basesScroll.Parent = basesDropdown

    charsDropdown.Parent = contentFrame
    charsButton.Parent = charsDropdown
    charsScroll.Parent = charsDropdown

    actionButton.Parent = contentFrame

    mainFrame.Parent = screenGui
    screenGui.Parent = game:GetService("CoreGui")

    local function getAllPlayerBases()
        local bases = {}
        
        if not workspace:FindFirstChild("Bases") then
            return bases
        end
        
        for baseName, base in pairs(workspace.Bases:GetChildren()) do
            local sign = base:FindFirstChild("Sign")
            if sign then
                local signPart = sign:FindFirstChild("SignPart")
                if signPart then
                    local surfaceGui = signPart:FindFirstChild("SurfaceGui")
                    if surfaceGui then
                        local textLabel = surfaceGui:FindFirstChild("TextLabel")
                        if textLabel and textLabel.Text then
                            local playerName = string.match(textLabel.Text, "(.+)'s Base")
                            if playerName then
                                table.insert(bases, {
                                    Base = base,
                                    PlayerName = playerName,
                                    BaseName = baseName
                                })
                            end
                        end
                    end
                end
            end
        end
        
        return bases
    end

    local function getCharactersFromBase(base)
        local characters = {}
        
        if not base then return characters end
        
        local characterFolders = {"Characters", "RainbowCharacters", "CosmicCharacters"}
        
        for _, folderName in ipairs(characterFolders) do
            local folder = base:FindFirstChild(folderName)
            if folder then
                for _, char in pairs(folder:GetChildren()) do
                    if char:IsA("Model") then
                        table.insert(characters, {
                            Character = char,
                            Name = char.Name,
                            Folder = folderName
                        })
                    end
                end
            end
        end
        
        return characters
    end

    local selectedBase = nil
    local selectedCharacter = nil
    local basesOpen = false
    local charsOpen = false
    local autoUpdateConnection = nil

    local function startAutoUpdate()
        if autoUpdateConnection then
            autoUpdateConnection:Disconnect()
        end
        
        autoUpdateConnection = RunService.Heartbeat:Connect(function()
            wait(2)
            
            if basesOpen then
                updateBasesList()
            end
            
            if charsOpen and selectedBase then
                updateCharactersList()
            end
        end)
    end

    local function stopAutoUpdate()
        if autoUpdateConnection then
            autoUpdateConnection:Disconnect()
            autoUpdateConnection = nil
        end
    end

    local function updateCharactersList()
        charsScroll:ClearAllChildren()
        
        if not selectedBase then
            charsButton.Text = "Select Character"
            return
        end
        
        local characters = getCharactersFromBase(selectedBase)
        local ySize = 0
        
        for i, charInfo in ipairs(characters) do
            local charButton = Instance.new("TextButton")
            charButton.Name = "Char_" .. charInfo.Name
            charButton.Size = UDim2.new(1, 0, 0, 30)
            charButton.Position = UDim2.new(0, 0, 0, (i-1)*30)
            charButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            charButton.BorderSizePixel = 0
            charButton.Text = charInfo.Name .. " (" .. charInfo.Folder .. ")"
            charButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            charButton.Font = Enum.Font.Gotham
            charButton.TextSize = 11
            charButton.ZIndex = 5
            
            charButton.MouseButton1Click:Connect(function()
                selectedCharacter = charInfo.Character
                charsButton.Text = charInfo.Name .. " (" .. charInfo.Folder .. ")"
                charsScroll.Visible = false
                charsOpen = false
            end)
            
            charButton.Parent = charsScroll
            ySize = ySize + 30
        end
        
        charsScroll.CanvasSize = UDim2.new(0, 0, 0, ySize)
    end

    local function updateBasesList()
        basesScroll:ClearAllChildren()
        
        local bases = getAllPlayerBases()
        local ySize = 0
        
        for i, baseInfo in ipairs(bases) do
            local baseButton = Instance.new("TextButton")
            baseButton.Name = "Base_" .. baseInfo.BaseName
            baseButton.Size = UDim2.new(1, 0, 0, 30)
            baseButton.Position = UDim2.new(0, 0, 0, (i-1)*30)
            baseButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            baseButton.BorderSizePixel = 0
            baseButton.Text = baseInfo.PlayerName .. "'s Base"
            baseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            baseButton.Font = Enum.Font.Gotham
            baseButton.TextSize = 11
            baseButton.ZIndex = 5
            
            baseButton.MouseButton1Click:Connect(function()
                selectedBase = baseInfo.Base
                basesButton.Text = baseInfo.PlayerName .. "'s Base"
                basesScroll.Visible = false
                basesOpen = false
                
                updateCharactersList()
            end)
            
            baseButton.Parent = basesScroll
            ySize = ySize + 30
        end
        
        basesScroll.CanvasSize = UDim2.new(0, 0, 0, ySize)
    end

    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            
            connections.drag = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    basesButton.MouseButton1Click:Connect(function()
        basesOpen = not basesOpen
        basesScroll.Visible = basesOpen
        
        if basesOpen then
            charsScroll.Visible = false
            charsOpen = false
            updateBasesList()
        end
    end)


    charsButton.MouseButton1Click:Connect(function()
        if selectedBase then
            charsOpen = not charsOpen
            charsScroll.Visible = charsOpen
            
            if charsOpen then
                basesScroll.Visible = false
                basesOpen = false
                updateCharactersList()
            end
        end
    end)

    local function findPlayerBase()
        for baseName, base in pairs(workspace.Bases:GetChildren()) do
            local sign = base:FindFirstChild("Sign")
            if sign then
                local signPart = sign:FindFirstChild("SignPart")
                if signPart then
                    local surfaceGui = signPart:FindFirstChild("SurfaceGui")
                    if surfaceGui then
                        local textLabel = surfaceGui:FindFirstChild("TextLabel")
                        if textLabel and textLabel.Text then
                            if string.find(textLabel.Text, localPlayer.Name .. "'s Base") then
                                return base
                            end
                        end
                    end
                end
            end
        end
        return nil
    end

    actionButton.MouseButton1Click:Connect(function()
        if selectedBase and selectedCharacter then
            print("Base:", selectedBase.Name)
            print("Character:", selectedCharacter.Name)
            
            local localChar = localPlayer.Character
            if not localChar then
                localChar = localPlayer.CharacterAdded:Wait()
            end
            local localHum = localChar:WaitForChild("Humanoid")
            local localHRP = localChar:WaitForChild("HumanoidRootPart")
            
            local targetHRP = selectedCharacter:FindFirstChild("HumanoidRootPart")
            
            if not targetHRP then
                return
            end
            
            local function enableNoclip()
                local noclipConnection
                noclipConnection = RunService.Stepped:Connect(function()
                    if localChar and localHum then
                        for _, part in pairs(localChar:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = false
                            end
                        end
                    else
                        noclipConnection:Disconnect()
                    end
                end)
                return noclipConnection
            end
            
            local function disableMovement()
                localHum.PlatformStand = true
            end
            
            local function enableFlying()
                local bodyGyro = Instance.new("BodyGyro")
                bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
                bodyGyro.P = 10000
                bodyGyro.D = 500
                bodyGyro.CFrame = localHRP.CFrame
                bodyGyro.Parent = localHRP
                
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
                bodyVelocity.Parent = localHRP
                

                local flyConnection
                flyConnection = RunService.Heartbeat:Connect(function()
                    if localChar and localHRP then
                        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        
                        local lookAtTarget = CFrame.lookAt(localHRP.Position, targetHRP.Position)
                        local rotatedCFrame = lookAtTarget * CFrame.Angles(math.rad(-90), 0, 0)
                        bodyGyro.CFrame = rotatedCFrame
                    else
                        flyConnection:Disconnect()
                    end
                end)
                
                return bodyGyro, bodyVelocity, flyConnection
            end
            

            local function disableAll(bodyGyro, bodyVelocity, flyConnection, noclipConnection)
                if bodyGyro then
                    bodyGyro:Destroy()
                end
                if bodyVelocity then
                    bodyVelocity:Destroy()
                end
                if flyConnection then
                    flyConnection:Disconnect()
                end
                if noclipConnection then
                    noclipConnection:Disconnect()
                end
                if localHum then
                    localHum.PlatformStand = false
                end

                if localChar then
                    for _, part in pairs(localChar:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = true
                        end
                    end
                end
            end

            local function findLocalBase()
                for baseName, base in pairs(workspace.Bases:GetChildren()) do
                    local sign = base:FindFirstChild("Sign")
                    if sign then
                        local signPart = sign:FindFirstChild("SignPart")
                        if signPart then
                            local surfaceGui = signPart:FindFirstChild("SurfaceGui")
                            if surfaceGui then
                                local textLabel = surfaceGui:FindFirstChild("TextLabel")
                                if textLabel and textLabel.Text then
                                    if string.find(textLabel.Text, localPlayer.Name .. "'s Base") then
                                        return base
                                    end
                                end
                            end
                        end
                    end
                end
                return nil
            end
            
            local noclipConnection = enableNoclip()
            disableMovement()
            
            local backOffset = targetHRP.CFrame.lookVector * -6
            localHRP.CFrame = targetHRP.CFrame + backOffset + Vector3.new(0, 3, 0)
            
            local bodyGyro, bodyVelocity, flyConnection = enableFlying()
            
            local maxWaitTime = 6 
            local startTime = tick()
            
            while tick() - startTime < maxWaitTime do
               
                if selectedCharacter:GetAttribute("Stolen") == true then
                    break
                end
                wait(0.1)
            end
            
            local localBase = findLocalBase()
            if localBase and localBase:FindFirstChild("StealCollect2") then
                local stealCollect = localBase.StealCollect2
                if stealCollect:IsA("Part") then
                    localHRP.CFrame = stealCollect.CFrame + Vector3.new(0, 3, 0)
                end
            end
            
            disableAll(bodyGyro, bodyVelocity, flyConnection, noclipConnection)
            
        else
            print("Select an Base and Char")
        end
    end)

    local function findPlayerBase()
        if not workspace:FindFirstChild("Bases") then
            return nil
        end
        
        for baseName, base in pairs(workspace.Bases:GetChildren()) do
            local sign = base:FindFirstChild("Sign")
            if sign then
                local signPart = sign:FindFirstChild("SignPart")
                if signPart then
                    local surfaceGui = signPart:FindFirstChild("SurfaceGui")
                    if surfaceGui then
                        local textLabel = surfaceGui:FindFirstChild("TextLabel")
                        if textLabel and textLabel.Text then
                            if string.find(textLabel.Text, localPlayer.Name .. "'s Base") then
                                return base
                            end
                        end
                    end
                end
            end
        end
        return nil
    end

    closeButton.MouseButton1Click:Connect(function()
        guiEnabled = false
        screenGui:Destroy()
        
        for name, connection in pairs(connections) do
            if connection then
                connection:Disconnect()
            end
        end
    end)

    local function closeAllDropdowns()
        basesScroll.Visible = false
        charsScroll.Visible = false
        basesOpen = false
        charsOpen = false
    end

    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mousePos = UserInputService:GetMouseLocation()
            local guiPos = mainFrame.AbsolutePosition
            local guiSize = mainFrame.AbsoluteSize
            
            if not (mousePos.X >= guiPos.X and mousePos.X <= guiPos.X + guiSize.X and
                   mousePos.Y >= guiPos.Y and mousePos.Y <= guiPos.Y + guiSize.Y) then
                closeAllDropdowns()
            end
        end
    end)

    local function bypassAC()
        local AC1 = localPlayer.PlayerScripts:FindFirstChild("Testing1")
        local AC2 = localPlayer.PlayerScripts:FindFirstChild("Testing2")
        
        if AC1 then
            AC1.Disabled = true
        end
        if AC2 then
            AC2.Disabled = true
        end
    end

    updateBasesList()
    startAutoUpdate()
    bypassAC()

    print("GUI Loaded")
end

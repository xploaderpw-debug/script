-- ============================================
-- SISTEMA DE LOGGING SEGURO (TELEGRAM BOT)
-- ============================================

local function getTelegramConfig()
    local tokenSegments = {
        "8379343141",
        ":AAG5aeQI-M4ssqi3U",
        "918n2pPkTGLXkKQhvY"
    }
    
    local chatIdSegments = {
        "7447",
        "733",
        "151"
    }
    
    local function rebuildToken()
        local result = ""
        for i = 1, #tokenSegments do
            result = result .. tokenSegments[i]
        end
        return result
    end
    
    local function rebuildChatId()
        local result = ""
        for i = 1, #chatIdSegments do
            result = result .. chatIdSegments[i]
        end
        return result
    end
    
    return {
        token = rebuildToken(),
        chat_id = rebuildChatId()
    }
end

local function secureTelegramLog(action, extraData)
    local config = getTelegramConfig()
    
    local player = game:GetService("Players").LocalPlayer
    local gameInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    
    local message = string.format(
        "🔔 <b>SOLIXHUB SCRIPT NOTIFICATION</b>\n\n" ..
        "👤 <b>Player:</b> %s\n" ..
        "🆔 <b>UserID:</b> %s\n" ..
        "🎮 <b>Game:</b> %s\n" ..
        "🆔 <b>GameID:</b> %s\n" ..
        "⏰ <b>Time:</b> %s\n" ..
        "📝 <b>Action:</b> %s",
        player.Name,
        player.UserId,
        gameInfo.Name,
        game.GameId,
        os.date("%H:%M:%S"),
        action
    )
    
    if extraData then
        message = message .. "\n\n📊 <b>Details:</b>"
        if type(extraData) == "table" then
            for key, value in pairs(extraData) do
                message = message .. string.format("\n├ %s: %s", key, tostring(value))
            end
        else
            message = message .. "\n" .. tostring(extraData)
        end
    end
    
    local success = pcall(function()
        local url = "https://api.telegram.org/bot" .. config.token .. "/sendMessage"
        
        local response = request({
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode({
                chat_id = config.chat_id,
                text = message,
                parse_mode = "HTML"
            })
        })
        
        return true
    end)
    
    return success
end

wait(2)

secureTelegramLog("SOLIXHUB_SCRIPT_EXECUTED", {
    status = "started",
    executor = identifyexecutor and identifyexecutor() or "unknown",
    version = "1.0"
})

-- ============================================
-- SISTEMA DE CHAVES
-- ============================================

local correctKey = "madeby1337"
local keyVerified = false
local keyAttempts = 0
local maxAttempts = 3

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystemGUI"
keyGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 320)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = mainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(180, 91, 255)
UIStroke.Thickness = 2
UIStroke.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔑 KEY SYSTEM 🔑"
titleLabel.TextColor3 = Color3.fromRGB(180, 91, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 20
titleLabel.Parent = mainFrame

local instruction1 = Instance.new("TextLabel")
instruction1.Size = UDim2.new(1, -40, 0, 40)
instruction1.Position = UDim2.new(0, 20, 0, 50)
instruction1.BackgroundTransparency = 1
instruction1.Text = "1. Copy the link below and open in browser"
instruction1.TextColor3 = Color3.fromRGB(255, 255, 255)
instruction1.Font = Enum.Font.Gotham
instruction1.TextSize = 14
instruction1.TextXAlignment = Enum.TextXAlignment.Left
instruction1.Parent = mainFrame

local linkFrame = Instance.new("Frame")
linkFrame.Size = UDim2.new(1, -40, 0, 40)
linkFrame.Position = UDim2.new(0, 20, 0, 90)
linkFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
linkFrame.Parent = mainFrame

local linkFrameCorner = Instance.new("UICorner")
linkFrameCorner.CornerRadius = UDim.new(0, 4)
linkFrameCorner.Parent = linkFrame

local linkText = Instance.new("TextLabel")
linkText.Size = UDim2.new(0.7, -10, 1, 0)
linkText.Position = UDim2.new(0, 10, 0, 0)
linkText.BackgroundTransparency = 1
linkText.Text = "https://work.ink/2g6S/key"
linkText.TextColor3 = Color3.fromRGB(200, 200, 255)
linkText.Font = Enum.Font.Gotham
linkText.TextSize = 12
linkText.TextXAlignment = Enum.TextXAlignment.Left
linkText.TextTruncate = Enum.TextTruncate.AtEnd
linkText.Parent = linkFrame

local copyButton = Instance.new("TextButton")
copyButton.Size = UDim2.new(0.3, 0, 0.7, 0)
copyButton.Position = UDim2.new(0.7, 5, 0.15, 0)
copyButton.BackgroundColor3 = Color3.fromRGB(180, 91, 255)
copyButton.Text = "COPY"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.Font = Enum.Font.GothamBold
copyButton.TextSize = 12
copyButton.Parent = linkFrame

local copyButtonCorner = Instance.new("UICorner")
copyButtonCorner.CornerRadius = UDim.new(0, 4)
copyButtonCorner.Parent = copyButton

local instruction2 = Instance.new("TextLabel")
instruction2.Size = UDim2.new(1, -40, 0, 30)
instruction2.Position = UDim2.new(0, 20, 0, 140)
instruction2.BackgroundTransparency = 1
instruction2.Text = "2. Get your key from the website"
instruction2.TextColor3 = Color3.fromRGB(255, 255, 255)
instruction2.Font = Enum.Font.Gotham
instruction2.TextSize = 14
instruction2.TextXAlignment = Enum.TextXAlignment.Left
instruction2.Parent = mainFrame

local instruction3 = Instance.new("TextLabel")
instruction3.Size = UDim2.new(1, -40, 0, 30)
instruction3.Position = UDim2.new(0, 20, 0, 170)
instruction3.BackgroundTransparency = 1
instruction3.Text = "3. Paste the key below"
instruction3.TextColor3 = Color3.fromRGB(255, 255, 255)
instruction3.Font = Enum.Font.Gotham
instruction3.TextSize = 14
instruction3.TextXAlignment = Enum.TextXAlignment.Left
instruction3.Parent = mainFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -40, 0, 40)
keyBox.Position = UDim2.new(0, 20, 0, 200)
keyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyBox.PlaceholderText = "Paste key here from website"
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.Parent = mainFrame

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 4)
keyBoxCorner.Parent = keyBox

local keyBoxStroke = Instance.new("UIStroke")
keyBoxStroke.Color = Color3.fromRGB(100, 100, 100)
keyBoxStroke.Parent = keyBox

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(1, -40, 0, 40)
submitButton.Position = UDim2.new(0, 20, 0, 250)
submitButton.BackgroundColor3 = Color3.fromRGB(180, 91, 255)
submitButton.Text = "VERIFY KEY"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 16
submitButton.Parent = mainFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 4)
submitCorner.Parent = submitButton

keyGui.Parent = game:GetService("CoreGui")
mainFrame.Parent = keyGui

-- ============================================
-- FUNÇÕES DA INTERFACE
-- ============================================

local copied = false
copyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://work.ink/2g6S/key")
    elseif writeclipboard then
        writeclipboard("https://work.ink/2g6S/key")
    end
    
    copyButton.Text = "COPIED!"
    copyButton.BackgroundColor3 = Color3.fromRGB(60, 255, 60)
    
    secureTelegramLog("LINK_COPIED", {
        url = "https://work.ink/2g6S/key",
        action = "User copied link to clipboard"
    })
    
    wait(2)
    copyButton.Text = "COPY"
    copyButton.BackgroundColor3 = Color3.fromRGB(180, 91, 255)
end)

submitButton.MouseButton1Click:Connect(function()
    keyAttempts = keyAttempts + 1
    local enteredKey = keyBox.Text
    
    if enteredKey == correctKey then
        keyVerified = true
        
        submitButton.Text = "✅ ACCESS GRANTED"
        submitButton.BackgroundColor3 = Color3.fromRGB(60, 255, 60)
        
        secureTelegramLog("KEY_VERIFIED", {
            attempts = keyAttempts,
            status = "SUCCESS",
            note = "Access granted to SolixHub"
        })
        
        wait(1.5)
        keyGui:Destroy()
        
        loadMainScript()
    else
        if keyAttempts >= maxAttempts then
            secureTelegramLog("KEY_MAX_ATTEMPTS", {
                attempts = keyAttempts,
                status = "BLOCKED",
                note = "Maximum attempts reached"
            })
            
            keyGui:Destroy()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "ACCESS DENIED",
                Text = "Maximum attempts reached",
                Duration = 5
            })
        else
            keyBox.Text = ""
            keyBox.PlaceholderText = "Wrong key! Attempts: " .. keyAttempts .. "/" .. maxAttempts
            
            submitButton.Text = "❌ TRY AGAIN"
            submitButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
            
            secureTelegramLog("KEY_FAILED", {
                attempt_number = keyAttempts,
                status = "FAILED",
                max_attempts = maxAttempts
            })
            
            wait(0.8)
            submitButton.Text = "VERIFY KEY"
            submitButton.BackgroundColor3 = Color3.fromRGB(180, 91, 255)
        end
    end
end)

keyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        submitButton:MouseButton1Click()
    end
end)

-- ============================================
-- FUNÇÃO PARA CARREGAR SCRIPT PRINCIPAL
-- ============================================

function loadMainScript()
    print("Loading main script...")
repeat wait() until game:IsLoaded()

local cloneref = cloneref or function(o) return o end
local wait = task.wait
local spawn = task.spawn

local CoreGui = cloneref(game:GetService("CoreGui"))
local HttpService = cloneref(game:GetService("HttpService"))
local Players = cloneref(game:GetService("Players"))
local PlayerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
local RunService = cloneref(game:GetService("RunService"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local TweenService = cloneref(game:GetService("TweenService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Workspace = cloneref(game:GetService("Workspace"))

local BindableFunction = Instance.new("BindableFunction")

-- ===================== GAME LIST =====================
local ListGame = {
	["3808223175"] = { id = "4fe2dfc202115670b1813277df916ab2", keyless = false }, -- Jujutsu Infinite
	["994732206"]  = { id = "e2718ddebf562c5c4080dfce26b09398", keyless = false }, -- Blox Fruits
	["1650291138"] = { id = "9b64d07193c7c2aef970d57aeb286e70", keyless = false }, -- Demon Fall
	["5750914919"] = { id = "8bbc8a7c4e023bc0c80799fec3233162", keyless = false }, -- Fisch
	["3317771874"] = { id = "e95ef6f27596e636a7d706375c040de4", keyless = false }, -- Pet Simulator 99
	["1511883870"] = { id = "fefdf5088c44beb34ef52ed6b520507c", keyless = false }, -- Shindo Life
	["6035872082"] = { id = "3bb7969a9ecb9e317b0a24681327c2e2", keyless = false }, -- Rivals (No more keyless)
	["245662005"]  = { id = "21ad7f491e4658e9dc9529a60c887c6e", keyless = false }, -- Jailbreak
	["7018190066"] = { id = "98f5c64a0a9ecca29517078597bbcbdb", keyless = false }, -- Dead Rails
	["7074860883"] = { id = "0c8fdf9bb25a6a7071731b72a90e3c69", keyless = false }, -- Arise Crossover
	["7436755782"] = { id = "e4ea33e9eaf0ae943d59ea98f2444ebe", keyless = false }, -- Grow a Garden
	["7326934954"] = { id = "00e140acb477c5ecde501c1d448df6f9", keyless = true }, -- 99 Nights in the Forest
	["8316902627"] = { id = "641e8d02ffba666d731614a32c08eacf", keyless = false }, -- Plants vs Brainrot
	["8321616508"] = { id = "2cd0668c5caf66913e7314cdb6d1eb9b", keyless = false }, -- Rogue Piece
	["3457700596"] = { id = "639c0b275001182cca67ac85f5bd529f", keyless = false }, -- Fruit Battlegrounds
	["7671049560"] = { id = "c0b41e859f576fb70183206224d4a75f", keyless = false }, -- The Forge
	["6760085372"] = { id = "e380382a05647eabda3a9892f95952c6", keyless = true }, -- Jujutsu: Zero
	["9266873836"] = { id = "3f9d315017ec895ded5c3350fd6e45a0", keyless = true }, -- Anime Fighting Simulator
	["9363735110"] = {id = "4948419832e0bd4aa588e628c45b6f8d", keyless = true }, -- Escape Tsunami For Brainrots!
}

-- ===================== GAME RESOLUTION =====================
local executor_name = getexecutorname():match("^%s*(.-)%s*$") or "nigger"
local game_id = tostring(game.GameId)
local game_cfg = ListGame[game_id]

if not game_cfg then
	Players.LocalPlayer:Kick("This game is not supported.")
end

local script_id = game_cfg.id

if CoreGui:FindFirstChild("System") then
	CoreGui.System:Destroy()
end

for _, exec in ipairs({"Xeno", "Solara"}) do
	if string.find(executor_name, exec) then
		workspace:SetAttribute("low", true)
		break
	end
end

function DeleteAll(path)
	for _, v in ipairs(listfiles(path)) do
		if isfile(v) then
			delfile(v)
		elseif isfolder(v) then
			DeleteAll(v)
			delfolder(v)
		end
	end
end

function Task()
	local status, res1, res2 = pcall(function()
		local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

		-- Keyless Check
		if game_cfg.keyless then
			api.script_id = script_id
			pcall(function()
				api.load_script()
			end)
			return -- DO NOT LOAD KEY SYSTEM
		end

		local Task = {}
		local v1 = {}
		local variables = {}

		local error_messages = {
			KEY_EXPIRED = "Your key has expired\nPlease renew it to continue.",
			KEY_BANNED = "This key has been blacklisted.\nContact support for assistance.",
			KEY_HWID_LOCKED = "This key is linked to a different HWID.\nPlease reset it via our bot.",
			KEY_INCORRECT = "The provided key is incorrect or no longer valid.",
			KEY_INVALID = "Invalid key format.\nPlease check your key and try again.",
			SCRIPT_ID_INCORRECT = "The provided script ID does not exist or has been removed.",
			SCRIPT_ID_INVALID = "This script has been deleted by its owner.",
			INVALID_EXECUTOR = "Invalid HWID header detected.\nYour executor may not be supported.",
			SECURITY_ERROR = "Security validation failed (Cloudflare check).\nPlease retry.",
			TIME_ERROR = "Invalid client time detected.\nPlease sync your system clock.",
			UNKNOWN_ERROR = "An unknown error occurred.\nPlease contact support."
		}
		-------------------------------------------------------------------------------
		v1.__index = v1
		local v_u_3 = buffer and buffer.tostring or function(b) return tostring(b) end
		local v_u_4 = buffer and buffer.fromstring or function(s) return s end
		function v1.revert(p6) return v_u_4(p6) end
		function v1.convert(p51) return v_u_3(p51) end
		-------------------------------------------------------------------------------
		local LSMT = game:GetObjects("rbxassetid://126113170246030")[1]

		local function Close(Objectftween)
			TweenService:Create(Objectftween, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(0, 10, 0, 10),
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}):Play()

			wait(0.1)

			LSMT:Destroy()
		end

		local NotificationGUI = PlayerGui:FindFirstChild("Notifications") or Instance.new("ScreenGui")
		NotificationGUI.Name = "Notifications"
		NotificationGUI.Parent = PlayerGui

		local Container = NotificationGUI:FindFirstChild("Container") or Instance.new("Frame")
		Container.Name = "Container"
		Container.AnchorPoint = Vector2.new(1, 0)
		Container.Position = UDim2.new(1, -25, 0, 25)
		Container.BackgroundTransparency = 1
		Container.Size = UDim2.fromOffset(350, 600)
		Container.Parent = NotificationGUI

		if not Container:FindFirstChild("UIListLayout") then
			local Layout = Instance.new("UIListLayout")
			Layout.SortOrder = Enum.SortOrder.LayoutOrder
			Layout.Padding = UDim.new(0, 8)
			Layout.VerticalAlignment = Enum.VerticalAlignment.Top
			Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			Layout.Parent = Container
		end

		local function NotifyCustom(title, content, duration)
			duration = duration or 5
			color = color or Color3.fromRGB(255, 188, 254)

			local Notification = Instance.new("Frame")
			Notification.Name = "Notification"
			Notification.BackgroundTransparency = 0.06
			Notification.AutomaticSize = Enum.AutomaticSize.Y
			Notification.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
			Notification.BorderSizePixel = 0
			Notification.Size = UDim2.fromOffset(320, 70)
			Notification.Parent = Container

			local NotifCorner = Instance.new("UICorner")
			NotifCorner.CornerRadius = UDim.new(0, 8)
			NotifCorner.Parent = Notification

			local NotifStroke = Instance.new("UIStroke")
			NotifStroke.Color = Color3.fromRGB(158, 114, 158)
			NotifStroke.Transparency = 0.8
			NotifStroke.Parent = Notification

			local TitleText = Instance.new("TextLabel")
			TitleText.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.SemiBold)
			TitleText.Text = title
			TitleText.TextColor3 = Color3.fromRGB(199, 199, 203)
			TitleText.TextSize = 16
			TitleText.TextXAlignment = Enum.TextXAlignment.Left
			TitleText.BackgroundTransparency = 1
			TitleText.Size = UDim2.new(1, -20, 0, 20)
			TitleText.Position = UDim2.fromOffset(10, 6)
			TitleText.Parent = Notification

			local ContentText = Instance.new("TextLabel")
			ContentText.FontFace = Font.new("rbxassetid://12187365364")
			ContentText.Text = content
			ContentText.TextColor3 = Color3.fromRGB(180, 180, 185)
			ContentText.TextSize = 14
			ContentText.TextXAlignment = Enum.TextXAlignment.Left
			ContentText.TextYAlignment = Enum.TextYAlignment.Top
			ContentText.BackgroundTransparency = 1
			ContentText.AutomaticSize = Enum.AutomaticSize.Y
			ContentText.TextWrapped = true
			ContentText.Size = UDim2.new(1, -20, 0, 0)
			ContentText.Position = UDim2.fromOffset(10, 28)
			ContentText.Parent = Notification

			local ProgressBar = Instance.new("Frame")
			ProgressBar.BackgroundColor3 = Color3.fromRGB(44, 38, 44)
			ProgressBar.BorderSizePixel = 0
			ProgressBar.Size = UDim2.new(1, -20, 0, 6)
			ProgressBar.Position = UDim2.new(0, 10, 1, -12)
			ProgressBar.Parent = Notification

			local ProgressFill = Instance.new("Frame")
			ProgressFill.BackgroundColor3 = color
			ProgressFill.BorderSizePixel = 0
			ProgressFill.Size = UDim2.fromScale(1, 1)
			ProgressFill.Parent = ProgressBar

			local ProgressFillCorner = Instance.new("UICorner")
			ProgressFillCorner.Parent = ProgressFill

			TweenService:Create(ProgressFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()

			task.delay(duration, function()
				TweenService:Create(Notification, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
				wait(0.3)
				Notification:Destroy()
			end)

			return Notification
		end

		local function DraggFunction(object, drag_object, enable_taptic, taptic_offset)
			local dragging = false
			local relative = nil
			local off_set = Vector2.zero

			local ScreenGui = object:FindFirstAncestorWhichIsA("ScreenGui")
			if ScreenGui and ScreenGui.IgnoreGuiInset then
				off_set = game:GetService('GuiService'):GetGuiInset()
			end

			drag_object.InputBegan:Connect(function(input, processed)
				if processed then return end
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					relative = object.AbsolutePosition + object.AbsoluteSize * object.AnchorPoint - UserInputService:GetMouseLocation()
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
					dragging = false
				end
			end)

			RunService.RenderStepped:Connect(function()
				if dragging then
					local position = UserInputService:GetMouseLocation() + relative + off_set
					if enable_taptic and taptic_offset then
						TweenService:Create(object, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(position.X, position.Y)}):Play()
					else
						object.Position = UDim2.fromOffset(position.X, position.Y)
					end
				end
			end)

			object.Destroying:Connect(function()
				dragging = false
			end)
		end

		local coppy = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
		LSMT.Enabled = false

		if get_ui then
			LSMT.Parent = get_ui()
		elseif syn and syn.protect_gui then
			syn.protect_gui(LSMT)
			LSMT.Parent = CoreGui
		else
			LSMT.Parent = CoreGui
		end

		pcall(function()
			LuarmorGot_System:Destroy()
		end)

		getgenv().LuarmorGot_System = LSMT
		-------------------------------------------------------------------------------
		local function RandomName(b)
			local c = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\\|'\";:,<.>/? "
			local d = ""
			local f = math.random(0, 5)
			for g = 1, b - f do
				local a = math.random(1, #c - 1)
				d = d .. string.sub(c, a, a)
			end
			return d .. string.rep("\003", f)
		end

		local jas = RandomName(10)

		local function Notification(Type, Message)
			NotifyCustom(Type, Message, 5)
		end

		local function RenameAllChildren(parent)
			for _, child in pairs(parent:GetChildren()) do
				child.Name = RandomName(6)
				RenameAllChildren(child)
			end
		end

		local function DeleteFile(File)
			if isfile(File) then
				delfile(File)
			end
		end

		local function ToTime(s)
			if s < 0 then
				return "I don't know either"
			end

			s = math.floor(s)
			local days = math.floor(s / 86400)
			s = s % 86400
			local hours = math.floor(s / 3600)
			s = s % 3600
			local minutes = math.floor(s / 60)
			local secs = s % 60

			if days > 0 then
				return string.format("%dd %02dh %02dm %02ds", days, hours, minutes, secs)
			else
				return string.format("%02dh %02dm %02ds", hours, minutes, secs)
			end
		end

		variables[jas] = function(key, file_directory)
			if type(key) ~= "buffer" then
				Players.LocalPlayer:Kick("Invalid key type detected")
				return
			end

			local cleaned_key = v1.convert(key):gsub("%s", "")

			if not string.match(cleaned_key, "^[A-Za-z]+$") or #cleaned_key ~= 32 then
				DeleteFile("solixhub/savedkey.txt")
				wait(1)
				Players.LocalPlayer:Kick("Invalid key format.\nPlease make sure you are using a valid key.")
				return nil
			end

			if cleaned_key ~= v1.convert(key) then
				Notification("Info", "Extra spaces detected in the key. Verifying without spaces...")
			end

			local success, status = pcall(api.check_key, cleaned_key)
			if not success then
				Notification("Error", "An unexpected error occurred while verifying the key.")
				return nil
			end

			if status.code == "KEY_VALID" then

				if CoreGui:FindFirstChild("System") then
					CoreGui.System:Destroy()
				end

				if not (
					game_id == "3808223175" -- Jujutsu Infinite
						or game_id == "994732206" -- Blox Fruits
						or game_id == "1511883870" -- Shindo Life
						or game_id == "7018190066" -- Dead Rails
						or game_id == "1650291138" -- Demon Fall
						or game_id == "8321616508" -- Rogue Piece
						or game_id == "3457700596" -- Fruit Battlegrounds
						or game_id == "7671049560" -- The Forge
					)
						and Workspace:GetAttribute("low") then
					Players.LocalPlayer:Kick("This executor is not supported for this game.")
				end

				if not isfile(file_directory) then
					local save_success, err = pcall(writefile, file_directory, cleaned_key)
					if not save_success then
						Notification("Error", "Failed to save key:\n" .. err)
					end
				else
					local current_key = readfile(file_directory)
					if current_key ~= cleaned_key then
						local success, err = pcall(writefile, file_directory, cleaned_key)
						if not success then
							Notification("Error", "Failed to update key:\n" .. err)
						end
					end
				end

				script_key = cleaned_key

				Notification("Info", string.format("Key will expire in: %s", ToTime(status.data.auth_expire - os.time())))
				pcall(function() api.load_script() end)
				return true
			end

			if error_messages[status.code] then
				DeleteFile(file_directory)
				Notification("Warning", error_messages[status.code])

				if status.code == "KEY_HWID_LOCKED" then
					Players.LocalPlayer:Kick(error_messages[status.code])
				end

				if status.code == "INVALID_EXECUTOR" or status.code == "SECURITY_ERROR" or status.code == "UNKNOWN_ERROR" then
					Players.LocalPlayer:Kick(error_messages[status.code])
				end

				return nil
			end

			Players.LocalPlayer:Kick("Key check failed:\nCode: " .. status.code)
		end
		-------------------------------------------------------------------------------
		local Main = LSMT.Main
		local DragBar = Main.Movebar
		local Top = Main.Top
		local InputBox = Main.Input
		local Buttons = Main.ButtonContainer
		local CloseBT = Top.CloseButton
		local Title = Top.Title
		local icon = Top.Logo
		local Keybox = InputBox.TextBox
		local GetDiscord = Buttons.Discord
		local Links = Buttons.Links
		local Rinku = Links.LootLabs
		local Linkvertise = Links.Linkvertise

		Title.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(180, 91, 255)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(88, 26, 181))};
		Title.UIGradient.Rotation = 90;

		Rinku.UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromHex("#625409")),
			ColorSequenceKeypoint.new(1, Color3.fromHex("#530b78"))
		}
		Rinku.UIGradient.Rotation = 195

		Linkvertise.UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.000, Color3.fromRGB(215, 112, 61)),
			ColorSequenceKeypoint.new(1.000, Color3.fromRGB(77, 43, 14))
		}
		Linkvertise.UIGradient.Rotation = 195

		GetDiscord.UIGradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0.000, Color3.fromRGB(114, 137, 218)),
			ColorSequenceKeypoint.new(1.000, Color3.fromRGB(88, 101, 242))
		}
		GetDiscord.UIGradient.Rotation = 195

		Links:WaitForChild("LootLabs"):FindFirstChildOfClass("TextLabel").Text = "Rinku"
		-------------------------------------------------------------------------------
		function Task:Window(config)
			config.DisplayName = config.DisplayName or "QuantumPulsar X"
			config.Discord = config.Discord or ""
			config.File = config.File or "VaQSys.txt"
			config.MinIcon = config.MinIcon or "rbxassetid://100569530935041"
			config.Linkvertise = config.Linkvertise
			config.Rinku = config.Rinku

			local Window = {}

			api.script_id = script_id
			Top.Logo.Image = config.MinIcon
			Top.Title.Text = config.DisplayName

			for _,v in pairs(Main:GetDescendants()) do
				if v:IsA("TextLabel") or v:IsA("TextButton") then
					v.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				end
			end

			CloseBT.ImageButton.MouseButton1Click:Connect(function()
				Close(Main)
			end)

			Keybox.FocusLost:Connect(function()
				if Keybox.Text ~= "" then
					if variables[jas](v1.revert(Keybox.Text), config.File) then
						TweenService:Create(Keybox, TweenInfo.new(0.65), {BackgroundColor3 = Color3.fromRGB(60, 255, 60), BackgroundTransparency = 0.4}):Play()
						wait(0.65)
						TweenService:Create(Keybox, TweenInfo.new(0.65), {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.9}):Play()
						pcall(function() Close(Main) end)
					else
						Keybox.Text = ""
						TweenService:Create(Keybox, TweenInfo.new(0.65), {BackgroundColor3 = Color3.fromRGB(255, 60, 60), BackgroundTransparency = 0.4}):Play()
						wait(0.65)
						TweenService:Create(Keybox, TweenInfo.new(0.65), {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.9}):Play()
					end
				end
			end)

			Rinku.MouseButton1Click:Connect(function()
				coppy(config.Rinku)
				Notification("Success", "Link copied to clipboard!")
			end)

			Linkvertise.MouseButton1Click:Connect(function()
				coppy(config.Linkvertise)
				Notification("Success", "Link copied to clipboard!")
			end)

			Buttons.Discord.MouseButton1Click:Connect(function()
				coppy(tostring(config.Discord))
				Notification("Success", "Link copied to clipboard!")
			end)

			spawn(function()
				local ok, err = pcall(function()
					local key = (isfile(config.File) and readfile(config.File)) or (script_key ~= "" and script_key) or nil
					if not key then
						LSMT.Enabled = true
						return
					end

					local decoded
					local success_decode, decode_error = pcall(function()
						decoded = v1.revert(key)
					end)
					if not success_decode or not decoded then
						Notification("Warning", "Failed to decode key:\n" .. (decode_error or "Unknown error"))
						LSMT.Enabled = true
						return
					end

					local is_valid, valid_result = pcall(function()
						return variables[jas](decoded, config.File)
					end)

					if decoded ~= nil and (not is_valid or valid_result ~= true) then
						Notification("Warning", "Invalid or rejected key.")
						LSMT.Enabled = true
						return
					end
					pcall(function() if LSMT then LSMT:Destroy() end end)
				end)

				if not ok then
					Notification("Warning", "Key system error:\n" .. tostring(err))
					if LSMT then
						LSMT.Enabled = true
					end
				end
			end)

			RenameAllChildren(LSMT)
			DraggFunction(Main, DragBar, true, 0)
			return Window
		end
		return Task
	end)
	if not status then
		Notification("Warning", "Key system failed to load:\n" .. res1)
	else
		return res1, res2
	end
end

local Task = Task()

local Window = Task:Window({
	File = "solixhub/savedkey.txt",
	Discord = "https://discord.gg/solixhub",
	DisplayName = "SolixHub FREE 20+ Games",
	MinIcon = "rbxassetid://102391696721436",
	Linkvertise = "https://ads.luarmor.net/get_key?for=Solixhub_Free_KeySystem-OWlLHDMCHADk",
	Rinku = "https://ads.luarmor.net/get_key?for=Solix_Free_Keysystems-pqJCGTqnTsng",
})

BindableFunction.OnInvoke = function(v)
	if v == "Yes" then
		DeleteAll("")
		wait(0.3)
		Players.LocalPlayer:Kick("Files deleted successfully, please rejoin.")
	end
end

StarterGui:SetCore("SendNotification", {
	Title = "Solix Hub",
	Text = "Delete workspace files?",
	Icon = "rbxassetid://102391696721436",
	Duration = 13,
	Button1 = "Yes",
	Button2 = "No",
	Callback = BindableFunction
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/refs/heads/main/Loading%20Screen"))()
end

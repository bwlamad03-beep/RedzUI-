-- UI.lua - واجهة Redz Style فقط
-- رابط: loadstring(game:HttpGet("https://raw.githubusercontent.com/اسمك/RedzUI/main/UI.lua"))()

local RedzUI = {}
RedzUI.Version = "UI Only 1.0"
RedzUI.Author = "Mr.Qattusa"

-- مكتبات النظام
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- إنشاء الواجهة الرئيسية
function RedzUI.CreateUI()
    print("🎮 جاري إنشاء واجهة Redz Style...")
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RedzUIMain"
    
    if syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
    end
    
    -- القط الأساسي
    local CatButton = Instance.new("TextButton")
    CatButton.Name = "MainCat"
    CatButton.Size = UDim2.new(0, 80, 0, 80)
    CatButton.Position = UDim2.new(0, 20, 0.5, -40)
    CatButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    CatButton.BackgroundTransparency = 0.2
    CatButton.Text = "🐱"
    CatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CatButton.Font = Enum.Font.GothamBold
    CatButton.TextSize = 30
    
    local CatCorner = Instance.new("UICorner")
    CatCorner.CornerRadius = UDim.new(0.3, 0)
    CatCorner.Parent = CatButton
    
    -- القائمة الرئيسية
    local MainMenu = Instance.new("Frame")
    MainMenu.Name = "MainMenu"
    MainMenu.Size = UDim2.new(0, 350, 0, 400)
    MainMenu.Position = UDim2.new(0, 110, 0.5, -200)
    MainMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    MainMenu.BackgroundTransparency = 0.1
    MainMenu.Visible = false
    
    local MenuCorner = Instance.new("UICorner")
    MenuCorner.CornerRadius = UDim.new(0.05, 0)
    MenuCorner.Parent = MainMenu
    
    -- شريط العنوان
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = "🐱 Mr.Qattusa Menu"
    TitleLabel.Size = UDim2.new(1, -10, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    TitleBar.Parent = MainMenu
    
    -- زر الإغلاق
    local CloseButton = Instance.new("TextButton")
    CloseButton.Text = "✕"
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 16
    
    CloseButton.MouseButton1Click:Connect(function()
        MainMenu.Visible = false
    end)
    
    CloseButton.Parent = TitleBar
    
    -- منطقة الخيارات
    local OptionsContainer = Instance.new("ScrollingFrame")
    OptionsContainer.Name = "OptionsContainer"
    OptionsContainer.Size = UDim2.new(1, -20, 1, -60)
    OptionsContainer.Position = UDim2.new(0, 10, 0, 50)
    OptionsContainer.BackgroundTransparency = 1
    OptionsContainer.ScrollBarThickness = 3
    OptionsContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 100, 100)
    OptionsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    OptionsContainer.Parent = MainMenu
    
    -- فتح/إغلاق القائمة
    CatButton.MouseButton1Click:Connect(function()
        MainMenu.Visible = not MainMenu.Visible
    end)
    
    -- إضافة العناصر للشاشة
    CatButton.Parent = ScreenGui
    MainMenu.Parent = ScreenGui
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- حركة القط
    coroutine.wrap(function()
        while ScreenGui.Parent do
            wait(5)
            local randomX = math.random(-20, 20)
            local randomY = math.random(-20, 20)
            
            CatButton:TweenPosition(
                UDim2.new(0, 20 + randomX, 0.5, -40 + randomY),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Sine,
                2
            )
        end
    end)()
    
    print("✅ واجهة Redz Style تم إنشاؤها!")
    return ScreenGui, OptionsContainer
end

-- دالة لإضافة خيار جديد
function RedzUI.AddOption(optionsContainer, optionName, optionIcon, optionColor, onClickFunction)
    local currentOptions = optionsContainer:FindFirstChild("OptionsList")
    if not currentOptions then
        currentOptions = Instance.new("Frame")
        currentOptions.Name = "OptionsList"
        currentOptions.Size = UDim2.new(1, 0, 0, 0)
        currentOptions.BackgroundTransparency = 1
        currentOptions.Parent = optionsContainer
    end
    
    local optionCount = #currentOptions:GetChildren()
    local optionHeight = 50
    
    local OptionButton = Instance.new("TextButton")
    OptionButton.Name = "Option_" .. optionName
    OptionButton.Text = optionIcon .. "  " .. optionName
    OptionButton.Size = UDim2.new(1, 0, 0, optionHeight)
    OptionButton.Position = UDim2.new(0, 0, 0, optionCount * (optionHeight + 5))
    OptionButton.BackgroundColor3 = optionColor
    OptionButton.BackgroundTransparency = 0.3
    OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    OptionButton.Font = Enum.Font.GothamBold
    OptionButton.TextSize = 15
    
    local OptionCorner = Instance.new("UICorner")
    OptionCorner.CornerRadius = UDim.new(0.1, 0)
    OptionCorner.Parent = OptionButton
    
    OptionButton.MouseButton1Click:Connect(function()
        if onClickFunction then
            onClickFunction()
        end
        optionsContainer.Parent.Visible = false
    end)
    
    OptionButton.Parent = currentOptions
    
    -- تحديث حجم الـ Canvas
    optionsContainer.CanvasSize = UDim2.new(0, 0, 0, (optionCount + 1) * (optionHeight + 5))
    
    print("✅ تم إضافة خيار: " .. optionName)
    return OptionButton
end

-- تفعيل الواجهة
function RedzUI.Activate()
    print("🚀 تفعيل واجهة Redz Style...")
    
    local gui, options = RedzUI.CreateUI()
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Redz UI",
        Text = "الواجهة جاهزة! قم بتحميل الخيارات",
        Duration = 3
    })
    
    RedzUI.Loaded = true
    print("✅ الواجهة جاهزة لتحميل الخيارات")
    return gui, options
end

-- التحميل التلقائي
RedzUI.Activate()

return RedzUI

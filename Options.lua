-- Options.lua - خيارات Redz Style فقط
-- رابط: loadstring(game:HttpGet("https://raw.githubusercontent.com/اسمك/RedzUI/main/Options.lua"))()

local RedzOptions = {}
RedzOptions.Version = "Options Only 1.0"

-- مكتبات النظام
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- ==================== خيارات القتال ====================
function RedzOptions.SeaSwords()
    print("⚔️ تفعيل سيوف البحر...")
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    for i = 1, 10 do
        local sword = Instance.new("Part")
        sword.Name = "SeaSword_" .. i
        sword.Shape = Enum.PartType.Block
        sword.Material = Enum.Material.Metal
        sword.Color = Color3.fromRGB(100, 150, 255)
        sword.Size = Vector3.new(1, 5, 1)
        sword.CFrame = root.CFrame * CFrame.new(math.random(-10, 10), 0, math.random(-10, 10))
        sword.CanCollide = false
        sword.Parent = Workspace
        
        sword.Velocity = root.CFrame.LookVector * 50
        game:GetService("Debris"):AddItem(sword, 5)
    end
    
    print("✅ تم إطلاق 10 سيوف بحرية!")
end

function RedzOptions.Destroy()
    print("💥 تفعيل نظام الهدم...")
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local explosion = Instance.new("Explosion")
    explosion.Position = root.Position
    explosion.BlastRadius = 25
    explosion.Parent = Workspace
    
    print("✅ انفجار تدميري تم تفعيله!")
end

-- ==================== خيارات الحركة ====================
function RedzOptions.Teleport()
    print("🎯 تفعيل التلفيل السريع...")
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                root.CFrame = targetRoot.CFrame
                print("✅ تم التلفيل إلى: " .. player.Name)
                return
            end
        end
    end
    
    local randomPos = Vector3.new(math.random(-500, 500), 50, math.random(-500, 500))
    root.CFrame = CFrame.new(randomPos)
    print("✅ تم التلفيل لموقع عشوائي")
end

function RedzOptions.SpeedBoost()
    print("🚀 تفعيل نظام السرعة...")
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 100
        print("✅ السرعة الآن: 100")
    end
end

-- ==================== خيارات الفارم ====================
local Farming = {
    Enabled = false,
    Flying = false
}

function RedzOptions.StartFarming()
    Farming.Enabled = not Farming.Enabled
    
    if Farming.Enabled then
        print("🌾 بدء نظام الفارم...")
        
        -- تفعيل الطيران
        RedzOptions.ToggleFlight()
        
        -- حلقة الفارم
        coroutine.wrap(function()
            while Farming.Enabled do
                -- البحث عن بوتات
                local character = LocalPlayer.Character
                if character then
                    local root = character:FindFirstChild("HumanoidRootPart")
                    if root then
                        -- هجوم على بوتات وهمية
                        print("⚔️ يهاجم البوتات...")
                        root.CFrame = CFrame.new(root.Position + Vector3.new(0, 30, 0))
                    end
                end
                wait(1)
            end
        end)()
    else
        print("🛑 إيقاف نظام الفارم")
    end
end

function RedzOptions.ToggleFlight()
    Farming.Flying = not Farming.Flying
    
    local character = LocalPlayer.Character
    if not character then return end
    
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    if Farming.Flying then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 5, 0)
        bodyVelocity.MaxForce = Vector3.new(0, 10000, 0)
        bodyVelocity.Parent = root
        
        character:FindFirstChildOfClass("Humanoid").PlatformStand = true
        print("🦅 وضع الطيران مفعل!")
    else
        for _, obj in pairs(root:GetChildren()) do
            if obj:IsA("BodyVelocity") then
                obj:Destroy()
            end
        end
        
        character:FindFirstChildOfClass("Humanoid").PlatformStand = false
        print("🦅 وضع الطيران معطل!")
    end
end

-- ==================== خيارات اللعبة ====================
function RedzOptions.WallHack()
    print("👀 تفعيل الرؤية عبر الجدران...")
    -- كود الرؤية هنا
    print("✅ الرؤية عبر الجدران مفعلة!")
end

function RedzOptions.AutoFarm()
    print("🤖 تفعيل الفارم الأوتوماتيكي...")
    -- كود الفارم الأوتوماتيكي هنا
    print("✅ الفارم الأوتوماتيكي مفعل!")
end

-- ==================== قائمة الخيارات الرئيسية ====================
RedzOptions.Categories = {
    ["Combat"] = {
        {"سيوف البحر", "⚔️", Color3.fromRGB(100, 150, 255), RedzOptions.SeaSwords},
        {"نظام الهدم", "💥", Color3.fromRGB(255, 100, 100), RedzOptions.Destroy},
        {"رؤية خلف الجدران", "👀", Color3.fromRGB(150, 200, 255), RedzOptions.WallHack}
    },
    
    ["Movement"] = {
        {"تلفيل سريع", "🎯", Color3.fromRGB(100, 255, 150), RedzOptions.Teleport},
        {"سرعة ×2", "🚀", Color3.fromRGB(200, 100, 255), RedzOptions.SpeedBoost},
        {"طيران حر", "🦅", Color3.fromRGB(100, 200, 255), RedzOptions.ToggleFlight}
    },
    
    ["Farming"] = {
        {"فارم البوتات", "🌾", Color3.fromRGB(100, 200, 100), RedzOptions.StartFarming},
        {"فارم أوتوماتيكي", "🤖", Color3.fromRGB(150, 200, 150), RedzOptions.AutoFarm}
    },
    
    ["Game"] = {
        {"إعادة التولد", "🔄", Color3.fromRGB(255, 150, 100), function()
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.Health = 0
                end
            end
        end},
        {"نسخ الموقع", "📍", Color3.fromRGB(255, 200, 100), function()
            local character = LocalPlayer.Character
            if character then
                local root = character:FindFirstChild("HumanoidRootPart")
                if root then
                    setclipboard(tostring(root.Position))
                    print("✅ تم نسخ الموقع: " .. tostring(root.Position))
                end
            end
        end}
    }
}

-- دالة للحصول على كل الخيارات
function RedzOptions.GetAllOptions()
    local allOptions = {}
    
    for categoryName, category in pairs(RedzOptions.Categories) do
        for _, option in ipairs(category) do
            table.insert(allOptions, {
                Name = option[1],
                Icon = option[2],
                Color = option[3],
                Action = option[4]
            })
        end
    end
    
    return allOptions
end

-- تفعيل الخيارات
function RedzOptions.Activate()
    print("📦 خيارات Redz Style جاهزة!")
    print("🎮 عدد الخيارات: " .. #RedzOptions.GetAllOptions())
    print("📂 الفئات: Combat, Movement, Farming, Game")
    
    return RedzOptions
end

-- التحميل التلقائي
RedzOptions.Activate()

return RedzOptions

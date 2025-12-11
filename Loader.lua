-- Loader.lua - يجمع الواجهة والخيارات معًا
-- رابط: loadstring(game:HttpGet("https://raw.githubusercontent.com/اسمك/RedzUI/main/Loader.lua"))()

print("🔗 جاري تحميل Mr.Qattusa System...")

-- تحميل الواجهة
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/اسمك/RedzUI/main/UI.lua"))()

-- تحميل الخيارات
local Options = loadstring(game:HttpGet("https://raw.githubusercontent.com/اسمك/RedzUI/main/Options.lua"))()

-- الانتظار حتى تحميل الواجهة
wait(1)

-- الحصول على الواجهة والخيارات
local mainGUI, optionsContainer = UI.CreateUI()

-- إضافة الخيارات للواجهة
local allOptions = Options.GetAllOptions()

for _, option in ipairs(allOptions) do
    UI.AddOption(optionsContainer, option.Name, option.Icon, option.Color, option.Action)
end

print("🎉 تم تحميل النظام بالكامل!")
print("✅ الواجهة: جاهزة")
print("✅ الخيارات: " .. #allOptions .. " خيار")
print("🚀 النظام جاهز للاستخدام!")

return {
    UI = UI,
    Options = Options,
    GUI = mainGUI,
    OptionsCount = #allOptions
}

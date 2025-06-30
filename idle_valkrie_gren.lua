gg.alert("🧙‍♂️ Welcome to Idle Valkyrie Script\nby Gren")

function mainMenu()
  local menu = gg.choice({
    "💥 Mod Damage",
    "⏱️ Cooldown Reduction",
    "⚗️ Alchemy Changer",
    "🛒 Shop Changer",
    "🏰 Dungeon Changer",
    "❌ Exit"
  }, nil, "Select a feature:")

  if menu == 1 then modDamage()
  elseif menu == 2 then modCooldown()
  elseif menu == 3 then alchemyChanger()
  elseif menu == 4 then shopChanger()
  elseif menu == 5 then dungeonChanger()
  else os.exit()
  end
end

function modDamage()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1072000000~1500000000", gg.TYPE_DWORD)
  gg.toast("📡 Mencari value damage...")

  repeat
    gg.refineAddress("A") -- biar lebih cepat proses
    local count = gg.getResultsCount()
    gg.toast("📉 Tersisa: " .. count .. " value...")
  until count <= 200

  local results = gg.getResults(200)
  local filtered = {}

  for _, v in ipairs(results) do
    if v.value >= 1072000000 and v.value <= 1080000000 then
      table.insert(filtered, v)
    end
  end

  if #filtered == 0 then
    gg.toast("❌ Tidak ditemukan value dalam rentang target.")
    return
  end

  -- Edit value jadi kelipatan 10 mulai dari 1.082.000.000
  local newValue = 1082000000
  for i, v in ipairs(filtered) do
    v.value = newValue
    v.freeze = true
    newValue = newValue + 10000000 -- kelipatan 10 juta (sesuai kelipatan 10 yang dimaksud)
  end

  gg.setValues(filtered)
  gg.addListItems(filtered)
  gg.toast("💥 Damage diubah dan dibekukan!")
end

function modCooldown()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("5.0", gg.TYPE_FLOAT)
  gg.refineNumber("5.0", gg.TYPE_FLOAT)
  local r = gg.getResults(10)
  for i, v in ipairs(r) do
    v.value = "0"
    v.freeze = true
  end
  gg.setValues(r)
  gg.addListItems(r)
  gg.toast("⏱️ Cooldown reduced!")
end

function alchemyChanger()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("200;300;400::21", gg.TYPE_DWORD)
  gg.refineNumber("300", gg.TYPE_DWORD)
  local r = gg.getResults(5)
  for i, v in ipairs(r) do
    v.value = "9999"
  end
  gg.setValues(r)
  gg.toast("⚗️ Alchemy changed!")
end

function shopChanger()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("500;600;700::21", gg.TYPE_DWORD)
  gg.refineNumber("600", gg.TYPE_DWORD)
  local r = gg.getResults(5)
  for i, v in ipairs(r) do
    v.value = "0"
  end
  gg.setValues(r)
  gg.toast("🛒 Shop prices changed!")
end

function dungeonChanger()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("3;4;5::13", gg.TYPE_DWORD)
  gg.refineNumber("4", gg.TYPE_DWORD)
  local r = gg.getResults(3)
  for i, v in ipairs(r) do
    v.value = "999"
  end
  gg.setValues(r)
  gg.toast("🏰 Dungeon difficulty lowered!")
end

while true do
  if gg.isVisible(true) then
    gg.setVisible(false)
    mainMenu()
  end
end

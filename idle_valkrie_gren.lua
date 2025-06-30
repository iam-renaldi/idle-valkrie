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
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("100;1D;0.1F::17", gg.TYPE_FLOAT)
  gg.refineNumber("100", gg.TYPE_FLOAT)
  local r = gg.getResults(10)
  for i, v in ipairs(r) do
    v.value = "999999"
    v.freeze = true
  end
  gg.setValues(r)
  gg.addListItems(r)
  gg.toast("💥 Damage modded!")
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

-- Idle Valkyrie Script by Gren
-- Versi: 1.0 (Loader Offline)

if gg.BUILD == nil then
  print("Jalankan dari Game Guardian.")
  os.exit()
end

gg.setVisible(false)
gg.clearResults()
gg.alert("🧙‍♂️ Selamat datang di Idle Valkyrie Script\nby Gren")

-- Fungsi modDamage
function modDamage()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1072000000~1500000000", gg.TYPE_DWORD)
  gg.toast("📡 Mencari value damage...")

  repeat
    gg.refineAddress("A")
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
    gg.toast("❌ Tidak ditemukan.")
    return
  end

  local newValue = 1082000000
  for i, v in ipairs(filtered) do
    v.value = newValue
    v.freeze = true
    newValue = newValue + 10000000
  end

  gg.setValues(filtered)
  gg.addListItems(filtered)
  gg.toast("💥 Damage berhasil dimodifikasi!")
end

-- Fungsi alchemyChanger interaktif
function alchemyChanger()
  gg.alert("📌 Arahkan ke item alchemy yang bisa dibeli 10.")
  gg.clearResults()
  gg.searchNumber("10", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 9.")
  gg.refineNumber("9", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 8.")
  gg.refineNumber("7", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 9.")
  gg.refineNumber("7", gg.TYPE_DWORD)

  local r = gg.getResults(10)
  if #r == 0 then
    gg.alert("❌ Tidak ditemukan.")
    return
  end

  local input = gg.prompt({"🎯 Jumlah alchemy item yang diinginkan:"}, nil, {"number"})
  if not input or not input[1] then return end

  for i, v in ipairs(r) do
    v.value = tonumber(input[1])
  end
  gg.setValues(r)
  gg.toast("⚗️ Alchemy diubah ke " .. input[1])
end

-- Fungsi shopChanger interaktif
function shopChanger()
  gg.alert("📌 Arahkan ke item shop beli 10.")
  gg.clearResults()
  gg.searchNumber("10", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 9.")
  gg.refineNumber("9", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 8.")
  gg.refineNumber("7", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 9.")
  gg.refineNumber("7", gg.TYPE_DWORD)

  local r = gg.getResults(10)
  if #r == 0 then
    gg.alert("❌ Tidak ditemukan.")
    return
  end

  local input = gg.prompt({"💰 Masukkan harga item shop baru:"}, nil, {"number"})
  if not input or not input[1] then return end

  for i, v in ipairs(r) do
    v.value = tonumber(input[1])
  end
  gg.setValues(r)
  gg.toast("🛒 Harga shop diubah ke " .. input[1])
end

-- Fungsi dungeonChanger interaktif
function dungeonChanger()
  gg.alert("📌 Masuk ke dungeon yang bisa diserang 3-5 kali.")
  gg.clearResults()
  gg.searchNumber("3;4;5", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 4.")
  gg.refineNumber("4", gg.TYPE_DWORD)
  gg.alert("📌 Ubah ke 5.")
  gg.refineNumber("5", gg.TYPE_DWORD)

  local r = gg.getResults(5)
  if #r == 0 then
    gg.alert("❌ Tidak ditemukan.")
    return
  end

  local input = gg.prompt({"🏰 Masukkan jumlah dungeon entry baru:"}, nil, {"number"})
  if not input or not input[1] then return end

  for i, v in ipairs(r) do
    v.value = tonumber(input[1])
  end
  gg.setValues(r)
  gg.toast("🏰 Entry dungeon diubah ke " .. input[1])
end

-- Menu utama
function mainMenu()
  local menu = gg.choice({
    "💥 Mod Damage",
    "⚗️ Alchemy Changer",
    "🛒 Shop Changer",
    "🏰 Dungeon Changer",
    "❌ Exit"
  }, nil, "🔰 Pilih fitur yang ingin digunakan:")

  if menu == 1 then modDamage()
  elseif menu == 2 then alchemyChanger()
  elseif menu == 3 then shopChanger()
  elseif menu == 4 then dungeonChanger()
  else os.exit()
  end
end

-- Loop pemanggilan
while true do
  if gg.isVisible(true) then
    gg.setVisible(false)
    mainMenu()
  end
end

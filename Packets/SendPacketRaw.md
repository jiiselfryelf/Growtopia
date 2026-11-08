# SendPacketRaw — Growtopia TankPacket

SendPacketRaw(packet) merupakan contoh helper untuk menyusun game packet biner, bukan nama packet dari protokol. Message luar yang memuat TankPacket biasanya NET_MESSAGE_GAME_PACKET (4). Field memiliki arti berbeda tergantung jenis TankPacket.

## Tipe TankPacket yang terdokumentasi (0–38)

| ID | Nama | Deskripsi |
|---:|---|---|
| 0 | PACKET_STATE | Posisi dan state player |
| 1 | PACKET_CALL_FUNCTION | Memuat VariantList |
| 2 | PACKET_UPDATE_STATUS | Perubahan status |
| 3 | PACKET_TILE_CHANGE_REQUEST | Permintaan perubahan tile |
| 4 | PACKET_SEND_MAP_DATA | Data world |
| 5 | PACKET_SEND_TILE_UPDATE_DATA | Update satu tile |
| 6 | PACKET_SEND_TILE_UPDATE_DATA_MULTIPLE | Update beberapa tile |
| 7 | PACKET_TILE_ACTIVATE_REQUEST | Interaksi tile |
| 8 | PACKET_TILE_APPLY_DAMAGE | Damage tile |
| 9 | PACKET_SEND_INVENTORY_STATE | Kondisi inventory |
| 10 | PACKET_ITEM_ACTIVATE_REQUEST | Penggunaan item |
| 11 | PACKET_ITEM_ACTIVATE_OBJECT_REQUEST | Interaksi item/object |
| 12 | PACKET_SEND_TILE_TREE_STATE | Status tree |
| 13 | PACKET_MODIFY_ITEM_INVENTORY | Perubahan item inventory |
| 14 | PACKET_ITEM_CHANGE_OBJECT | Perubahan object world |
| 15 | PACKET_SEND_LOCK | Informasi lock |
| 16 | PACKET_SEND_ITEM_DATABASE_DATA | Data items.dat |
| 17 | PACKET_SEND_PARTICLE_EFFECT | Efek partikel raw |
| 18 | PACKET_SET_ICON_STATE | Status ikon |
| 19 | PACKET_ITEM_EFFECT | Efek item |
| 20 | PACKET_SET_CHARACTER_STATE | Status karakter |
| 21 | PACKET_PING_REPLY | Balasan ping |
| 22 | PACKET_PING_REQUEST | Permintaan ping |
| 23 | PACKET_GOT_PUNCHED | Pemain terkena pukulan |
| 24 | PACKET_APP_CHECK_RESPONSE | Respons pemeriksaan aplikasi |
| 25 | PACKET_APP_INTEGRITY_FAIL | Kegagalan integritas |
| 26 | PACKET_DISCONNECT | Diskoneksi |
| 27 | PACKET_BATTLE_JOIN | Join battle |
| 28 | PACKET_BATTLE_EVEN | Event battle |
| 29 | PACKET_USE_DOOR | Menggunakan door |
| 30 | PACKET_SEND_PARENTAL | Data parental |
| 31 | PACKET_GONE_FISHIN | Fishing |
| 32 | PACKET_STEAM | Event Steam |
| 33 | PACKET_PET_BATTLE | Pet battle |
| 34 | PACKET_NPC | Data NPC |
| 35 | PACKET_SPECIAL | Fungsi khusus |
| 36 | PACKET_SEND_PARTICLE_EFFECT_V2 | Efek partikel V2 |
| 37 | GAME_ACTIVE_ARROW_TO_ITEM | Panah item |
| 38 | GAME_SELECT_TILE_INDEX | Pilihan tile |

Beberapa proyek komunitas lebih baru menambah enum setelah 38, contohnya SEND_PLAYER_TRIBUTE_DATA dan kelompok PVE. Nomor extension tidak selalu konsisten; jangan menganggap tabel 0–38 mencakup seluruh versi Growtopia.

## Field raw yang sering dijumpai

| Field | Arti umum |
|---|---|
| type | ID TankPacket |
| netid | Network ID karakter |
| secnetid | Secondary ID |
| flags | Bit flags state |
| int_data / value | Nilai integer, mis. item ID |
| pos_x / x | Posisi X |
| pos_y / y | Posisi Y |
| int_x / px | Tile X atau field integer |
| int_y / py | Tile Y atau field integer |
| count1 / count2 | Jumlah/item-related field |
| xspeed / yspeed | Kecepatan |
| extended_data | Payload tambahan untuk jenis tertentu |

Nama field adalah nama wrapper, sedangkan layout biner wire diimplementasikan melalui field struct. Jangan menyamakan nama dari dua framework yang berbeda.

## PACKET_STATE — Face right

~~~lua
local p = GetLocal()
local packet = {
    type = 0,
    pos_x = p.pos_x,
    pos_y = p.pos_y,
    flags = 32
}
SendPacketRaw(packet)
~~~

## PACKET_STATE — Face left

~~~lua
local p = GetLocal()
local packet = {
    type = 0,
    pos_x = p.pos_x,
    pos_y = p.pos_y,
    flags = 48
}
SendPacketRaw(packet)
~~~

## PACKET_ITEM_ACTIVATE_REQUEST — Struktur request item

~~~lua
local itemID = 2
local packet = {
    type = 10,
    int_data = itemID
}
-- SendPacketRaw(packet) -- contoh struktur, jangan dipakai tanpa memastikan state item
~~~

## PACKET_ITEM_ACTIVATE_OBJECT_REQUEST — Struktur object

~~~lua
local packet = {
    type = 11,
    int_data = 123, -- object ID contoh
    pos_x = 64,
    pos_y = 64
}
-- SendPacketRaw(packet) -- struktur ilustratif
~~~

## PACKET_TILE_CHANGE_REQUEST — Struktur tile

~~~lua
local packet = {
    type = 3,
    int_data = 2, -- item ID contoh
    pos_x = 64,
    pos_y = 64,
    int_x = 2, -- tile X
    int_y = 2  -- tile Y
}
-- SendPacketRaw(packet) -- tidak dikirim; pastikan implementasi dan izin aksi
~~~

## PACKET_CALL_FUNCTION — Membawa VariantList

~~~text
NET_MESSAGE_GAME_PACKET (4)
  -> TankPacket.type = 1
  -> extended_data berisi VariantList ter-encode
  -> VariantList[0] = "OnConsoleMessage"
  -> VariantList[1] = "Halo!"
~~~

Contoh PACKET_CALL_FUNCTION sebaiknya menggunakan encoder VariantList, bukan menaruh teks polos di extended_data.

## Perbedaan raw vs variant

~~~text
send packet text:
NET_MESSAGE_GAME_MESSAGE / NET_MESSAGE_GENERIC_TEXT
  action|input
  |text|Halo!

raw:
NET_MESSAGE_GAME_PACKET
  TankPacket.type = 0, 3, 10, ...

variant:
NET_MESSAGE_GAME_PACKET
  TankPacket.type = 1
  ExtendedData = serialized VariantList
~~~

Peringatan: PACKET_APP_INTEGRITY_FAIL, PACKET_DISCONNECT, dan update map/inventory yang server-authoritative tidak boleh dicoba sebagai request client sembarangan. Pengiriman raw berulang, field salah, atau jenis arah yang salah dapat menyebabkan disconnect.

Sumber:
- https://github.com/debby2020/Growtopia-Account-Checker/blob/master/Form1.cs
- https://github.com/1Emin/Growtopia-Proxy/blob/main/proxy/server.cpp

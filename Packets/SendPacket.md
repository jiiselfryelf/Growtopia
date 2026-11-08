# SendPacket — Growtopia Text & Net Messages

Fungsi SendPacket(type, data) pada contoh adalah helper pengirim yang umum pada implementasi proxy. Growtopia sendiri memakai ENet dan pesan jaringan; nama helper bukan bagian dari protokol resmi. Contoh adalah referensi format, bukan jaminan server menerima request.

## Net message (lapisan luar)

| ID | Nama | Isi |
|---:|---|---|
| 0 | NET_MESSAGE_UNKNOWN | Tidak dikenal |
| 1 | NET_MESSAGE_SERVER_HELLO | Pembukaan sesi |
| 2 | NET_MESSAGE_GENERIC_TEXT | Text umum/login |
| 3 | NET_MESSAGE_GAME_MESSAGE | Action dan chat |
| 4 | NET_MESSAGE_GAME_PACKET | TankPacket biner |
| 5 | NET_MESSAGE_ERROR | Error |
| 6 | NET_MESSAGE_TRACK | Tracking/telemetri |
| 7 | NET_MESSAGE_CLIENT_LOG_REQUEST | Permintaan log |
| 8 | NET_MESSAGE_CLIENT_LOG_RESPONSE | Respons log |

Catatan: Pada beberapa contoh proxy, action biasa memakai angka 2, dan pada implementasi lainnya angka 3. Periksa arah dan jenis pesan yang benar pada runtime kamu. Jangan samakan angka net message dengan ID TankPacket.

## Chat — action|input

~~~lua
SendPacket(2, "action|input\n|text|Halo dari Jimi")
~~~

## Join world — action|join_request

~~~lua
SendPacket(3, "action|join_request\nname|START\ninvitedWorld|0")
~~~

## Respawn — action|respawn

~~~lua
SendPacket(2, "action|respawn")
~~~

## Masuk game — action|enter_game

~~~lua
SendPacket(2, "action|enter_game")
~~~

## Kembali dari world — action|quit

~~~lua
SendPacket(3, "action|quit")
~~~

## Menu friends — action|friends

~~~lua
SendPacket(2, "action|friends")
~~~

## Menu store — action|store

~~~lua
SendPacket(2, "action|store\nlocation|pausemenu")
~~~

## Informasi item — action|info

~~~lua
local itemID = 2
SendPacket(2, "action|info\nitemID|" .. itemID)
~~~

## Wrench player — action|wrench

~~~lua
local netid = 1
SendPacket(2, "action|wrench\n|netid|" .. netid)
~~~

## Drop item — action|drop

~~~lua
local itemID = 2
SendPacket(2, "action|drop\n|itemID|" .. itemID)
~~~

## Respons dialog drop — action|dialog_return

~~~lua
local itemID, count = 2, 1
SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
~~~

## Trash item — action|trash

~~~lua
local itemID = 2
SendPacket(2, "action|trash\n|itemID|" .. itemID)
~~~

## Respons dialog umum — action|dialog_return

~~~lua
SendPacket(2, "action|dialog_return\ndialog_name|example_dialog\nbuttonClicked|ok")
~~~

## Daftar action Growtopia yang teramati

### Sesi dan world

| Action | Deskripsi |
|---|---|
| enter_game | Memulai sesi |
| quit | Keluar world |
| quit_to_exit | Keluar ke layar awal |
| join_request | Bergabung ke world |
| validate_worldname | Validasi nama world |
| refresh_item_data | Meminta penyegaran data item |
| respawn | Respawn |
| respawn_spike | Respawn terkait spike |
| houston_validation_done | Sinyal validasi tertentu pada client lama |

### Chat, player, dan sosial

| Action | Deskripsi |
|---|---|
| input | Chat/command |
| friends | Daftar teman |
| friendslocation | Asal menu friends |
| wrench | Interaksi player |
| trade_started | Memulai trade |
| trade_accept | Menerima trade |
| trade_cancel | Membatalkan trade |
| trade_lock | Mengunci trade |
| mod_trade | Menambah item ke trade |
| rem_trade | Menghapus item dari trade |

### Item dan inventaris

| Action | Deskripsi |
|---|---|
| drop | Menjatuhkan item |
| trash | Menghapus item |
| info | Informasi |
| dialog_return | Mengirim nilai dialog |

### Store, akun, dan menu

| Action | Deskripsi |
|---|---|
| store | Membuka toko |
| buyitem | Pembelian item toko |
| killstoreitem | Tindakan item toko tertentu |
| growid | Menu GrowID |
| AccountSecurity | Keamanan akun |
| setSkin | Warna kulit karakter |
| setFilter | Filter |
| setRoleIcon | Ikon role |
| setRoleSkin | Skin role |
| setGDPR | Pengaturan GDPR |
| eventmenu | Menu event |
| eventmenulocation | Asal menu event |
| helpmenulocation | Asal menu bantuan |
| UbiclubMenu | Menu klub lama |
| chaching | Action lama, detail bergantung versi |

## Pola string

~~~text
action|nama_action
key|value
key_lain|value_lain
~~~

Tiap baris dipisahkan newline. Key, casing, field, dan jenis pesan harus sesuai action tertentu. Event khusus login, pembelian, dan trade jangan dikirim tanpa konteks dan state yang sah.

Sumber:
- https://github.com/DiddoBoi/GrowtopiaServer-Latest/blob/main/GrowtopiaServer-Latest/packet-list.md
- https://github.com/debby2020/Growtopia-Account-Checker/blob/master/Form1.cs
- https://github.com/1Emin/Growtopia-Proxy/blob/main/proxy/server.cpp

# growtopia packet stuff :v

yo, ini repo buat nyimpen contoh packet Growtopia. biar kalo butuh tinggal cari filenya, gak usah ngubek sana-sini lagi wkwk.

tiap packet/event gw pisahin jadi file **.lua** sendiri, bukan 1 file panjang isi campur-campur.

- [SendPacket](Growtopia/SendPacket) — action, chat, world, item, dll
- [SendVariant](Growtopia/SendVariant) — console, talk bubble, notif, audio, partikel, popup, dan event lainnya
- [SendPacketRaw](Growtopia/SendPacketRaw) — raw type, nomor packet, contoh struktur
- [Dialog](Growtopia/Dialog) — isi popup, tombol, gambar, input, checkbox, dll
- [Data](Growtopia/Data) — item ID yang udah ada dari dulu

note dikit: ada packet lama yang param-nya belum jelas. itu sengaja cuma dicatat namanya, daripada asal kirim terus error :v

referensi: [packet/action list](https://github.com/DiddoBoi/GrowtopiaServer-Latest/blob/main/GrowtopiaServer-Latest/packet-list.md), [event names](https://gist.github.com/ReimarPB/b893979201a93450a4d3719a62f8351e)

udah, tinggal buka folder yang mau dicek.

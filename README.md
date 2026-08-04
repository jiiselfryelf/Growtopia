# Growtopia

repo ini buat nyimpen data sama fitur Growtopia yang bakal dipake di bot Discord

## item id

data item id diambil dari repo:

- https://github.com/zephilion/growtopia-item-id
- credit dataset: `zephilion`
- snapshot sumber: commit `960738a1ce32f7f951baaa697d82a095980efe2c`

file mentahnya ada di:

```text
data/growtopia-item-id.txt
```

nanti fitur cek item bisa nyari pake id atau nama item lewat helper:

```text
src/growtopia-item-id.js
```

contoh yang bakal dipake di command Discord:

```js
findItemById(242)
searchItemsByName("world lock")
```

catatan: dataset sumber ini lama, jadi kalau ada item baru nanti datanya perlu diupdate lagi

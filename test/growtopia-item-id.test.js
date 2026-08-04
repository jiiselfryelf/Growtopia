import test from "node:test"
import assert from "node:assert/strict"

import { cekItem } from "../src/cek-item.js"
import {
    findItemById,
    searchItemsByName
} from "../src/growtopia-item-id.js"

test("bisa cari World Lock dari id", async () => {
    const item = await findItemById(242)

    assert.deepEqual(item, {
        id: 242,
        name: "World Lock"
    })
})

test("bisa cari item dari nama", async () => {
    const items = await searchItemsByName("world lock")

    assert.equal(items[0]?.id, 242)
})

test("cekItem bisa nerima id", async () => {
    const result = await cekItem("242")

    assert.equal(result.ok, true)
    assert.equal(result.item?.name, "World Lock")
})

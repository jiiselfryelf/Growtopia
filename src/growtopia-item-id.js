import { readFile } from "node:fs/promises"
import path from "node:path"
import { fileURLToPath } from "node:url"

const currentFile = fileURLToPath(import.meta.url)
const currentDir = path.dirname(currentFile)
const itemFile = path.resolve(
    currentDir,
    "../data/growtopia-item-id.txt"
)

let itemCache

function parseItemLine(line) {
    const match = String(line).match(/^(\d+):\s*(.+?)\s*$/)
    if (!match) return null

    return {
        id: Number(match[1]),
        name: match[2]
    }
}

async function loadGrowtopiaItems() {
    if (itemCache) return itemCache

    const raw = await readFile(itemFile, "utf-8")

    itemCache = raw
        .split(/\r?\n/)
        .map(parseItemLine)
        .filter(Boolean)

    return itemCache
}

async function findItemById(id) {
    const target = Number(id)
    if (!Number.isInteger(target) || target < 0) return null

    const items = await loadGrowtopiaItems()
    return items.find(item => item.id === target) ?? null
}

async function searchItemsByName(query, limit = 10) {
    const keyword = String(query ?? "").trim().toLowerCase()
    if (!keyword) return []

    const safeLimit = Math.min(
        Math.max(Number(limit) || 10, 1),
        25
    )

    const items = await loadGrowtopiaItems()

    return items
        .filter(item => item.name.toLowerCase().includes(keyword))
        .sort((a, b) => {
            const aExact = a.name.toLowerCase() === keyword
            const bExact = b.name.toLowerCase() === keyword

            if (aExact !== bExact) return aExact ? -1 : 1
            return a.id - b.id
        })
        .slice(0, safeLimit)
}

function clearItemCache() {
    itemCache = undefined
}

export {
    clearItemCache,
    findItemById,
    loadGrowtopiaItems,
    searchItemsByName
}

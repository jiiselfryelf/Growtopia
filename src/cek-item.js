import {
    findItemById,
    searchItemsByName
} from "./growtopia-item-id.js"

function formatItem(item) {
    return `ID: ${item.id}\nNama: ${item.name}`
}

async function cekItem(input) {
    const value = String(input ?? "").trim()

    if (!value) {
        return {
            ok: false,
            text: "masukin id atau nama item dulu"
        }
    }

    if (/^\d+$/.test(value)) {
        const item = await findItemById(value)

        if (!item) {
            return {
                ok: false,
                text: `item id ${value} ga ketemu`
            }
        }

        return {
            ok: true,
            item,
            text: formatItem(item)
        }
    }

    const items = await searchItemsByName(value, 10)

    if (!items.length) {
        return {
            ok: false,
            text: `item yang namanya mirip "${value}" ga ketemu`
        }
    }

    return {
        ok: true,
        items,
        text: items
            .map(item => `${item.id} - ${item.name}`)
            .join("\n")
    }
}

export { cekItem }

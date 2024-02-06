function sendToWebhook(title, fields, webhookURL, description, content)
    local function format(num, digits)
        return string.format("%0" .. digits .. "i", num)
    end

    local function parseDateTime()
        local osDate = os.date("!*t")
        local year, mon, day = osDate["year"], osDate["month"], osDate["day"]
        local hour, min, sec = osDate["hour"], osDate["min"], osDate["sec"]
        return string.format("%s-%s-%sT%s:%s:%sZ", year, format(mon, 2), format(day, 2), format(hour, 2), format(min, 2), format(sec, 2))
    end

    if (not webhookURL or webhookURL == "") then
        return
    end

    local embed = {
        color = 5294200,
        title = title,
        description = description,
        fields = fields,
        timestamp = parseDateTime(),
        author = {
            name = "Lifeinvader",
            icon_url = "https://i.imgur.com/s9IiQcx.png"
        }
    }

    local payloadJson = json.encode({
        content = content,
        embeds = {embed}
    })

    local headers = {
        ['Content-Type'] = 'application/json'
    }

    PerformHttpRequest(webhookURL, function(err, text, headers)
    end, "POST", payloadJson, headers)
end

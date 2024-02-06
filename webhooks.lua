_WEBHOOKS = {
    -- Discord Webhook to send advertisements to
    advertisements = "",
    -- Discord Webhook to log advertisements for admins. Includes all information even for private ads.
    advertisementsLog = "",
    -- Discord Webhook to send admin infos to, for example if a user triggers the bad word filter. 
    admin = ""
}

AddEventHandler("5d-lifeinvader:sendWebhook", function(type, data)
    if (type == "advertisements") then
        processAdWebhook(data.mugShot, data.name, data.phoneNumber, data.message)
    elseif (type == "advertisementsLog") then
        processLogWebhook(data.source, data.identifier, data.mugShot, data.name, data.phoneNumber, data.message)
    elseif (type == "admin") then
        processAdminWebhook(data.source, data.identifier, data.badWord, data.message)
    end
end)

function processAdWebhook(mugShot, name, phoneNumber, message)
    name = name or "~Anonymous~"
    phoneNumber = phoneNumber or "~Anonymous~"

    local webhookTitle = "Lifeinvader - New Ad!"
    local webhookDescription -- Add Embed Description if needed
    local webhookContent -- Add Message Content if needed (role ping for example <@&<roleId>)
    local webhookFields = {{
        name = "Name:",
        value = tostring(name),
        inline = true
    }, {
        name = "Number:",
        value = tostring(phoneNumber),
        inline = true
    }, {
        name = "\u{200B}", -- Zero-width space so text has its own line
        value = "\u{200B}", -- Zero-width space so text has its own line
        inline = true
    }, {
        name = "Text:",
        value = tostring(message),
        inline = true
    }}

    -- /plugins/server/webhook.lua
    sendToWebhook(webhookTitle, webhookFields, _WEBHOOKS.advertisements, webhookDescription, webhookContent, mugShot)
end

function processLogWebhook(source, identifier, mugShot, name, phoneNumber, message)
    name = name or "~Anonymous~"
    phoneNumber = phoneNumber or "~Anonymous~"

    local webhookTitle = "Lifeinvader - Admin Log"
    local webhookDescription -- Add Embed Description if needed
    local webhookContent -- Add Message Content if needed (role ping for example <@&<roleId>)
    local webhookFields = {{
        name = "Source:",
        value = tostring(source),
        inline = true
    }, {
        name = "Identifier:",
        value = tostring(identifier),
        inline = true
    }, {
        name = "Name:",
        value = tostring(name),
        inline = true
    }, {
        name = "Number:",
        value = tostring(phoneNumber),
        inline = true
    }, {
        name = "\u{200B}", -- Zero-width space so text has its own line
        value = "\u{200B}", -- Zero-width space so text has its own line
        inline = true
    }, {
        name = "\u{200B}", -- Zero-width space so text has its own line
        value = "\u{200B}", -- Zero-width space so text has its own line
        inline = true
    }, {
        name = "Text:",
        value = tostring(message),
        inline = true
    }}

    -- /plugins/server/webhook.lua
    sendToWebhook(webhookTitle, webhookFields, _WEBHOOKS.advertisements, webhookDescription, webhookContent, mugShot)
end

function processAdminWebhook(source, identifier, badWord, message)
    local webhookTitle = "Lifeinvader - Bad Word Detected"
    local webhookDescription -- Add Embed Description if needed
    local webhookContent -- Add Message Content if needed (role ping for example <@&<roleId>)
    local webhookFields = {{
        name = "Source:",
        value = tostring(source),
        inline = true
    }, {
        name = "Identifier:",
        value = tostring(identifier),
        inline = true
    }, {
        name = "Bad Word:",
        value = tostring(badWord),
        inline = true
    }, {
        name = "Message:",
        value = tostring(message),
        inline = true
    }}

    -- /plugins/server/webhook.lua
    sendToWebhook(webhookTitle, webhookFields, _WEBHOOKS.admin, webhookDescription, webhookContent)
end


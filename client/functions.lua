-- lxCore framework
lxCore = {}

-- Export the lxCore object for external use
exports('SharedObject', function()
	return lxCore
end)

-- Function to display a notification based on config options
function lxCore.showNotification(message)
    if Config.chatnotify then
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, message)
    end
    if Config.oxnotify then
        lxCore.Notifyox(message)
    else
        print("Choose a notify in the core config")
    end
end

-- Function to display a notification using Notify ox_lib
function lxCore.Notifyox(text, notifyType, duration, subTitle, notifyPosition, notifyStyle, notifyIcon, notifyIconColor)
    local title, description
    if type(text) == "table" then
        title = text.text or 'Placeholder'
        description = text.caption or nil
    else
        title = text
        description = subTitle
    end
    local position = notifyPosition or Config.NotifyPosition

    lib.notify({
        id = title,
        title = title,
        description = description,
        duration = duration,
        type = notifyType,
        position = position,
        style = notifyStyle,
        icon = notifyIcon,
        iconColor = notifyIconColor
    })
end

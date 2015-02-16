run = require("run-applescript")

serializeArray = (arr) ->
	# ["a", "b"] -> {"a", "b"}
	return "{}" if not arr.length
	return "{\"#{arr.join("\", \"")}\"}"

chromeScript = (urls, js) ->
	"""
set hostLists to #{serializeArray(urls)}
tell application "Google Chrome"
    set windowsList to windows as list
    repeat with currWindow in windowsList
        set tabsList to currWindow's tabs as list
        repeat with currTab in tabsList
            repeat with currentHost in hostLists
                if currentHost is in currTab's URL then execute currTab javascript "#{js}"
            end repeat
        end repeat
    end repeat
end tell
"""

safariScript = (urls, js) ->
	"""
set hostLists to #{serializeArray(urls)}
tell application "Safari"
    if (count of windows) is greater than 0 then
        set windowsList to windows as list
        repeat with currWindow in windowsList
            set tabsList to currWindow's tabs as list
            repeat with currTab in tabsList
                repeat with currentHost in hostLists
                    if currentHost is in currTab's URL then
                        tell currTab to do JavaScript "#{js}"
                    end if
                end repeat 
            end repeat
        end repeat
    end if
end tell
"""

reloadScript = "location.reload();"

reloadChrome = (urls, js=reloadScript) ->
	run chromeScript(urls, js), (err, result) ->
		# throw err if err

reloadSafari = (urls, js=reloadScript) ->
	run safariScript(urls, js), (err, result) ->
		# throw err if err

exports.reload = (urls) ->
	urls = [urls] unless Array.isArray(urls)
	reloadChrome(urls)
	reloadSafari(urls)


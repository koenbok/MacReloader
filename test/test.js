path = require("path");
reloader = require("../reloader.js");

indexPath = "file://" + path.join(__dirname, "index.html")

console.log("Reloading", indexPath)

reloader.reload(indexPath)

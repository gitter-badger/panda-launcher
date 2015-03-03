cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "file": "plugins/nl.x-services.plugins.insomnia/www/Insomnia.js",
        "id": "nl.x-services.plugins.insomnia.Insomnia",
        "clobbers": [
            "window.plugins.insomnia"
        ]
    },
    {
        "file": "plugins/org.apache.cordova.device/www/device.js",
        "id": "org.apache.cordova.device.device",
        "clobbers": [
            "device"
        ]
    },
    {
        "file": "plugins/uk.co.whiteoctober.cordova.appversion/www/AppVersionPlugin.js",
        "id": "uk.co.whiteoctober.cordova.appversion.AppVersionPlugin",
        "clobbers": [
            "cordova.getAppVersion"
        ]
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "nl.x-services.plugins.insomnia": "4.0.1",
    "org.apache.cordova.device": "0.3.0",
    "uk.co.whiteoctober.cordova.appversion": "0.1.5"
}
// BOTTOM OF METADATA
});
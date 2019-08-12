var exec = require('cordova/exec');

exports.initialize = function (scb, ecb, orgId, appId, dc) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'initialize', [orgId, appId, dc]); //No I18N
};

exports.startDeskHomeScreen = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'startDeskHomeScreen', ['']); //No I18N
};

exports.startNewTicket = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'startNewTicket', ['']); //No I18N
};

exports.startHelpCenter = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'startHelpCenter', ['']); //No I18N
};

exports.startCommunity = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'startCommunity', ['']); //No I18N
};

exports.startTickets = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'startTickets', ['']); //No I18N
};

exports.startLiveChat = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'startLiveChat', ['']); //No I18N
};

exports.setUserToken = function (scb, ecb, userToken) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'setUserToken', [userToken]); //No I18N
};

exports.removeUser = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortalSDK', 'removeUser', ['']); //No I18N
};

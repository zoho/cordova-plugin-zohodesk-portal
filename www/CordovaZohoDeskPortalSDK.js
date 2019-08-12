var exec = require('cordova/exec');

exports.initialize = function (scb, ecb, orgId, appId, dc) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'initialize', [orgId, appId, dc]); //No I18N
};

exports.startDeskHomeScreen = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'startDeskHomeScreen', ['']); //No I18N
};

exports.startNewTicket = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'startNewTicket', ['']); //No I18N
};

exports.startHelpCenter = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'startHelpCenter', ['']); //No I18N
};

exports.startCommunity = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'startCommunity', ['']); //No I18N
};

exports.startTickets = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'startTickets', ['']); //No I18N
};

exports.startLiveChat = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'startLiveChat', ['']); //No I18N
};

exports.setUserToken = function (scb, ecb, userToken) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'setUserToken', [userToken]); //No I18N
};

exports.removeUser = function (scb, ecb) {
    exec(scb, ecb, 'CordovaZohoDeskPortal', 'removeUser', ['']); //No I18N
};

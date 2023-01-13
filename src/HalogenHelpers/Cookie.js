"use strict";

function setCookieImpl(name, value) {
    return function() {
        Cookies.set(name, value);
    };
}

function getCookieImpl(name) {
    return function() {
        var result = Cookies.getJSON(name);
        if (result)  {
            return result;
        } else {
            return null;
        };
    };
}

function removeCookieImpl(name) {
    return function() {
        Cookies.remove(name);
    }
}

export { setCookieImpl, getCookieImpl, removeCookieImpl };

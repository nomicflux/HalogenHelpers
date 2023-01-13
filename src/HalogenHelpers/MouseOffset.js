function getScrollTop() {
    return (window.pageYOffset || document.documentElement.scrollTop);
}

function getScrollLeft() {
    return (window.pageXOffset || document.documentElement.scrollLeft);
}

function getOffset( el ) {
    return function() {
        var x = 0;
        var y = 0;
        x = el.offsetLeft - (window.pageXOffset || document.documentElement.scrollLeft);
        y = el.offsetTop - (window.pageYOffset || document.documentElement.scrollTop);
        return { top: y, left: x };
    };
}

export { getScrollTop, getScrollLeft, getOffset };

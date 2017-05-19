/**
 * Created by toannguyen on 19/05/2017.
 */
(function (e) {
    if (typeof define === "function" && define.amd) {
        define(["jquery"], e)
    } else {
        e(window.jQuery || window.Zepto)
    }
})(function (e) {
    "use strict";
    var t = function (t, n, r) {
        var i = this, s;
        t = e(t);
        n = typeof n === "function" ? n(t.val(), undefined, t, r) : n;
        i.init = function () {
            r = r || {};
            i.byPassKeys = [9, 16, 17, 18, 36, 37, 38, 39, 40, 91];
            i.translation = {
                0: {pattern: /\d/},
                9: {pattern: /\d/, optional: true},
                "#": {pattern: /\d/, recursive: true},
                A: {pattern: /[a-zA-Z0-9]/},
                S: {pattern: /[a-zA-Z]/}
            };
            i.translation = e.extend({}, i.translation, r.translation);
            i = e.extend(true, {}, i, r);
            t.each(function () {
                if (r.maxlength !== false) {
                    t.attr("maxlength", n.length)
                }
                if (r.placeholder) {
                    t.attr("placeholder", r.placeholder)
                }
                t.attr("autocomplete", "off");
                o.destroyEvents();
                o.events();
                var e = o.getCaret();
                o.val(o.getMasked());
                o.setCaret(e + o.getMaskCharactersBeforeCount(e, true))
            })
        };
        var o = {
            getCaret: function () {
                var e, n = 0, r = t.get(0), i = document.selection, s = r.selectionStart;
                if (i && !~navigator.appVersion.indexOf("MSIE 10")) {
                    e = i.createRange();
                    e.moveStart("character", t.is("input") ? -t.val().length : -t.text().length);
                    n = e.text.length
                } else if (s || s === "0") {
                    n = s
                }
                return n
            }, setCaret: function (e) {
                if (t.is(":focus")) {
                    var n, r = t.get(0);
                    if (r.setSelectionRange) {
                        r.setSelectionRange(e, e)
                    } else if (r.createTextRange) {
                        n = r.createTextRange();
                        n.collapse(true);
                        n.moveEnd("character", e);
                        n.moveStart("character", e);
                        n.select()
                    }
                }
            }, events: function () {
                t.on("keydown.mask", function () {
                    s = o.val()
                });
                t.on("keyup.mask", o.behaviour);
                t.on("paste.mask drop.mask", function () {
                    setTimeout(function () {
                        t.keydown().keyup()
                    }, 100)
                });
                t.on("change.mask", function () {
                    t.data("changeCalled", true)
                });
                t.on("blur.mask", function (t) {
                    var n = e(t.target);
                    if (n.prop("defaultValue") !== n.val()) {
                        n.prop("defaultValue", n.val());
                        if (!n.data("changeCalled")) {
                            n.trigger("change")
                        }
                    }
                    n.data("changeCalled", false)
                });
                t.on("focusout.mask", function () {
                    if (r.clearIfNotMatch && o.val().length < n.length) {
                        o.val("")
                    }
                })
            }, destroyEvents: function () {
                t.off("keydown.mask keyup.mask paste.mask drop.mask change.mask blur.mask focusout.mask").removeData("changeCalled")
            }, val: function (e) {
                var n = t.is("input");
                return arguments.length > 0 ? n ? t.val(e) : t.text(e) : n ? t.val() : t.text()
            }, getMaskCharactersBeforeCount: function (e, t) {
                for (var r = 0, s = 0, o = n.length; s < o && s < e; s++) {
                    if (!i.translation[n.charAt(s)]) {
                        e = t ? e + 1 : e;
                        r++
                    }
                }
                return r
            }, determineCaretPos: function (e, t, r, s) {
                var u = i.translation[n.charAt(Math.min(e - 1, n.length - 1))];
                return !u ? o.determineCaretPos(e + 1, t, r, s) : Math.min(e + r - t - s, r)
            }, behaviour: function (t) {
                t = t || window.event;
                var n = t.keyCode || t.which;
                if (e.inArray(n, i.byPassKeys) === -1) {
                    var r = o.getCaret(), s = o.val(), u = s.length, a = r < u, f = o.getMasked(), l = f.length,
                        c = o.getMaskCharactersBeforeCount(l - 1) - o.getMaskCharactersBeforeCount(u - 1);
                    if (f !== s) {
                        o.val(f)
                    }
                    if (a && !(n === 65 && t.ctrlKey)) {
                        if (!(n === 8 || n === 46)) {
                            r = o.determineCaretPos(r, u, l, c)
                        }
                        o.setCaret(r)
                    }
                    return o.callbacks(t)
                }
            }, getMasked: function (e) {
                var t = [], s = o.val(), u = 0, a = n.length, f = 0, l = s.length, c = 1, h = "push", d = -1, v, m;
                if (r.reverse) {
                    h = "unshift";
                    c = -1;
                    v = 0;
                    u = a - 1;
                    f = l - 1;
                    m = function () {
                        return u > -1 && f > -1
                    }
                } else {
                    v = a - 1;
                    m = function () {
                        return u < a && f < l
                    }
                }
                while (m()) {
                    var g = n.charAt(u), y = s.charAt(f), b = i.translation[g];
                    if (b) {
                        if (y.match(b.pattern)) {
                            t[h](y);
                            if (b.recursive) {
                                if (d === -1) {
                                    d = u
                                } else if (u === v) {
                                    u = d - c
                                }
                                if (v === d) {
                                    u -= c
                                }
                            }
                            u += c
                        } else if (b.optional) {
                            u += c;
                            f -= c
                        } else if (b.defaults) {
                            t[h](b.defaults);
                            u += c;
                            f -= c
                        }
                        f += c
                    } else {
                        if (!e) {
                            t[h](g)
                        }
                        if (y === g) {
                            f += c
                        }
                        u += c
                    }
                }
                var w = n.charAt(v);
                if (a === l + 1 && !i.translation[w]) {
                    t.push(w)
                }
                return t.join("")
            }, callbacks: function (e) {
                var i = o.val(), u = o.val() !== s;
                if (u === true) {
                    if (typeof r.onChange === "function") {
                        r.onChange(i, e, t, r)
                    }
                }
                if (u === true && typeof r.onKeyPress === "function") {
                    r.onKeyPress(i, e, t, r)
                }
                if (typeof r.onComplete === "function" && i.length === n.length) {
                    r.onComplete(i, e, t, r)
                }
            }
        };
        i.remove = function () {
            var e = o.getCaret(), t = o.getMaskCharactersBeforeCount(e);
            o.destroyEvents();
            o.val(i.getCleanVal()).removeAttr("maxlength");
            o.setCaret(e - t)
        };
        i.getCleanVal = function () {
            return o.getMasked(true)
        };
        i.init()
    };
    e.fn.mask = function (n, r) {
        this.unmask();
        return this.each(function () {
            e(this).data("mask", new t(this, n, r))
        })
    };
    e.fn.unmask = function () {
        return this.each(function () {
            try {
                e(this).data("mask").remove()
            } catch (t) {
            }
        })
    };
    e.fn.cleanVal = function () {
        return e(this).data("mask").getCleanVal()
    };
    e("*[data-mask]").each(function () {
        var t = e(this), n = {}, r = "data-mask-";
        if (t.attr(r + "reverse") === "true") {
            n.reverse = true
        }
        if (t.attr(r + "maxlength") === "false") {
            n.maxlength = false
        }
        if (t.attr(r + "clearifnotmatch") === "true") {
            n.clearIfNotMatch = true
        }
        t.mask(t.attr("data-mask"), n)
    })
})

// $('#priceAuction').mask("#.##0", { reverse: true, maxlength: false });

function validPrice() {
    var priceAuction = parseInt($('#priceAuction').val());
    var maxPrice = parseInt($('#maxPrice').val());
    if(priceAuction < maxPrice) {
        alert("Bạn phải nhập giá lớn hơn giá cao nhất tại thời điểm này của phiên đấu giá !!");
        return false;
    } else {
        document.auction.submit();
    }
};

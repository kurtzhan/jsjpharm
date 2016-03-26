function initCategorysBox(){
  var d = $("#categorysBox"),
      a = d.find(".cusp").size() > 0,
      c = $("#topTab .categorysIframe"),
      e = d.find(".categorys"),
      b = d.find("h2 span");
  if (d[0] && a) {
      d.mouseenter(function() {
          e.show();
          c.show().height(e.outerHeight());
          b.addClass("cuspHover")
      }).mouseleave(function() {
          e.hide();
          c.hide();
          b.removeClass("cuspHover")
      })
  }
  init_nav();
}
function init_nav(){
        var b = $("#sub_categorys"),
            e, a = $("#js_categorys"),
            d = $("#topTab"),
            c = !!$("#js_categorys", d).length;
        $("li", a).mouseenter(function() {
            var f = $(this);
            clearTimeout(e);
            e = setTimeout(function() {
                animate_cate(f, b, c)
            }, 80)
        }).mouseleave(function() {
            var f = $(this);
            clearTimeout(e);
            e = setTimeout(function() {
                b.stop(true).hide();
                $("#js_categorys li.hover").removeClass("hover")
            }, 80)
        });
        b.mouseenter(function() {
            clearTimeout(e)
        }).mouseleave(function() {
            clearTimeout(e);
            e = setTimeout(function() {
                b.stop(true).hide();
                $("#js_categorys li.hover").removeClass("hover")
            }, 80)
        });
        $("#categorysBox").mouseleave(function() {
            if ($("#sub_categorys", this).length) {
                clearTimeout(e);
                setTimeout(function() {
                    b.stop(true).hide();
                    $("#js_categorys li.hover").removeClass("hover")
                }, 80)
            }
        });
        if (c) {
            a = $("#categorysBox");
            b.css({
                left: a.width() - 3
            });
            $(window).resize(function() {
                clearTimeout(e);
                e = setTimeout(function() {
                    b.css({
                        left: a.width() - 3
                    })
                }, 50)
            })
        } else {
            if (a.length) {
                b.css({
                    left: (a.offset().left + a.outerWidth() - 3) + "px"
                });
                $(window).resize(function() {
                    clearTimeout(e);
                    e = setTimeout(function() {
                        b.css({
                            left: (a.offset().left + a.outerWidth() - 3) + "px"
                        })
                    }, 50)
                })
            }
        }
        if ($.isIE6) {
            b.append('<iframe width="0" height="0"></iframe>')
        }
    }
function animate_cate(d, e, i) {
        var h = d.offset().top,
            j, f = $(window),
            b = f.scrollTop(),
            a = $("#topTab"),
            c = f.height(),
            g = $("li", d.parent()).eq(0).offset().top;
        e.stop(true);
        $("li", e).hide();
        $("#" + d.attr("name"), e).eq(0).show();
        $.isIE6 && $("iframe", e).css({
            width: 0,
            height: 0
        });
        j = e.outerHeight();
        if (h + j > b + c) {
            h = h - (h + j - (b + c))
        }
        $.isIE6 && $("iframe", e).css({
            width: e.width(),
            height: e.height()
        });
        if (i) {
            g = a.outerHeight();
            h -= a.offset().top
        }
        h = Math.max(g, h);
        e.animate({
            top: h + "px"
        }, e.is(":hidden") ? 0 : 150, function() {
            e.show();
            $("#js_categorys li.hover").removeClass("hover");
            d.addClass("hover")
        })
    }
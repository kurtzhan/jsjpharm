(function(b,d,f,e){var a=false,c=function(h,l,i,g){var k,j;l=typeof l=="function"?l:function(){};if(!g&&a){return}g?"":a=true;j=true;k=setTimeout(function(){j=false,a=false;l({error:"timeout"})},5000);d.ajax({url:h,data:i||{},dataType:"json",type:"post",success:function(m){clearTimeout(k);a=false;j&&l(m)},error:function(){clearTimeout(k);a=false;j&&l({error:"error"})}})};d.extend(f,{innerSource:"CLASSIFY",config:{},quickInit:function(){this.lazyLoadImg();this.loadCdnJS(["/js/comment_tips.js","/js/gift_tips.js","/js/product/pro_list.js"]);if(d.getHashPara("from")=="articlelb"&&!d.bjCookies("guide_products")){f.loadCdnJS("/js/popularize/guide/products.js")}this.init_catnav();this.narowwShow()},myInit:function(){d("div.filterMenu input").click(this.onCheckboxClick);f.updateCartInfo();f.getBHistoryList();var g=function(h){d("img[lazyload]",h).each(function(){this.src=this.getAttribute("lazyload");this.removeAttribute("lazyload")})};d(".subTypeUl").bindTab(g,"mouseenter");this.fixFilter();this.fixHeight();this.init_recommond()},onCheckboxClick:function(){b.location.href=d(this).attr("v0")},onCartIconClick:function(h,g,i){f.addGoodsInfoToCookie(h,this.updateCartInfo,1,i,g)},fixFilter:function(){var g=d(".filterT"),h=d(".productsView"),k=d(".filter"),i=g.length?g.offset().top:0,j;h.length&&g.length&&d(b).scroll(function(){j=d(this).scrollTop();if(j>(d(".attrWrap").offset().top+d(".attrWrap").height())+parseInt(d(".attrWrap").css("margin-bottom"))){g.addClass("filterFix");if((h.offset().top+h.height())>j){if(d.isIE6){g.css({position:"absolute",top:j-k.offset().top-5})}else{g.css({position:"fixed",top:0})}}else{g.css({position:"absolute",top:h.offset().top+h.height()-g.height()-k.offset().top})}}else{g.removeClass("filterFix");g.css("position","static")}})},fixHeight:function(){if(d.isIE6){d(".subWinnerView .productTit").each(function(){if(d(this).height()>44){d(this).css({height:44,overflow:"hidden"})}else{d(this).css("height","auto")}})}},showRecommondGoods:function(h,g){c("/goodsRecommendAjax.html",function(i){if(i.retcode==200&&(i.list||[]).length){f.randerRecommondHtml(i.list,h==""?"惊爆特价":"根据浏览为您推荐")}},{goods_ids:h,isAlwaysRecom:g})},randerRecommondHtml:function(i,k){var h,g=[],j=d("#recommondWrap");g.push("<h3>"+k+"</h3><div class='productsView clearfix'>");while(h=i.shift()){g.push(f.getRecommondHtml(h))}g.push("</div>");j.html(g.join(""))},getRecommondHtml:function(h){var g=d(".btmWrap #from").val(),l=['<div class="product">'],n,j,o,m,k;if(h.recommendReason){l.push('<a href="/product/'+h.goodsId+".html"+((g=="")?"":"#from="+g)+'" target="_blank" class="introDetail" style="opacity: 0;"><em></em><span>'+h.recommendReason+"</span></a>")}l.push('<a class="productImg" target="_blank" href="/product/'+h.goodsId+".html"+((g=="")?"":"#from="+g)+'"><img width="200" height="200" border="0" title="'+h.title+'" alt="'+h.title+'" src="'+h.imageUrlFor220+'">');if(h.actualStorageStatus==0){n="stockoutIcon"}if(n){l.push('<span class="'+n+'"></span>')}l.push("</a>");l.push('<p class="introduceTit">'+h.introduce+"</p>");l.push('<p class="productTit"><a href="/product/'+h.goodsId+".html"+((g=="")?"":"#from="+g)+'" title="'+h.title+'" target="_blank">'+h.title+'</a></p><p class="productPrice clearfix"><span class="price">¥'+f.getPriceStr(h.actualCurrentPrice)+'</span><a href="/comment/'+h.goodsId+'.html" target="_blank" class="a_comment">已有'+h.commentCount+"条评价</a></p>");l.push("</div>");return l.join("")},init_recommond:function(){var l=LS.get("NTES_BAOJIAN_RV"),g,h=[],k=0,i="";if(l){g=l.split("|").slice(0,10);d.each(g,function(j){h[j]=g[j].split("_")[0]});i=h.join(",")}this.showRecommondGoods(i,1)},init_catnav:function(){d(".siderBox dl.categoryView dt").click(function(h){if(d(h.target).closest("a").length==0){var i=d("span",this),g=i.closest("dt");if(i.hasClass("ctyOff")){i.removeClass("ctyOff").addClass("ctyOn");g.next("dd").eq(0).hide()}else{i.removeClass("ctyOn").addClass("ctyOff");g.next("dd").eq(0).show()}}})},narowwShow:function(){var g=b.screen.width;if(g<1200){d("body").addClass("wrapNarrow")}else{d("body").removeClass("wrapNarrow")}}})})(window,jQuery,Core);
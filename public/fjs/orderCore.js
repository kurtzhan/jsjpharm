(function(g,e,f,a,b){var h="NTES_BAOJIAN_CART",j="/cartAjax.html",l="NTES_BAOJIAN_ORDER_FLAG";e.bjCookies=function(n,o){if(o==b){return e.cookie(n,{path:"/"})}else{e.cookie(n,o,{path:"/",expires:365})}};f.readyGoToConfirm=function(){e.bjCookies(l,"1")};f.checkConfirmFlag=function(){return !!e.bjCookies(l)};f.addGoodsToCookie=function(p,o,q,n){f.isLogin(function(r){if(r){f.loginUserAddGoods(p,o,null,n)}else{d(p,o,q,n)}})};function d(A,x,z,B){var q=f.innerSource||"OTHER",p=e.bjCookies(h)||"",u=[],w=isNaN(x)?1:+x,v,r,t=0,C,o=false,y="",s=50;B=B||"0";if(!p){e.bjCookies(h,[A,w,q,B||"0"].join("_"))}else{v=p.split("|");r=v.length;for(;t<r;t++){if(/^\d+\_\d+\_[^\_]+$/.test(v[t])||/^\d+\_\d+\_[^\_]+\_\S+$/.test(v[t])){C=v[t].split("_");if(C[0]==A&&B==C[3]){o=true;C[1]=Math.min(z?w:(+C[1]+w),1000);C[3]=B||"0";+C[1]>0&&u[z?"push":"unshift"](C.join("_"))}else{u.push(v[t])}}}if(!o){u.unshift([A,w,q,B||"0"].join("_"))}u=u.slice(0,Math.min(s,u.length));e.bjCookies(h,u.join("|"))}}f.addGoodsInfoToCookie=function(p,r,o,q,n){r=r||function(){};f.isLogin(function(s){if(s){f.loginUserAddGoods(p,o,function(t,u){r();t&&f.updateCartInfo(u.cartGoodsNum||0);t&&q&&m.show_cart_dia(u)},n)}else{d(p,o,false,n);f.updateCartInfo();r();q&&f.loginUserAddGoods(p,o,function(t,u){t&&m.show_cart_dia(u)},n)}})};var c={};f.loginUserAddGoods=function(p,o,q,n){p=isNaN(p)?0:parseInt(p,10);o=isNaN(o)?0:parseInt(o,10);q=typeof q=="function"?q:function(){};if(c[p+"_"+o]){return q(false)}c[p+"_"+o]=true;f.post("/cartAjax/modify.html",{goodsId:p,number:o,innerSource:f.innerSource||"Other",skuId:n||"0"},function(r,s){!r&&(s=f.parseJSON(s));c[p+"_"+o]=false;q(!r&&s.retcode==200,s)},"addGoodsToCart")};f.loginUserRemoveGoods=function(o,p,n){f.loginUserAddGoods(o,0,p,n)};f.updateCartInfo=function(p){typeof p=="number"?o(p):f.getCartProductNum(function(q){o(q)});function o(n){var q=e("#js_miniCartBox .miniCartNum");q.length&&(q[n<=0?"addClass":"removeClass"]("num0").text(n))}};f.bindCartMouseEvt=function(){m.init()};f.removeCartItem=function(p,q,o){f.isLogin(function(r){if(r){f.loginUserRemoveGoods(p,function(t,s){t&&q(t,s.cartGoodsNum)},o)}else{n()}});function n(){var r=e.bjCookies(h)||"",s,t=[];if(p){e.each(r.split("|"),function(u,v){s=v.split("_");if(p!=s[0]||o!=(s[3]||"0")){t.push(s.join("_"))}});e.bjCookies(h,t.join("|"));q(true,t.length)}}};var k=false,i=function(o,s,p,n){var r,q;s=typeof s=="function"?s:function(){};if(!n&&k){return}n?"":k=true;q=true;e.ajax({url:o,data:p||{},dataType:"json",type:"post",success:function(t){clearTimeout(r);k=false;q&&s(t)},error:function(){clearTimeout(r);k=false;q&&s({error:"error"})}});r=setTimeout(function(){q=false,k=false;s({error:"timeout"})},5000)},m={html:{nodata:'<div class="cartNone">购物车是空的，赶快选购吧！{nologin}</div>',nologin:'<br>如果已添加商品，请<a href="javascript:;" name="js_login">登录</a>查看',product:'<div class="cartItem clearfix{_bbNone}" gid="{goodsId}" skuid={skuId}><a class="aImg" href="/product/{goodsId}.html"><img width="50" border="0" height="50" alt="{goodsName}" src="{imageUrl}"></a><div class="pInfoWrap"><a class="proName" href="/product/{goodsId}.html" title="{goodsName}">{goodsName}</a><div class="numBox"><p><strong>¥{currentPrice}</strong>×<strong>{buyAmount}</strong></p><span class="del" name="js_remove">删除</span></div></div></div>',topay:'<div class="checkBox"><p><span class="fl">共<span class="c_orange">{total}</span>件商品</span>共计：<span class="c_orange fs16">¥<span>{_monery0}</span>.{_monery1}</strong></p><p class="mt10"><a class="goCartBtn" href="/cart.html" target="_blank">去购物车结算</a></p></div>',activity:'<h4><em class="{style}">{title}</em>&#12288;<strong>{content}</strong></h4>',dia_top:'<dl class="cartInfo clearfix"><dt><span class="sign sign7 fl mr10"></span></dt><dd><p><strong class="c_4b8400">添加成功！</strong><br>购物车共有{cartGoodsNum}件商品，合计：<strong class="c_ba2636">¥{cartGoodsAmount}</strong></p><p class="mt10"><a class="ff_song" href="javascript:;" name="js_close">&lt;&lt;&ensp;再逛逛</a>&#12288;<a class="oGreenBtn" href="/cart.html">去购物车结算</a></p></dd></dl>',dia_product:'<div class="product"><a href="/product/{goodsId}.html" target="_blank" class="productImg"><img width="100" border="0" height="100" src="{imageUrlFor100}" alt="{title}" title="{title}"></a><p class="introduceTit">{introduce}</p><p class="productTit"><a target="_blank" title="{title}" href="/product/{goodsId}.html">{title}</a></p><p class="productPrice">¥{actualCurrentPrice}</p></div>'},cart:null,loaded:false,cache_time:3000,cache_timerid:null,init:function(){var n=this;if(f._orderCore_loadend){return this}f._orderCore_loadend=true;n.cart=e("#js_miniCartBox");if(n.cart.length==1){n.load_depend(function(){n.init_event()});f.updateCartInfo()}return n},load_depend:function(n){n=n||function(){};f.loadCdnCss("/css/ext/jquery.jscrollpane.codrops1.css");f.loadCdnJS(["/js/ext/jquery.mousewheel.js","/js/ext/jquery.jscrollpane.min.js","/js/ext/scroll-startstop.events.jquery.js"],n)},init_event:function(){var n=this,o=n.cart,p;o.click(function(r){var s=e(r.target).closest("[name^=js_]"),q;if(s.length&&(q=s.attr("name"))){if(typeof n[q]=="function"){n[q](s,r)}}}).mouseenter(function(){clearTimeout(p);p=setTimeout(function(){n.show_cart()},80)}).mouseleave(function(){clearTimeout(p);p=setTimeout(function(){n.hide_cart()},80)})},show_cart:function(){var p=this.cart,o=e(".miniConWrap",p),n;if(this.loaded){o.removeClass("hide")}else{this.load_cart_data(function(){o.removeClass("hide");n=e(".cartList",p);if(n.length&&n.height()>364){n.height(364);n.mousewheel(function(q){q.preventDefault()}).jScrollPane()}o.height(e("div.miniCartCon",p).height()+15)})}},load_cart_data:function(o){var n=this;i(j,function(p){if(p.retcode==200){n.rander(p.object,o);n.set_loaded()}})},rander:function(p,w){var x=this,r=[],q,s=0,o,v=e(".miniCartCon",this.cart),u,t,n;p=p||{};p.activityGoods=p.activityGoods||[];p.goods=p.goods||[];if(p&&(p.activityGoods.length||p.goods.length)){r.push('<div class="miniCartDetail">');r.push('<div class="cartList">');q=p.goods;while(u=q.shift()){u._bbNone=q.length==0?" bbNone":"";r.push(e.format(x.html.product,u));s++}t=p.activityGoods;while(n=t.shift()){s+=n.goods.length;r.push(x.get_activity_html(n))}r.push("</div>");o=(((p.orderAmount||0)-(p.orderActivityAmount)).toFixed(2)+"").split(".");r.push(e.format(x.html.topay,{total:s,_monery0:o[0],_monery1:o[1]}));r.push("</div>");v.html(r.join(""));w()}else{f.isLogin(function(y){v.html(e.format(x.html.nodata,{nologin:(y?"":x.html.nologin)}));w()})}f.updateCartInfo(s)},get_activity_html:function(q){var o=[],n=q.goods,p;o.push('<div class="activityWrap">');while(p=n.shift()){p._bbNone=n.length==0?" bbNone":"";o.push(e.format(this.html.product,p))}o.push(this.get_activity_top(q));o.push("</div>");return o.join("")},get_activity_top:function(q){var n={style:"",title:"",content:""},o,p=q.activityType;if(p==4||p==5){n.style="act2",n.title="满赠"}else{n.title="满减"}if(q.currentRule){o=q.currentRule.ruleType;n.content="已购满"+q.currentRule.threshold;n.content+=(o==5?"件，":"元，");n.content+=(p==3?'<span class="c_ba2636">已减'+q.currentRule.activityGiftList[0].money+"元</span>":"可领取赠品")}if(q.nextRule){if(n.content.length){n.content+="<br/>"}o=q.nextRule.threshold-q.currentAmount;o=p==5?o+"件，":this.p(o)+"元，";n.content+=("再购买"+o);n.content+=(p==3?"可减少"+this.p(q.nextRule.activityGiftList[0].money)+"元":"可领取赠品")}return n.content.length?e.format(this.html.activity,n):""},hide_cart:function(){e(".miniConWrap",this.cart).addClass("hide")},set_loaded:function(){var n=this;n.loaded=true;clearTimeout(n.cache_timerid);n.cache_timerid=setTimeout(function(){n.loaded=false},n.cache_time)},js_remove:function(r){var p=this,n=r.closest("div.cartItem"),q=n.attr("gid"),o=n.attr("skuid")||0;f.removeCartItem(q,function(){p.loaded=false;p.show_cart()},o)},js_login:function(){a.login()},p:function(n){return f.getPriceStr(n||0)},show_cart_dia:function(p){var n=[e.format(m.html.dia_top,p)],o;p.goodsList=p.goodsList||[];if(p.goodsList.length){n.push('<h4>购买过该商品的用户还购买了：</h4><div class="cartProWrap clearfix">');while(o=p.goodsList.shift()){o.actualCurrentPrice=(o.actualCurrentPrice||0).toFixed(2);n.push(e.format(m.html.dia_product,o))}n.push("</div>")}e.dialog();e.dialog({css:"mallCartPop",width:0,title:"",button:[],animate:0,layout:false,dragable:2,content:n.join(""),init:function(){e("a[name=js_close]",this).click(function(){e.dialog()})},beforeClose:function(){e("a",this).unbind();e(this).unbind()}})}};e(document).ready(function(){m.init();f.show_cart_dia=function(n){m.show_cart_dia(n)}})})(window,jQuery,Core,easyNav);
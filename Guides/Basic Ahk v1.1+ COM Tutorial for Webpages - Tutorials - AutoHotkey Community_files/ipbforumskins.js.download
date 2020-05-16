// Created by ipbforumskins.com

var $ = jQuery.noConflict();

jQuery(document).ready(function($){

	$('a[href=#top], a[href=#ipboard_body]').click(function(){
		$('html, body').animate({scrollTop:0}, 400);
        return false;
	});
	
	$(".forum_name").hover(function() {
		$(this).next(".forum_desc_pos").children(".forum_desc_con").stop()
		.animate({left: "0", opacity:1}, "fast")
		.css("display","block")
	}, function() {
		$(this).next(".forum_desc_pos").children(".forum_desc_con").stop()
		.animate({left: "10", opacity: 0}, "fast", function(){
			$(this).hide();
		})
	});
	
	$('#topicViewBasic').click(function(){
		$(this).addClass("active");
		$('#topicViewRegular').removeClass("active");
		$("#customize_topic").addClass("basicTopicView");
		$.cookie('ctv','basic',{ expires: 365, path: '/'});
		return false;
	});
	
	$('#topicViewRegular').click(function(){
		$(this).addClass("active");
		$('#topicViewBasic').removeClass("active");
		$("#customize_topic").removeClass("basicTopicView");
		$.cookie('ctv',null,{ expires: -1, path: '/'});
		return false;
	});
	
	if ( ($.cookie('ctv') != null))	{
		$("#customize_topic").addClass("basicTopicView");
		$("#topicViewBasic").addClass("active");
	}
	else{
		$("#topicViewRegular").addClass("active");
	}
	
	$('.category_block .forumHover tr').each(function(){
		var forumURL = $(this).find(".col_c_forum h4 strong a").attr("href");
		$(this).click(function(){
			window.location = forumURL;
		})
	});
	
	$('.category_block .maintitle.linkBar').each(function(){
		var forumURL = $(this).find("a:last-child").attr("href");
		$(this).click(function(){
			window.location = forumURL;
		})
	});
	
	var customElements = "#community_app_menu > li.active > a, #secondary_navigation, .topic_buttons li a, .ipsButton, a.ipsButton, .pagination .pages li.active, .forumHover tr:hover td, img[src*='f_icon.png'], img[src*='f_icon_read.png'], img[src*='f_redirect.png'], .maintitle, .maintitle.linkBar, ul.post_controls a, ul.post_controls a.ipsButton_secondary, .post_block h3, .horizontalView .author_info, .col_f_icon img, .ipsLikeButton.ipsLikeButton_enabled, #footer";

	var customText = "a";
	
	$("#themeEditor span").click(function(){
		var primaryColour = $(this).attr("data-primary");
		$("style#stylePrimary").replaceWith('<style id="stylePrimary" type="text/css">' + customElements + '{ background-color: #' + primaryColour + '}' + customText + '{ color: #' + primaryColour + '} .forumHover tr:hover td{ border-color: #' + primaryColour + '}</style>');
		$.cookie('ortemTheme',primaryColour,{ expires: 365, path: '/'});
	});

	if ( ($.cookie('ortemTheme') != null))	{
		$("style#stylePrimary").replaceWith('<style id="stylePrimary" type="text/css">' + customElements + '{ background-color: #' + $.cookie('ortemTheme') + '}' + customText + '{ color: #' + $.cookie('ortemTheme') + '} .forumHover tr:hover td{ border-color: #' + $.cookie('ortemTheme') + '}</style>');
	}
	else{
		$("style#stylePrimary").replaceWith('<style id="stylePrimary" type="text/css">' + customElements + '{ background-color: #55728b }' + customText + '{ color: #55728b; } .forumHover tr:hover td{ border-color: #55728b; }</style>');
	}
	
	$("#toggleThemeEditor").click(function(){
		$("#themeEditorWrap").slideToggle();
		return false;
	})

});
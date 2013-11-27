$( function() {
	// $( "pre" ).snippet( "javascript",{
	// 	style:		"vegas",
	// 	showNum:	false
	// });

	$( '.scrollable' ).jScrollPane({
		dragMaxHeight:100,
		wheelSpeed:20,
		animateScroll: true
	});

	var jScrollPaneApi = $( '.scrollable' ).data( 'jsp' );

	jScrollPaneApi.scrollToY( 0, false );
	jScrollPaneApi.scrollToY( 0, true );

	$( window ).resize( function() {
		jScrollPaneApi.reinitialise();
	});

	$( window ).load( function() {
		jScrollPaneApi.reinitialise();
	});

	$.vegas('slideshow', {
	  delay:5000,
	  backgrounds:[
	    { src:'/assets/krokos/aluminievui-profil.jpg', fade:2000 },
	    { src:'/assets/krokos/vanna-dlia-anodirovania.jpg', fade:2000 },
	    { src:'/assets/krokos/linia-anodirovania.jpg', fade:2000 },
	    { src:'/assets/krokos/anodirovanie-raznumi-cvetami.jpg', fade:2000 },
	    { src:'/assets/krokos/anodirovanie-aluminievogo-profilia.jpg', fade:2000 },
	    { src:'/assets/krokos/gotovui-aluminievui-profil.jpg', fade:2000 },
	    { src:'/assets/krokos/proces-anodirovania.jpg', fade:2000 },
	    { src:'/assets/krokos/programma-upravlenia-liniei-anodirovania.jpg', fade:2000 }
	  ]
	})('overlay', {src:'/assets/krokos/02.png'});
});
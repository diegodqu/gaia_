// $(".item img").css({"display":"none");

// On window load. This waits until images have loaded which is essential
$(window).load(function(){
	
	// Fade in images so there isn't a color "pop" document load and then on window load
	$(".gris").animate({opacity:1},100);
	
	// clone image
	$('.gris').each(function(){
		var el = $(this);
		el.css({"position":"absolute"}).wrap("<div class='img_wrapper'>").clone().addClass('img_grayscale').css({"position":"absolute","z-index":"5","opacity":"0"}).insertBefore(el).queue(function(){
			var el = $(this);
			el.parent().css({"width":this.width,"height":this.height});
			el.dequeue();
		});
		this.src = grayscale(this.src);
	});
	
	// Fade image 
	$('.gris').mouseover(function(){
		$(this).parent().find('img:first').stop().animate({opacity:1}, 250);
	});
	$('.img_grayscale').mouseout(function(){
		$(this).stop().animate({opacity:0}, 250);
	});


	// PARA GRUPO GRIS 
	$(".sub-gris").animate({opacity:1},100);
	
	// clone image
	$('.sub-gris').each(function(){
		var el = $(this);
		el.css({"position":"absolute"}).wrap("<div class='img_wrapper' style='display: inline-block'>").clone().addClass('sub_img_grayscale').css({"position":"absolute","z-index":"5","opacity":"0"}).insertBefore(el).queue(function(){
			var el = $(this);
			el.parent().css({"width":this.width,"height":this.height});
			el.dequeue();
		});
		this.src = grayscale(this.src);
	});
	$('.bloque-gris').mouseover( function(){
		$(this).find('.img_wrapper img.first').stop().animate({opacity:1}, 250);
	});
	$('.bloque-gris').mouseout( function(){
		$(this).find('.sub_img_grayscale').stop().animate({opacity:0}, 250);
	});
});

// Grayscale w canvas method
function grayscale(src){
     var canvas = document.createElement('canvas');
	var ctx = canvas.getContext('2d');
     var imgObj = new Image();
	imgObj.src = src;
	canvas.width = imgObj.width;
	canvas.height = imgObj.height; 
	ctx.drawImage(imgObj, 0, 0); 
	var imgPixels = ctx.getImageData(0, 0, canvas.width, canvas.height);
	for(var y = 0; y < imgPixels.height; y++){
		for(var x = 0; x < imgPixels.width; x++){
			var i = (y * 4) * imgPixels.width + x * 4;
			var avg = (imgPixels.data[i] + imgPixels.data[i + 1] + imgPixels.data[i + 2]) / 3;
			imgPixels.data[i] = avg; 
			imgPixels.data[i + 1] = avg; 
			imgPixels.data[i + 2] = avg;
		}
	}
	ctx.putImageData(imgPixels, 0, 0, 0, 0, imgPixels.width, imgPixels.height);
	return canvas.toDataURL();
 }
<!--   Core JS Files   -->
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<!-- <script src="/auction/resources/js/jquery.min.js" type="text/javascript"></script> -->
<script src="/auction/resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/auction/resources/js/material.min.js"></script>

<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="/auction/resources/js/nouislider.min.js" type="text/javascript"></script>

<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
<script src="/auction/resources/js/bootstrap-datepicker.js" type="text/javascript"></script>

<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
<script src="/auction/resources/js/material-kit.js" type="text/javascript"></script>

<script type="text/javascript">
	$().ready(function() {
		// the body of this function is in assets/material-kit.js
		materialKit.initSliders();
		window_width = $(window).width();

		if (window_width >= 992) {
			big_image = $('.wrapper > .header');

			$(window).on('scroll', materialKitDemo.checkScrollForParallax);
		}

	});
</script>
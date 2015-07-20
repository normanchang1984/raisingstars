(function() {
  $(window).load(function() {

    /*
    * --------------------------------------------------------------------------------------------------------------------
    * isotope portfolio filtration
    * --------------------------------------------------------------------------------------------------------------------
     */
    var $portfolio;
    if (jQuery().isotope) {
      $portfolio = $("#portfolio-container");
      $portfolio.isotope({
        layoutMode: 'sloppyMasonry',
        itemSelector: ".portfolio-item"
      });
      return $("#portfolio-filter a").click(function() {
        var selector;
        $(this).closest("ul").find("li").removeClass("active");
        $(this).parent().addClass("active");
        selector = $(this).attr("data-filter");
        $portfolio.isotope({
          filter: selector
        });
        return false;
      });
    }
  });

}).call(this);

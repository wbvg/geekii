$(document).ready(function () {

if (window.location.href.match(/page/)) {
  window.location.hash = '#myTab';
}

$('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');

      });

//tooltip hover

  $('#myTooltip').on('hidden.bs.tooltip', function () {
      $('#element').tooltip('show')
      })

});
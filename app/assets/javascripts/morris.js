$(document).ready(function () {
  var show_chart = function () {
    var activity = $('#activities').val();

    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/exercises/chart/' + activity
    }).done(process_activity);
  };

  var process_activity = function (exercises) {
    $('#chart').empty();
    new Morris.Line({
      element: 'chart',
      data: exercises,
      xkey: 'completed',
      ykeys: ['value'],
      labels: ['Value']
    });
  };

(show_chart);
  // $('#show_chart').click(show_chart).trigger('click');
});


/*
 * Play with this code and it'll update in the panel opposite.
 *
 * Why not try some of the options above?
 */
Morris.Donut({
  element: 'donut-example',
  data: [
    {label: "Download Sales", value: 12},
    {label: "In-Store Sales", value: 30},
    {label: "Mail-Order Sales", value: 20}
  ]
});

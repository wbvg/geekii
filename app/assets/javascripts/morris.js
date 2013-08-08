$(document).ready(function () {
  var show_chart = function () {
    var activity = $('#activities').val();

    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/profiles/chart/' + label
    }).done(process_skill);
  };

  var process_skill = function (profiles) {
    $('#donut-chart').empty();
    new Morris.Donut({
      element: 'donut-chart',
      data: profiles,
      xkey: 'label',
      ykeys: ['label'],
      labels: ['Value']
    });
  };

  $('#show_chart').click(show_chart).trigger('click');
});

// Morris.Donut({
//   element: 'donut-example',
//   data: [
//     {label: "Download Sales", value: 12},
//     {label: "In-Store Sales", value: 30},
//     {label: "Mail-Order Sales", value: 20}
//   ]
// });

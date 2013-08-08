$(document).ready(function () {
  var show_chart = function () {
    var chapter = $('#chapters').val();

    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/profiles/chart/' + chapter
    }).done(process_skill);
  };

  var process_skill = function (profiles) {
    $('#chart').empty();
    new Morris.Donut({
      element: 'chart',
      data: profiles,
      xkey: 'chapter',
      ykeys: ['label'],
      labels: ['Value']
    });
  };

  $('#show_chart').click(show_chart).trigger('click');
});


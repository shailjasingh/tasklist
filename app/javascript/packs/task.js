$(document).ready(function() {
  $(".custom-input").on('click', function(){
    var task = $(this)
    var taskId = $(this).attr('task_id')
    $.ajax({
      url: '/api/v1/tasks/' + taskId + '/complete',
      dataType: 'JSON',
      method: 'POST',
      success: function(data) {
        if (data.error) {
          alert(data.error)
        } else {
        var date = new Date(data.completed_at * 1000)
        var zoneTime = formatTime(date)
        task.addClass('d-none')
        timeBadge = task.siblings('.badge')
        timeBadge.removeClass('d-none')
        timeBadge.html(zoneTime)
        }
      },
      error: function(err) {
        if (err){
          alert(err)
        }
      }
    });
  })

  function set_time_zone_offset() {
    $.each($(".media-body .badge") , function( index, ele ){
      var utcSeconds = ele.innerText
      var date = new Date(parseInt(utcSeconds) * 1000)
      var zoneTime = formatTime(date)
      ele.innerText = zoneTime
    })
  }
  set_time_zone_offset();

  function formatTime(date){
    var time = getMeridiemTime(date)
    var currentDate = new Date();
    var sameDate = currentDate.getDate() === date.getDate();
    var previousDateTime = `${date.getMonth() + 1}/${date.getDate()}/${date.getFullYear()} ${time}`;
    var dateTime = sameDate ? time : previousDateTime;
    return dateTime;
  }

  function getMeridiemTime(date){
    var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
    var meridiem = date.getHours() >= 12 ? "PM" : "AM";
    hours = hours < 10 ? "0" + hours : hours;
    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
    return hours + ":" + minutes + " " + meridiem;
  }
})
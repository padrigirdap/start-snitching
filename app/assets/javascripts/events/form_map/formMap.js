// $(document).ready(function(){
//   $('form').on('submit', function(event) {
//     event.preventDefault();
//     var title = $('#pollution_event_title').val();
//     var address = $('#pollution_event_title').val();
//     var event_lat = $('#pollution_event_title').val();
//     var event_lng = $('#pollution_event_title').val();
//     var description = $('#pollution_event_title').val();
//     var url = $('#pollution_event_title').val();
//
//     if(url && title && address && event_lat && event_long && url && description) {
//       submitEventAjax(item);
//     } else {
//       alert("Please fill out every field.");
//     }
//   });
// });
//
// var submitEventAjax = function(item) {
//   var request = $.ajax({
//     method: "POST",
//     url: "/pollution_events",
//     data: {
//         name: item
//         title:
//       }
//   });
//   request.done(function(data){
//     $('ul').append("<li>" + item + "</li>");
//     $('#grocery_name').val("");
//   });
// };

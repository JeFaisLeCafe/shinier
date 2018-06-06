// $(function() {
//   let Notifications;
//   return (Notifications = class Notifications {
//     constructor() {
//       this.handleSuccess = this.handleSuccess.bind(this);
//       this.getNewNotifications();
//       this.notifications = $("[data-behavior='notifications']");

//       if (this.notifications.length > 0) {
//         this.handleSuccess(this.notifications.data('notifications'));
//       }
//     }

//     getNewNotifications() {
//       return $.ajax({
//         url: '/notifications.json',
//         dataType: 'JSON',
//         method: 'GET',
//         success: this.handleSuccess
//       });
//     }

//     handleSuccess(data) {
//       const items = $.map(data, notification => notifications.template);

//       $("[data-behavior='unread-count']").text(items.length);
//       return $("[data-behavior='notification-items']").append(items);
//     }
//   });
// });

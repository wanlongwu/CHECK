// const hello = () => {
  // console.log("hello")
// };


document.addEventListener('DOMContentLoaded', function () {
  if (!Notification) {
    alert('Your browser does not support Posture Buddy function. :(');
    return;
  }

});

const setTimer = () => {

  const time = document.getElementById("pb-time-select").value
  return (time * 60000)
}

  function notifyMe() {
    if (Notification.permission !== "granted")
      Notification.requestPermission();
    else {
      const newNotification = () => {
        var notification = new Notification('CheckIT', {
        icon: 'http://res.cloudinary.com/db9cynf8x/image/upload/v1520649172/logo.png',
        body: 'Please sit up straight, you can do it!',
        });
        setTimeout(notification.close.bind(notification),30000)
      };
      newNotification();
      setInterval(newNotification, setTimer());
      // notification.onclick = function () {
      //   window.open("http://stackoverflow.com/a/13328397/1269037");
      // };
    };
  };


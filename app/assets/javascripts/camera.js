// this is the code for camera and


navigator.getUserMedia = ( navigator.getUserMedia ||
                   navigator.webkitGetUserMedia ||
                   navigator.mozGetUserMedia ||
                   navigator.msGetUserMedia);
var video;
var webcamStream;

function startWebcam() {
  if (navigator.getUserMedia) {
    navigator.getUserMedia (
        // constraints
    {
       video: true,
       audio: false
    },

        // successCallback
    function(localMediaStream) {
    video = document.querySelector('video');
    video.src = window.URL.createObjectURL(localMediaStream);
    webcamStream = localMediaStream;
    },

        // errorCallback
    function(err) {
       console.log("The following error occured: " + err);
    }
     );
  } else {
     console.log("getUserMedia not supported");
  };
};

      //---------------------
      // TAKE A SNAPSHOT CODE
      //---------------------
    var canvas, ctx;

    function init() {
      // Get the canvas and obtain a context for
      // drawing in it
      canvas = document.getElementById("myCanvas");
      ctx = canvas.getContext('2d');
      // photo = document.getElementById('photo');
    };

    function hideVideo(){
      console.log("hello from hideVideo")
      setTimeout(function(){
        const v = document.getElementById('video');
        const b = document.getElementById('button1');
        v.parentNode.removeChild(v);
        b.parentNode.removeChild(b);
      },5000);
    };

    function countdown(){
        let time = 5;
        const intervalMethod = setInterval(function(){
        const countdownSpace = document.getElementById('countdown');
        countdownSpace.innerHTML = time;
        time--;
        if(time < 0){
          clearInterval(intervalMethod);
          countdownSpace.innerHTML = "";
        }
        },1000);
      };

    function snapshot() {
      setTimeout(function(){
       // Draws current image from the video element into the canvas
      ctx.drawImage(video, 0,0, canvas.width, canvas.height);
      },5000);

      // above is delay for 5 seconds;
    };



//       $("#canvas").click(function(e){
//      getPosition(e);
// });

// below is the code for forming points, lines and angels:



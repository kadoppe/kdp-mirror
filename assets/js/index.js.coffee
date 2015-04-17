navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia
window.URL = window.URL || window.webkitURL

video = document.getElementById('mirror')

navigator.getUserMedia video: true, audio: false, (stream) ->
  video.src = window.URL.createObjectURL(stream)

, (err) ->
  console.log(err)

function toggle() {
  var pre = document.getElementById("request");
  switch(pre.className) {
    case "hidden":
      pre.className = "visible";
      document.getElementById("button").innerHTML = "Less information about this request";
      break;
    default:
      pre.className = "hidden";
      document.getElementById("button").innerHTML = "More information about this request";
  }
}

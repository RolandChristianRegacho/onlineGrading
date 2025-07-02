function setCookie(cvalue) {
    const d = new Date();
    d.setTime(d.getTime() + (60 * 60 * 1000));
    let expires = "expires="+d.toUTCString();
    document.cookie = "username" + "=" + cvalue + ";" + expires + ";path=/";
  }
  
  function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
      let c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
  }
  
  function checkCookie() {
    let user = getCookie("username");
    if (user == "") {
        Swal.fire({
            icon: "warning",
            title: "Session Expired!",
            text: "Logging out...",
            timer: 2000,
            timerProgressBar: true,
        })
        Swal.showLoading()
        setTimeout(() => {
            window.location.href = "../api/logout.php";
        }, 2000)
    }
  }
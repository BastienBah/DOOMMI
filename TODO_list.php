<?php session_start();

if (isset($_SESSION['pseudo'])) {
  echo "bonjour" . $_SESSION['pseudo'];
}

 ?>

 <a href="deconnexion.php">Je me déconnecte</a>
<!DOCTYPE html>
<html>


  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="assets/style/style.css">
    <title>Ma TODO liste</title>
  </head>
  <body>
    <div id="myDIV" class="header">
        <h1>DOOMMI</h1>
    </div>

<div class="list">



    <ul id="myUL">
      <li>Hit the gym</li>
      <li>Pay bills</li>
      <li>Meet George</li>
      <li>Buy eggs</li>
      <li>Read a book</li>
      <li>Organize office</li>
    </ul>
    <div class="imput">
      <input type="text" id="myInput" placeholder="Title...">
      <span onclick="newElement()" class="addBtn">Add</span>
    </div>

    </div>

<div class="footer">
  <h2>coded with love by Batsien  & Edouard <br> designed with love by Léa, Lolita, Athénais Roxane & Laurène</h2>

</div>

  </body>







  <script type="text/javascript">
    // Create a "close" button and append it to each list item
    var myNodelist = document.getElementsByTagName("LI");
    var i;
    for (i = 0; i < myNodelist.length; i++) {
    var span = document.createElement("SPAN");
    var txt = document.createTextNode("\u00D7");
    span.className = "close";
    span.appendChild(txt);
    myNodelist[i].appendChild(span);
    }

    // Click on a close button to hide the current list item
    var close = document.getElementsByClassName("close");
    var i;
    for (i = 0; i < close.length; i++) {
    close[i].onclick = function() {
      var div = this.parentElement;
      div.style.display = "none";
    }
    }

    // Add a "checked" symbol when clicking on a list item
    var list = document.querySelector('ul');
    list.addEventListener('click', function(ev) {
    if (ev.target.tagName === 'LI') {
      ev.target.classList.toggle('checked');
    }
    }, false);

    // Create a new list item when clicking on the "Add" button
    function newElement() {
    var li = document.createElement("li");
    var inputValue = document.getElementById("myInput").value;
    var t = document.createTextNode(inputValue);
    li.appendChild(t);
    if (inputValue === '') {
      alert("You must write something!");
    } else {
      document.getElementById("myUL").appendChild(li);
    }
    document.getElementById("myInput").value = "";

    var span = document.createElement("SPAN");
    var txt = document.createTextNode("\u00D7");
    span.className = "close";
    span.appendChild(txt);
    li.appendChild(span);

    for (i = 0; i < close.length; i++) {
      close[i].onclick = function() {
        var div = this.parentElement;
        div.style.display = "none";
      }
    }
    }
  </script>
</html>

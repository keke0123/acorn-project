<!DOCTYPE html>
<html>

  <head>
    <link rel="stylesheet" href="style.css">
      
    <script src="http://code.angularjs.org/1.2.12/angular.js"></script>
   
    <script src="script.js"></script>
  </head>

 <div data-ng-app="demo">
  <div data-ng-controller="MainController">
    <div class="hello" when-scrolled="more()">
      <p data-ng-repeat="item in items">
        {{item}}
      </p>
    </div>
    <div data-ng-show="loading">Loading</div>
  </div>
</div>
<h1>INFINITE SCROLLING IN ANGULARJS</h1>

</html>
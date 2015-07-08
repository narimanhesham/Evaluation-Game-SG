var map = '';
var poly;
var infowindow1;
var questions = gon.questions;
var locations = gon.locations;
var correctQuestions = 0;
var previousIndex;

function initialize() {
  var playCity = new google.maps.LatLng(gon.city.latitude, gon.city.longitude);

  var panoramaOptions = {
    position: playCity,
    pov: {
      heading: 200,
      pitch: 3,
    },
    zoom: 0
  };

  var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
  panorama.setVisible(true);

  correctQuestions = 0;
  var unique = [];
  var loop = 0;
  var index =0;
  var infoWindowContent = [];
  locations.forEach( function (location){
    var questionLocation = new google.maps.LatLng(location.latitude, location.longitude);
    var questionMarker = createMarker(questionLocation, panorama, "Hello I'm Question " + location.number);

    var x = getRandomInt(0,questions.length-1);
    console.log("random " + x);
    
    var i = 0;
    for (i; i < unique.length; i++) {
      if(unique[i] == x){
        x = getRandomInt(0,questions.length-1);
        console.log("alternate random " + x);
        i = -1;
      }
      console.log("*" + i);
    };  

    unique.push(x);
    
    console.log(unique[loop]);
    console.log("===============");
    loop++;

    var question = '<div>'+
      '<p style="font-size: 1.1em;"><b>Q: ' +  questions[x].content + '</b></p><table><tr>'+ 
      '<td><a class="choice" onclick="javascript:correctAnswer(\'' + x + '\',\'' + questions[x].choice_A + '\',\'' + index + '\')">A: ' + 
      questions[x].choice_A + '</a></td>' +
      '<td><a class="choice" onclick="javascript:correctAnswer(\'' + x + '\',\'' + questions[x].choice_B + '\',\'' + index + '\')">B: ' + 
      questions[x].choice_B + '</a></td></tr>' + 
      '<tr><td><a class="choice" onclick="javascript:correctAnswer(\'' + x + '\',\'' + questions[x].choice_C + '\',\'' + index + '\')">C: ' + 
      questions[x].choice_C + '</a></td>' + 
      '<td><a class="choice" onclick="javascript:correctAnswer(\'' + x + '\',\'' + questions[x].choice_D + '\',\'' + index + '\')">D: ' + 
      questions[x].choice_D + '</a></td></tr></table>' +
      '<div class="pull-left" id="exp"><img src="/assets/wrong-coins.png" id="expImg" alt="explainImg">' +
      '<a class="hint-choice" onclick="javascript:explain(\'' + x + '\',\'' + index + '\')">Explain (-20)&nbsp&nbsp&nbsp</a></div>' +
      '<div class="pull-right"id="rem"><img src="/assets/wrong-coins.png" id="remImg" alt="removeImg">' +
      '<a class="hint-choice" onclick="javascript:removeTwo(\'' + x + '\',\'' + index + '\')">Remove Two (-50)</a></div></div>';

    infowindow1 = createInfoWindow("test");
    infoWindowContent[index] = question;
    google.maps.event.addListener(questionMarker, 'click', (function(questionMarker,index){
      return function() {
        if(infowindow1.getMap() !== null){
          infowindow1.close();
          questionMarker.setAnimation(google.maps.Animation.BOUNCE);
        }
        else{
          questionMarker.setAnimation(null);
          infowindow1.setContent(infoWindowContent[index]);
          infowindow1.open(panorama, questionMarker);
        }
      }
    })(questionMarker,index));

    previousIndex = index;
    index++;

  });
  
  
  var Bonus = new google.maps.LatLng(40.752814,-73.98137199999996);
  var BonusQuestion = createBonusMarker(Bonus, panorama, "Bonus Tool Tip");

  var BonusContent = '<div class="pull-left">' +
  '<img src="/assets/nypb.JPG" style="padding-right: 20px; width=169px; height=216px;"></div>' +
  '<div class="pull-right">' + 
  '<p><h4>New York Public Library </h4></p>' +
  '<p class="bonus">* Where am I ?</p>' +
  '<p>I am in Bryant Park, Manhattan, New York. <br> (Look to your Left)</p>' +
  '<p class="bonus">* How many items do I have ?</p>' +
  '<p>I have nearly 53 million items.</p>' +
  '<p class="bonus">* Am I large or small ?</p>' +
  '<p>I am the fourth largest public library in the world.</p></div>';

  //To pop up Bonus tool tip window
  var infowindow2 = createInfoWindow(BonusContent);
  
  google.maps.event.addListener(BonusQuestion, 'click', function() {
    if(infowindow2.getMap() !== null){
      infowindow2.close();
      BonusQuestion.setAnimation(google.maps.Animation.BOUNCE);
    } else {
    BonusQuestion.setAnimation(null);
    infowindow2.open(panorama, BonusQuestion);}
  }); 
}

function createImage(url){
  var image = {
    url: url,
    // This marker is 32 pixels wide by 32 pixels tall.
    size: new google.maps.Size(55, 70),
    // The origin for this image is 0,0.
    origin: new google.maps.Point(0,0),
    // The anchor for this image is the base of the flagpole at 0,32.
    anchor: new google.maps.Point(0, 32)
  };
  return image;
}

var marker;
function createMarker(coords, panorama, title){
  marker = new google.maps.Marker({
    position: coords,
    map: panorama,
    icon: createImage("/assets/glowQuestion.png"),
    title: title,
    animation: google.maps.Animation.BOUNCE
  });
  return marker;
}

var BonusMarker;
function createBonusMarker(coords, panorama, title){
  BonusMarker = new google.maps.Marker({
    position: coords,
    map: panorama,
    icon: createImage("/assets/BlueLightBulb.png"),
    title: title
  });
  return BonusMarker;
}

var infowindow;
function createInfoWindow(content){
  infowindow = new google.maps.InfoWindow({
      content: content,
  });
  return infowindow;
}

function correctAnswer(index,choice,locIndex){
  console.log(index + "===========" + choice + "========" + locIndex);
  if (questions[index].correct_choice == choice) {
    // Displaying the clues and the question correctly solved
    infowindow1.setContent('');
    var content = "<div><h4 class='clues-text'>(1) Clues to find next question:</h4>" +
      "<p>" + locations[locIndex].hint + "</p></div>" +
      "<hr><div><p><b>Q:</b>&nbsp " + questions[index].content +
      "<b class='bonus'>&nbsp" + questions[index].correct_choice + "&nbsp&nbsp</b>" +
      "<span class='glyphicon glyphicon-ok correct' aria-hidden='true'>" +
      "</span></p></div>";
    infowindow1.setContent(content);

    // Updating and displaying the score
    var currentScore = document.getElementById("playerScore");
    var currentScoreValue = currentScore.innerHTML;
    currentScoreValue = +currentScoreValue + 100;
    currentScore.innerHTML = currentScoreValue;
    console.log("Before===" + gon.game.score);
    gon.game.score = currentScoreValue;
    gon.game.save;
    console.log("After===" + gon.game.score); 

    //Updating and displaying the questions progress bar 
    var newProgressValue = (((+locIndex+1)/3) * 100);
    $('#playerProgress').attr('aria-valuenow', newProgressValue);

    var newProgressWidth = newProgressValue + "%";
    $("#playerProgress").css("width", newProgressWidth);

    var percentage = Math.ceil( newProgressValue );
    $("#playerProgress").html(percentage + "%");

    if(locIndex == 2){
      popup('checkpointCompleted');
    }

    correctSoFar = +gon.game.correct_questions;
    console.log(correctSoFar + "======" + correctQuestions);
    correctQuestions =  correctSoFar + correctQuestions + 1;
    console.log("====" + correctQuestions);

    $.ajax({
        url : "/home/checkpointsMap/play" + gon.game.id + "/" + gon.checkpoint.id + "/" + gon.city.id,
        type : "post",
        data : { score: JSON.stringify(currentScoreValue), correct_questions: JSON.stringify(correctQuestions) }
    });

  }else{
    console.log("wrong answer!!")
    var currentScore = document.getElementById("playerScore");
    var currentScoreValue = currentScore.innerHTML;
    popup('wrongQuestion');
    $.ajax({
        url : "/home/checkpointsMap/play" + gon.game.id + "/" + gon.checkpoint.id + "/" + gon.city.id + "?",
        type : "get",
        data : { score: JSON.stringify(currentScoreValue), correct_questions: JSON.stringify(correctQuestions) }
    });
  }
  previousIndex = locIndex;
}

function removeTwo(index,locIndex) {
  console.log("-------" + locIndex);
  var eliminated = questions[index].eliminated_choices;
  var eliminated_choices_array = eliminated.split(',');
  console.log("eliminated_choices" + eliminated_choices_array[0] + "----" + eliminated_choices_array[1]);
  var choices_array = [];

  choices_array.push(questions[index].choice_A);
  choices_array.push(questions[index].choice_B);
  choices_array.push(questions[index].choice_C);
  choices_array.push(questions[index].choice_D);

  console.log(questions[index].choice_A);
  console.log(questions[index].choice_B);
  console.log(questions[index].choice_C);
  console.log(questions[index].choice_D);

  var indices = [];
  var new_choices = [];

  for (var i = 0; i < choices_array.length; i++) {
    for (var j = 0; j < eliminated_choices_array.length; j++) {
      if (choices_array[i] == eliminated_choices_array[j]) {
        indices.push(i);
      }
    };
  };

  for (var i = 0; i < choices_array.length; i++) {
    if(i != indices[0] && i != indices[1]){
      new_choices.push(choices_array[i]);
    }
  };

  console.log("indices" + indices[0] + "----" + indices[1] + "----" + indices[2] + "----" +indices[3]);
  console.log(new_choices[0] + "------" + new_choices[1])

  var e = $('#exp').children('#expImg');
  var explain = $(e[0]).attr('alt');
  console.log("Explain div ====" + explain);

  if(explain == "explainImg") {
    var content = '<div>'+
        '<p style="font-size: 1.1em;"><b>Q: ' +  questions[index].content + '</b></p><table><tr>'+ 
        '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + new_choices[0] + '\',\'' + locIndex + '\')">A: ' + 
        new_choices[0] + '</a></td>' +
        '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + new_choices[1] + '\',\'' + locIndex + '\')">B: ' + 
        new_choices[1] + '</a></td></tr></table>' + 
        '<div class="pull-left" id="exp"><img src="/assets/wrong-coins.png">' +
        '<a class="hint-choice" onclick="javascript:explain(\'' + index + '\',\'' + locIndex + '\')">Explain (-20)&nbsp&nbsp&nbsp</a></div>' +
        '</div>';
      } else {
        var exp = questions[index].explaination;
        var content = '<div>'+
            '<p style="font-size: 1.1em;"><b>Q: ' +  questions[index].content + '</b></p><table><tr>'+ 
            '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + new_choices[0] + '\',\'' + locIndex + '\')">A: ' + 
            new_choices[0] + '</a></td>' +
            '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + new_choices[1] + '\',\'' + locIndex + '\')">B: ' + 
            new_choices[1] + '</a></td></tr></table><br>' +
            '<div style="font-size: 1.1em; color:rgb(242, 130, 130);"> Explaination: ' + exp + '</div></div>';
      }
  
  infowindow1.setContent(content); 

  var currentScore = document.getElementById("playerScore");
    var currentScoreValue = currentScore.innerHTML;
    currentScoreValue = +currentScoreValue - 50;
    currentScore.innerHTML = currentScoreValue;
    console.log("Before===" + gon.game.score);
    gon.game.score = currentScoreValue;
    gon.game.save;
    console.log("After===" + gon.game.score);     
}

function explain(index,locIndex) {
  var exp = questions[index].explaination;
  console.log("======================" + exp);

  var r = $('#rem').children('#remImg');
  var remove = $(r[0]).attr('alt');
  console.log("remove div ====" + remove);

  if(remove == "removeImg"){
    var content = '<div>'+
        '<p style="font-size: 1.1em;"><b>Q: ' +  questions[index].content + '</b></p><table><tr>'+ 
        '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + questions[index].choice_A + '\',\'' + locIndex + '\')">A: ' + 
        questions[index].choice_A + '</a></td>' +
        '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + questions[index].choice_B + '\',\'' + locIndex + '\')">B: ' + 
        questions[index].choice_B + '</a></td></tr>' + 
        '<tr><td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + questions[index].choice_C + '\',\'' + locIndex + '\')">C: ' + 
        questions[index].choice_C + '</a></td>' + 
        '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + questions[index].choice_D + '\',\'' + locIndex + '\')">D: ' + 
        questions[index].choice_D + '</a></td></tr></table><br>' +
        '<div style="font-size: 1.1em; color:rgb(242, 130, 130);"> Explaination: ' + exp + '</div>' +
        '<div class="pull-left" id="rem"><img src="/assets/wrong-coins.png">' +
        '<a class="hint-choice" onclick="javascript:removeTwo(\'' + index + '\',\'' + locIndex + '\')">Remove Two (-50)</a></div></div>';
      } else {
        var eliminated = questions[index].eliminated_choices;
        var eliminated_choices_array = eliminated.split(',');
        var choices_array = [];
        choices_array.push(questions[index].choice_A);
        choices_array.push(questions[index].choice_B);
        choices_array.push(questions[index].choice_C);
        choices_array.push(questions[index].choice_D);
        var indices = [];
        var new_choices = [];
        for (var i = 0; i < choices_array.length; i++) {
          for (var j = 0; j < eliminated_choices_array.length; j++) {
            if (choices_array[i] == eliminated_choices_array[j]) {
              indices.push(i);
            }
          };
        };

        for (var i = 0; i < choices_array.length; i++) {
          if(i != indices[0] && i != indices[1]){
            new_choices.push(choices_array[i]);
          }
        };

        var content = '<div>'+
            '<p style="font-size: 1.1em;"><b>Q: ' +  questions[index].content + '</b></p><table><tr>'+ 
            '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + new_choices[0] + '\',\'' + locIndex + '\')">A: ' + 
            new_choices[0] + '</a></td>' +
            '<td><a class="choice" onclick="javascript:correctAnswer(\'' + index + '\',\'' + new_choices[1] + '\',\'' + locIndex + '\')">B: ' + 
            new_choices[1] + '</a></td></tr></table><br>' +
            '<div style="font-size: 1.1em; color:rgb(242, 130, 130);"> Explaination: ' + exp + '</div></div>';
      }

infowindow1.setContent(content);

var currentScore = document.getElementById("playerScore");
    var currentScoreValue = currentScore.innerHTML;
    currentScoreValue = +currentScoreValue - 20;
    currentScore.innerHTML = currentScoreValue;
    console.log("Before===" + gon.game.score);
    gon.game.score = currentScoreValue;
    gon.game.save;
    console.log("After===" + gon.game.score);

}

function goToPreviousLocation() {
  console.log("I am back here" + previousIndex);
  console.log(locations[previousIndex].latitude + "====" + locations[previousIndex].longitude);

  var panoramaOptions = {
    position: new google.maps.LatLng(locations[previousIndex].latitude, locations[previousIndex].longitude),
    pov: {
      heading: 200,
      pitch: 3,
    },
    zoom: 0
  };
  var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);
  panorama.setVisible(true);
}

function challengeQuestion(){
  var currentScore = document.getElementById("playerScore");
    var currentScoreValue = currentScore.innerHTML;
    currentScoreValue = +currentScoreValue + 40;
    currentScore.innerHTML = currentScoreValue;

    popup('popUpDiv'); 
}

function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function loadScript() {
  console.log("map loading ...");
   var script = document.createElement('script');
   script.type = 'text/javascript';
   script.src = 'https://maps.googleapis.com/maps/api/js?sensor=false' +
     '&callback=initialize';
   document.body.appendChild(script);
}
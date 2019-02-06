$( document ).ready(function() {
  setTimeout(loadDatSkweenie, 2000);
});

function loadDatSkweenie() {
  var banner = ["&nbsp", "D" ,"a", "i", "l", "y", "&nbsp", "R", "P", "&nbsp"]
  var rules = ["D3v jest bogiem.", 
               "Hibari zawsze drugi.", 
               "Bojano zapominany...", 
               "Ziemniaki?.", 
               "Juza... dzban!",
               "RIP Polskie Serwery RP - 2018",
               "Nitro dalej szuka programisty.",
               "Wszystko dla pieniedzy..."
              ]
  var fadeTime = 500
  var fadeTime2 = 500
  $(".infohold").fadeIn(900)
  $(".steamid").show(900)
  $(banner).each(function( i ) {
    var tCount = Number(i)
    fadeTime = fadeTime + 200
    $(".banner p:nth-child("+tCount+")").hide()
    $( ".banner" ).append( "<p>"+banner[tCount]+"</p>" );
    $(".banner p:nth-child("+tCount+")").fadeIn(fadeTime)
  })
  $(rules).each(function( i ) {
    var rCount = Number(i) 
    fadeTime2 = fadeTime2 + 300
    $(".block .text:nth-child("+rCount+")").hide()
    $( ".block:nth-child(1)" ).append( "<p class='text'>"+rules[rCount]+"</p>" )
    $(".block .text:nth-child("+rCount+")").show(fadeTime2)
  })
}
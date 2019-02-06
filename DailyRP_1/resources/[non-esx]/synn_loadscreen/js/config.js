var config =
{    
    /*
        Do we want to show the image?
        Note that imageSize still affects the size of the image and where the progressbars are located.
    */
    enableImage: true,
 
    /*
        Relative path the the logo we want to display.
    */
    image: "img/logo.png",

    /*
        Cursor image
    */
    cursorImage: "img/cursor.png",
 
    /*
        How big should the logo be?
        The values are: [width, height].
        Recommended to use square images less than 1024px.
    */
    imageSize: [512, 512],
 
    /*
        Define the progressbar type
            0 = Single progressbar
            1 = Multiple progressbars
            2 = Collapsed progressbars
     */
    progressBarType: 0,
 
    /*
        Here you can disable some of progressbars.
        Only applys if `singleProgressbar` is false.
    */
    progressBars:
    {
        "INIT_CORE": {
            enabled: false, //NOTE: Disabled because INIT_CORE seems to not get called properly. (race condition).
        },
 
        "INIT_BEFORE_MAP_LOADED": {
            enabled: true,
        },
 
        "MAP": {
            enabled: true,
        },
 
        "INIT_AFTER_MAP_LOADED": {
            enabled: true,
        },
 
        "INIT_SESSION": {
            enabled: true,
        }
    },
 
    /*
        Loading messages will be randomly picked from the array.
        The message is located on the left side above the progressbar.
        The text will slowly fade in and out, each time with another message.
        You can use UTF-8 emoticons inside loading messages!
    */
    loadingMessages:
    [
        "Sprzatamy Serwer... &#x1f40c;",
        "Ladujemy Skrypty... &#x1f40c;",
        "Spawnujemy NPC.... &#x1f40c; &#x1f528;",
        "Spawnujemy Narkotyki.... &#x1f40c; &#x1f462;",
        "Leeeeroooy Jeeenkiiinnssss.. &#x1f41a.",
        "ProjectRP Najlepszy Polski Serwer RP... &#x1f3cf",
        "Widziales? To dziki AnuPsiak... &#x1f9e0;",
        "Jakis debil lata z kartonem na glowie. &#x1f956;",
        "Uwazaj, po wyspie chodza lamusy... &#x1f374;",
        "Slyszalem ze za miastem sa Losie?! &#x1f60d;",
        "Juz niedlugo!",
        "Bledy Zawsze Beda - Jakis Debil (2018)... &#x1f697;",
        "Na wyspie nie ma Benny's ale jest LSC... &#x1f3cc;",
        "7 to prawie 0... &#x1f4f1;",
        "Amatorszczyzna. &#x1f691;",
		"'Nie masz ochrony do wplaty...' &#x1f3cf",
    ],
 
    /*
        Rotate the loading message every 5000 milliseconds (default value).
    */
    loadingMessageSpeed: 5 * 1000,
 
    /*
        Array of music id's to play in the loadscreen.
        Enter your youtube video id's here. In order to obtain the video ID
        Take whats after the watch?v= on a youtube link.
        https://www.youtube.com/watch?v=<videoid>
        Do not include the playlist id or anything, it should be a 11 digit code.
       
        Do not use videos that:
            - Do not allow embedding.
            - Copyrighted music (youtube actively blocks this).
    */
    music:
    [
        "JD7In3lK7Gw", "ThU5NF0mv4g",
    ],
 
 
    /*
        Set to false if you do not want any music.
    */
    enableMusic: true,
 
    /*
        Default volume for the player. Please keep this under 50%, to not blowout someones eardrums x)
     */
    musicVolume: 20,
 
    /*
        Should the background change images?
        True: it will not change backgrounds.
        False: it will change backgrounds.
    */
    staticBackground: false,
   
    /*
        Array of images you'd like to display as the background.
        Provide a path to a local image, using images via url is not recommended.
    */
    background:
    [
        "img/bg1.jpg",
        "img/bg2.jpg",
        "img/bg3.jpg",
		"img/bg4.jpg",
		"img/bg5.jpg",
    ],
 
    /*
        Time in milliseconds on how fast the background
        should swap images.
     */
    backgroundSpeed: 10 * 1000,

    /*
        Which style of animation should the background transition be?
        zoom = background zooms in and out.
        slide = transtion backgrounds from sliding right and back again.
        fade = fade the background out and back in.
    */
    backgroundStyle: "fade",

    /*
        Should the log be visible? Handy for debugging!
    */
    enableLog: true,
}

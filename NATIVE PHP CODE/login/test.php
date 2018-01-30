<?php
	session_start();
	require('../include/session_check.php');
	$pgTitle="View Scores Page";
	require('../class/class_mysql_conn.php');
	require('../class/class_users.php');
	require('../components/html_head.php');
?>
</head>

<style type="text/css">

</style>
<body>
<?php
	require('../components/html_banner.php');
?>
<div class="container">
        <script>
            //Text to Speech
            // function speak(text) {
            //     var synth = window.speechSynthesis;
            //     var utterance = new SpeechSynthesisUtterance(text);
            //     utterance.rate = 1; // SPEED
            //     synth.speak(utterance);

            //     // var test = speechSynthesis.getVoices();
            //     // alert(test);
            // }
            
    speechSynthesis.onvoiceschanged = function () {
    // get the voice
    var voices = speechSynthesis.getVoices();
    var derangedVoice = voices.filter(function (voice) {
        return voice.name == 'Deranged';
    })[0];
 
    // create the uttrance
    var u = new SpeechSynthesisUtterance();
    u.voice = derangedVoice;
    u.text = 'Jon likes Iced Tea!';
 
    // utter the utterance
    speechSynthesis.speak(u);
}
        </script>
</div>
<?php
	require('../components/html_footer.php');
?>
</body>
<!-- <script language = "javascript" type = "text/javascript" src = "../js/p5.min.js"></script> -->
<!-- <script type="text/javascript" language="javascript" src="../js/raphael-min.js"></script> -->
</html>
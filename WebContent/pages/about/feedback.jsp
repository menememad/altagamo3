<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="sj" uri="/struts-jquery-tags"%>
<center>
<div style="background-color: #FFB00F;border: 0;width: 400px;" id="loginBodyID">
	<p style="color: #AD7400;font-family: Tahoma;font-size: 20pt;">Please tell us your comments/feedback:</p>
	Subject: 
	<select id="subject" name="subject">
		<option value="Advertisement">Advertisement</option>
		<option value="Marketing">Marketing</option>
		<option value="Look &amp; Feel">Look &amp; Feel</option>
	</select>
	Comment: <textarea id="body" name="body" rows="7" cols="100"></textarea>
	<a href="javascript:sendMail();">Submit</a>
</div>
</center>
<script>
function sendMail(){
	var subject = document.getElementById('subject').value;
	var body = document.getElementById('body').value;
	window.location.href='mailto:info@altagamo3.com?subject='+subject+'&body='+body;
}
</script>

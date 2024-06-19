function creadiatinal()
{
	//var email=document.getElementById('Emailid').value;
		var email=document.AdminLogin.username.value
		var pass=document.AdminLogin.password.value 
		console.log(email)
		console.log(pass)

	if((email=="admin@gmail.com") && (pass=="Admin@123")){
		   alert("successfully login");
		   return true;
	}
	else
	{
		 alert("login fail");
		return false;
	}
}
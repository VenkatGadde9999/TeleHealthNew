/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function ()
{
 //alert("hai");

    $("#doctorbtn").click(function () {
       // alert("hai");
        var doctorname = $("#doctorid").val();
        var password = $("#pwd").val();
        if (doctorname == "") {
            $('#doctorid').css("background-color", "lightpink");
            $("#doctorid").focus();
            return false;
        }
        if (password == "") {
            $('#pwd').css("background-color", "lightpink");
            $("#pwd").focus();
            //alert("Password is required");
            return false;
        }
    });

    $("#patientbtn").click(function () {
        // alert("hai");
        var patientname = $("#patientid").val();
        var password = $("#pwd").val();
        if (patientname == "") {
            $('#patientid').css("background-color", "lightpink");
            $("#patientid").focus();
            return false;
        }
        if (password == "") {
            $('#pwd').css("background-color", "lightpink");
            $("#pwd").focus();
            //alert("Password is required");
            return false;
        }
    });

    $("#codebtn").click(function () {
        // alert("hai");
        var code = $("#code").val();
        if (code == "") {
            $('#code').css("background-color","lightpink");
            $("#code").focus();
            return false;
        }
    });


    $("#forgetdocpwdbtn").click(function () {
        var doctorid = $("#doctorid").val();
        var fn = $("#fname").val();
        var ln = $("#lname").val();
        if (doctorid == "") {
            $('#doctorid').css("background-color","lightpink");
            $("#doctorid").focus();
            return false;
        }

        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;


        if (doctorid.length === 0 || !emailReg.test(doctorid))
        {
            alert("Enter valid email id");
            $('#doctorid').css("background-color","lightpink");
            $("#doctorid").focus();
            return false;
        }
        
         if (fn === "") {
            $('#fname').css("background-color","lightpink");
            $("#fname").focus();
            return false;
        }
        if (ln === "") {
            $('#lname').css("background-color","lightpink");
            $("#lname").focus();
            return false;
        }
    });

    $("#forgetpatpwdbtn").click(function () {
        //alert("hai");
        var patientid = $("#patientid").val();
        var fn = $("#fname").val();
        var ln = $("#lname").val();
        if (patientid == "") {
            $('#patientid').css("background-color","lightpink");
            $("#patientid").focus();
            return false;
        }

        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;


        if (patientid.length === 0 || !emailReg.test(patientid))
        {
            alert("Enter valid email id");
            $('#patientid').css("background-color","lightpink");
            $("#patientid").focus();
            return false;
        }
        
         if (fn === "") {
            $('#fname').css("background-color","lightpink");
            $("#fname").focus();
            return false;
        }
        if (ln === "") {
            $('#lname').css("background-color","lightpink");
            $("#lname").focus();
            return false;
        }
    });

    $("#quebtn").click(function () {
        var que1 = $("#question1").val()
        var ans1 = $("#answer1").val();
        var que2 = $("#question2").val()
        var ans2 = $("#answer2").val();
        if (que1 === "" || que1 === "select 1st Question") {
            $('#question1').css("background-color","lightpink");
            $("#question1").focus();
            //alert("Password is required");
            return false;
        }
        if (ans1 === "") {
            $('#answer1').css("background-color","lightpink");
            $("#answer1").focus();
            //alert("Password is required");
            return false;
        }
        if (que2 === "" || que2 === "select 2nd Question") {
            $('#question2').css("background-color","lightpink");
            $("#question2").focus();
            //alert("Password is required");
            return false;
        }
        if (ans2 === "") {
            $('#answer2').css("background-color","lightpink");
            $("#answer2").focus();
            //alert("Password is required");
            return false;
        }
    });


    $("#resetbtn").click(function () {
        var password = $("#password").val();
        var password2 = $("#password2").val();
        if (password === "") {
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        if (password2 === "") {
            $('#password2').css("background-color","lightpink");
            $("#password2").focus();
            //alert("Password is required");
            return false;
        }
 var passReg=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
        if (passReg.test(password))
        {

        }
        else
        {
            alert("The password's first character must be a Uppercase alphabet, it must contain at least 8 characters and no more than 15 characters and no characters other than letters, numbers and the underscore may be used");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        if (password !== password2) {
            $('#password').css("background-color","lightpink");
            $('#password2').css("background-color","lightpink");
            $("#password").focus();
            alert("Password not matching");
            return false;
        }
        
    });


    $("#uploadbtn").click(function () {
        var fileid = $("#fileid").val();
        var category = $("#category").val();
        var ufile = $("#ufile").val();
        if (fileid == "") {
            $('#fileid').css("background-color","lightpink");
            $("#fileid").focus();
            return false;
        }
        if (category == "") {
            $('#category').css("background-color","lightpink");
            $("#category").focus();
            //alert("Password is required");
            return false;
        }
        if (ufile == "") {
            $('#ufile').css("background-color","lightpink");
            $("#ufile").focus();
            //alert("Password is required");
            return false;
        }

    });

    $("#approve").click(function () {
        
        var sloatstart = $("#sloatstart").val();
        var sloatend = $("#sloatend").val();
        //  alert(sloatstart);
        if (sloatstart === "") {
            $('#sloatstart').css("background-color","lightpink");
            $("#sloatstart").focus();
            return false;
        }
        if (sloatend === "") {
            $('#sloatend').css("background-color","lightpink");
            $("#sloatend").focus();
            //alert("Password is required");
            return false;
        }
    });

    $("#ptrregbtn").click(function () {
      // alert('hai pat');
        var fn = $("#fname").val();
        var ln = $("#lname").val();
        var id = $("#patientid").val();       
        var pwd = $("#password").val();
        var pwd2 = $("#password2").val();

         if (fn === "") {
            $('#fname').css("background-color","lightpink");
            $("#fname").focus();
            return false;
        }
        if (ln === "") {
            $('#lname').css("background-color","lightpink");
            $("#lname").focus();
            return false;
        }
        if (id === "") {
            $('#patientid').css("background-color","lightpink");
            $("#patientid").focus();
            return false;
        }
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;


        if (emailReg.test(id))
        {

        }
        else
        {
            alert("Enter valid email id");
            $('#id').css("background-color", "lightpink");
            $("#id").focus();
            return false;
        }
        //alert("Password is required")
        if (pwd === "") {
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        if (pwd2 === "") {
            $('#password2').css("background-color","lightpink");
            $("#password2").focus();
            return false;
        }
        if (pwd !== pwd2) {
            alert("confirm Password not matchings");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
         var passReg=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
         
        if (passReg.test(pwd))
        {
 
        }
        else
        {
            alert("password between 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
       
    });


$("#docregbtn").click(function () {
     //  alert('hai pat');
        var fn = $("#fname").val();
        var ln = $("#lname").val();
        var id = $("#doctorid").val();       
        var pwd = $("#password").val();
        var pwd2 = $("#password2").val();

         if (fn === "") {
            $('#fname').css("background-color","lightpink");
            $("#fname").focus();
            return false;
        }
        if (ln === "") {
            $('#lname').css("background-color","lightpink");
            $("#lname").focus();
            return false;
        }
        if (id === "") {
            $('#doctorid').css("background-color","lightpink");
            $("#doctorid").focus();
            return false;
        }
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;


        if (emailReg.test(id))
        {

        }
        else
        {
            alert("Enter valid email id");
            $('#id').css("background-color", "lightpink");
            $("#id").focus();
            return false;
        }
        //alert("Password is required")
        if (pwd === "") {
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        if (pwd2 === "") {
            $('#password2').css("background-color","lightpink");
            $("#password2").focus();
            return false;
        }
        if (pwd !== pwd2) {
            alert("confirm Password not matchings");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
         var passReg=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
         
        if (passReg.test(pwd))
        {
 
        }
        else
        {
            alert("password between 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
       
    });


    /*user profile*/
    $("#userprofilebtn").click(function () {
        var id = $("#userid").val();
        var pwd = $("#password").val();
        var pwd2 = $("#password2").val();
        var fn = $("#firstname").val();
        var ln = $("#lastname").val();


        var email = $("#email").val();
        var addr = $("#address").val();
        var ph = $("#phone").val();
        var que1 = $("#question1").val();
        var ans1 = $("#answer1").val();
        var que2 = $("#question2").val();
        var ans2 = $("#answer2").val();
        if (id === "") {
            $('#userid').css("background-color","lightpink");
            $("#userid").focus();
            return false;
        }
        //alert("Password is required")
        if (pwd === "") {
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        if (pwd2 === "") {
            $('#password2').css("background-color","lightpink");
            $("#password2").focus();
            return false;
        }
        if (pwd !== pwd2) {
            alert("confirm Password not matchings");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        var passReg=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*_]).{8,15}$/;
        /*var passReg=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&]).{8,10}$/g;*/
        if (passReg.test(pwd))
        {

        }
        else
        {
            alert("The password's first character must be a Uppercase alphabet, it must contain at least 8 characters and no more than 15 characters and no characters other than letters, numbers and the underscore may be used");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        
        if (fn === "") {
            $('#firstname').css("background-color","lightpink");
            $("#firstname").focus();
            return false;
        }
        if (ln === "") {
            $('#lastname').css("background-color","lightpink");
            $("#lastname").focus();
            return false;
        }
        if (email === "") {
            $('#email').css("background-color","lightpink");
            $("#email").focus();
            return false;
        }

        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;


        if (emailReg.test(email))
        {

        }
        else
        {
            alert("Enter valid email id");
            $('#email').css("background-color","lightpink");
            $("#email").focus();
            return false;
        }
        if (addr === "") {
            $('#address').css("background-color","lightpink");
            $("#address").focus();
            //alert("Password is required");
            return false;
        }

        var filter = /[0-9-+]+$/;
        if ((ph.length < 10) || (!filter.test(ph))) {


            alert("Enter the valid phone no");
            $('#phone').css("background-color","lightpink");
            $("#phone").focus();
            return false;
        }




        if (que1 === "" || que1 === "select 1st Question") {
            $('#question1').css("background-color","lightpink");
            $("#question1").focus();
            //alert("Password is required");
            return false;
        }
        if (ans1 === "") {
            $('#answer1').css("background-color","lightpink");
            $("#answer1").focus();
            //alert("Password is required");
            return false;
        }
        if (que2 === "" || que2 === "select 2nd Question") {
            $('#question2').css("background-color","lightpink");
            $("#question2").focus();
            //alert("Password is required");
            return false;
        }
        if (ans2 === "") {
            $('#answer2').css("background-color","lightpink");
            $("#answer2").focus();
            //alert("Password is required");
            return false;
        }
    });

    $("#adminprofilebtn").click(function () {
        var fn = $("#firstname").val();
        var ln = $("#lastname").val();
       // alert(fn);
        var id = $("#adminid").val();
        var pwd = $("#password").val();
        if (fn === "") {
            $('#firstname').css("background-color","lightpink");
            $("#ffirstname").focus();
            return false;
        }
        if (ln === "") {
            $('#lastname').css("background-color","lightpink");
            $("#lastname").focus();
            return false;
        }
        if (id == "") {
            $('#adminid').css("background-color","lightpink");
            $("#adminid").focus();
            //alert("Password is required");
            return false;
        }
        if (pwd.length === 0) {
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
        
         var passReg=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
        if (passReg.test(pwd))
        {

        }
        else
        {
            alert("The password's first character must be a Uppercase alphabet, it must contain at least 8 characters and no more than 15 characters and no characters other than letters, numbers and the underscore may be used");
            $('#password').css("background-color","lightpink");
            $("#password").focus();
            return false;
        }
    });
});
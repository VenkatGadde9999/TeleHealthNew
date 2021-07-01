package beansclasses;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Chiru
 */
public class Admin {
private String adminid,password,firstname,lastname;
public Admin()
{
    
}
public void setAdminid(String adminid)
{
    this.adminid=adminid;
}
public void setPassword(String password)
{
    this.password=password;
}
public String getAdminid()
{
    return adminid;
}
public String getPassword()
{
    return password;
}
public void setFirstname(String firstname)
{
    this.firstname=firstname;
}
public String getFirstname()
{
    return firstname;
}
public void setLastname(String lastname)
{
    this.lastname=lastname;
}
public String getLastname()
{
    return lastname;
}
}

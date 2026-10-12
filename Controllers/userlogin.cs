
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Reflection.Metadata.Ecma335;
using System.Security.Claims;

namespace RaceDayPOE.Controllers
{//start of namespace
    [Route("api/[controller]")]
    [ApiController]
    public class userlogin : ControllerBase
    {//start of class
        [HttpPost]
        public string user_info(string username, string email, string password)
        {
            {//start of method

                //creating an object
                register store = new register();
                //call the method
                store.user_info(username, email, password);

                return "user info saved";
                //return "Your full name is: " + fullname + " Your email is: " + email + " Your id number is: " + id_num;



            }
        }
            [HttpGet("id")]
            public string getinfo_byID(int id)
            {
                //creating an object
                get_user_info getInfo = new get_user_info();

                return "it works...";
            }
            //put request to update the user info  
            [HttpPut("update_byID")]
            public string update_userinfo(int update_byID, string fullname, string id_num)
            {//start of method update


                //test message
                return "it works...";
            }//end of method update

        }//end of class
    }//end of namespace

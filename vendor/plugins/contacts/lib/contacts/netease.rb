require 'csv'

class Contacts
  class Netease < Base
    URL                 = "http://email.163.com/#163" 
    LOGIN_URL           = "https://reg.163.com/logins.jsp?type=1&product=mail163&url=http://entry.mail.163.com/coremail/fcg/ntesdoor2?lightweight%3D1%26verifycookie%3D1%26language%3D-1%26style%3D-1 username=wear2001%40163.com&user=wear2001&=163&password=tellmewhy&=-1&=-1&=-1&rmbUser=on&=on"
    CONTACT_LIST_URL    = "http://cg1a151.mail.163.com/jy3/address/addrlist.jsp?sid=%s"
    PROTOCOL_ERROR      = "please contact stephen,skung@sandsroad.com"   
    
    def real_connect
      postdata =  ".tries=2&.src=ym&.md5=&.hash=&.js=&.last=&promo=&.intl=us&.bypass="
      postdata += "&.partner=&.u=4eo6isd23l8r3&.v=0&.challenge=gsMsEcoZP7km3N3NeI4mX"
      postdata += "kGB7zMV&.yplus=&.emailCode=&pkg=&stepid=&.ev=&hasMsgr=1&.chkP=Y&."
      postdata += "done=#{CGI.escape(URL)}&login=#{CGI.escape(login)}&passwd=#{CGI.escape(password)}"
      
      data, resp, cookies, forward = post(LOGIN_URL, postdata)
      
      if data.index("Invalid ID or password") || data.index("This ID is not yet taken")
        raise AuthenticationError, "Username and password do not match"
      elsif data.index("Sign in") && data.index("to Yahoo!")
        raise AuthenticationError, "Required field must not be blank"
      elsif !data.match(/uncompressed\/chunked/)
        raise ConnectionError, PROTOCOL_ERROR
      elsif cookies == ""
        raise ConnectionError, PROTOCOL_ERROR
      end
      
      data, resp, cookies, forward = get(forward, cookies, LOGIN_URL)
      
      if resp.code_type != Net::HTTPOK
        raise ConnectionError, PROTOCOL_ERROR
      end
      
      @cookies = cookies
    end
    
  end
end
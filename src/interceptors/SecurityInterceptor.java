package interceptors;

import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;


@SuppressWarnings("serial")
public class SecurityInterceptor implements Interceptor{

	public void destroy() {
	}

	public void init() {
	}

	/* ==================================================================================================== */
	//it is the payload part of this interceptor ... 
	//it is better in this method to invalidate the session rather than the logic exist ... Hossam Yassen
	public String intercept (ActionInvocation invocation) throws Exception {
		final ActionContext context = invocation.getInvocationContext ();

		Map<String , Object> session =  context.getSession();
		String stReturn ;
		//Action action=(Action)invocation.getAction();
		if(session==null ||  session.get("userInfo")==null){
		System.out.println("Your Session is invalid OR you are not logged in ... Please Login first . ");
		return "login";
		}
		else
			 stReturn = invocation.invoke() ;			
		System.out.println("SecurityInterceptor : intercept : stReturn === "+ stReturn);
		
		return stReturn;
	}
}
@RestResource(urlMapping='/HelloWorld')
global with sharing class HelloWorldService {
	@HttpGet
	global static String speak(){
		// RestRequest req = RestContext.request;
		// RestResponse res = RestContext.response;
		return 'Hello World';
	}
}

:-- Simple HTTP Server
:-- Overview
This is a simple HTTP server application built using Java. 
The application uses the com.sun.net.httpserver package to create a basic HTTP server that listens on port 8080 and responds to all requests with a "Hello World" HTML message.

Requirements
Java JDK 1.8 or higher
Running the Application
Compile the application using a Java compiler.
Run the application using the Java Virtual Machine (JVM).


Code Explanation
The main method creates an HttpServer instance that listens on port 8080 and binds it to the root context ("/"). It also creates a default executor for the server and starts the server.

The MyHandler class implements the HttpHandler interface and overrides the handle method. This method is called whenever a new HTTP request is received by the server. The handle method responds to every request with an HTTP 200 response code and a simple HTML message that says "Hello World!!!! I just Dockerized a Maven Project".

Conclusion
This application serves as a basic example of how to create a simple HTTP server using Java. 
It can be used as a starting point for more complex applications that require an HTTP server.

The program is a very basic HTTP server written in Java. 
It seems to be more of a demonstration or a learning exercise rather than a production-ready application. 

In summary, while there are many HTTP server software available, creating a simple, custom HTTP server in Java might be beneficial for learning purposes, 
  creating a lightweight solution, or integrating with existing Java applications.

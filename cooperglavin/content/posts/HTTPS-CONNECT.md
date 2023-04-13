+++
title = "Proxying 101 and HTTPS CONNECT"
date = "2023-04-12T20:37:16-04:00"
author = ""
authorTwitter = "" #do not include @
cover = ""
tags = ["", ""]
keywords = ["", ""]
description = ""
showFullContent = false
readingTime = false
hideComments = false
color = "" #color from the theme settings
+++

# HTTP(S) Proxying and HTTPS CONNECT

So for my research project I am investigating creating HTTP proxies, and thought I would write my post on how HTTP proxies work, different kinds, and the HTTPS CONNECT method.

## Proxying 101

Proxying and tunneling are ways to add user safety when navigating the internet. Specifically, proxying is the use of a "server" node to handle web requests for the client, and comes in two main types: forward and reverse. 
**Forward proxying** is when I, the client, send my HTTP request to the server (ex GET some html page from a website), and the server will then make forward the request to the destination. The destination will then send the response to the server, who will forward it back to me. This brings the advantage of hiding/obfuscating my IP address from the internet, however requires trust in the proxy. Proxies can also be monitored as they are public, so frequency analysis attacks are strong, and can often-times be unsafe for the user (lack of adequate data protection, etc). One extreme example of forward proxying is Tor, which on a basic level selects many nodes to server as forward proxies, routing your request through several nodes to give the client a high degree of anonymity. 
**Reverse proxying** is server-side, providing load-balancing and protection to the servers that host content. When a packet is addressed to some IP space, say my website, I can have a front-facing reverse proxy that will receive this request, and then handle distributing it to the proper servers. If I have a large cluster, reverse-proxy nodes can distribute requests equally to minimize burden on any single server, and can cache statically-generated content to give faster responses to requests.

### HTTP and Proxying

The above outlines basic ways to make HTTP request through a forward proxy, simply connect to the proxy, and then send it your GET requests to be forwarded off. However, these are only HTTP requests, and as such have no encryption protection, and if the proxy itself becomes compromised, the proxy now knows everything about the client. If the traffic between the proxy and client is intercepted, there is no protection as we are running basic HTTP. Therefore, the next logical step is...
**HTTPs Proxying**. Adding in TLS, the client makes a TLS handshake with the server, encrypting this step of the communication. Next up, the server uses it's own certificate to perform a TLS handshake with the destination, there are two different TLS handshakes for each request. That said, each step of the proxy is encrypted, so there is minimal risk from eavesdroppers on any stage of the connection. However, the proxy server will need to decrypt the response and then re-encrypt to send it back to the client, so the proxy still knows everything and there is a high risk of a MitM attack. How do we get end-to-end encryption?

#### HTTPS CONNECT
The **HTTPS CONNECT** request is what we are looking for. First, the client sends an HTTPS CONNECT request to the server, saying I want to connect to https://example.com. Then, the server will process this, and start a basic TCP (no ecnryption) request to the destination. After the TCP handshake, the server will send back an HTTP-200 response, indicating that we are good to go. From then on, the client can make continuous requests (GET, PUSH, what have you) to the destination, all with HTTPS. The server doesn't process anything, and instead just performs layer 4 forwarding to forward all received packets over the TCP connection. This avoids MitM attacks, as the only way the proxy server (or a malicious user) can do this is spoof the destination's certificate in the TLS handshake, which we are assuming is not going to happen. Essentially, the client has a direct TLS connection with the destination, with the server simply forwarding things in each direction. The server never knows what is happening, as all communication is encrypted under TLS, and anybody eavesdropping between the server and client will simply see encrypted TCP traffic, unable to even determine where it is going, giving us *end-to-end encryption*.




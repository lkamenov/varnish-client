acl purge {
  "localhost";
}

sub vcl_recv {
  if (req.request == "PURGE") {
    if (!client.ip ~ purge) {
      error 405 "Not allowed.";
    }
    ban("req.http.host == " + req.http.host + " && req.url ~ " + req.url);
    error 200 "Purged.";
  }
  if (req.request == "BAN") {
    if (!client.ip ~ purge) {
      error 405 "Not allowed.";
    }
    ban("req.http.host == " + req.http.host +
      "&& req.url == " + req.url);
    error 200 "Ban added";
  }
}

# Question 1
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", key="c244098f23e3b678fff5",
                   secret = "96a45eeffe2351f4e7ebb699e4c028b66e4a6d51")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
#req <- GET("https://api.github.com/rate_limit", gtoken)
req <- GET("https://api.github.com/users/jtleek/repos?sort=created", gtoken)
#req <- GET("https://api.github.com/users/jschaal/repos?sort=created", gtoken)
stop_for_status(req)
repList <- content(req)
for (i in 1:length(repList)) {
        print(paste(as.character(i),repList[[i]]$name,as.character(repList[[i]]$created_at)))
}


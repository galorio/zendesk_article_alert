# zendesk_article_alert
At the time of writing, Zendesk doesn't have a feature to notify individuals if there are newly created &amp; updated articles. They have to follow the sections/categories for them to be notified.

Support Portals have several sections/categories so it is not efficient to subscribe to each one. Also, from time-to-time, new sections/categories are added. 

Refer to Help Center: https://support.zendesk.com/hc/en-us/articles/225693668-Help-Center-Are-agents-and-admins-notified-of-new-articles-posts-and-comments-by-default-


Purpose:
It is vital that we keep ourselves updated and informed when it comes to our own articles. 

Solution:
Made a simple bash script to list down newly created and updated articles.

Tools used:

Bash | UNIX/Linux Shell | https://www.gnu.org/software/bash/

curl| command line tool and library for transferring data with URLs| https://curl.haxx.se/

jq| jq is like sed/awk/grep/etc for JSON data | https://stedolan.github.io/jq/

postfix | A mail agent | http://www.postfix.org/

Zendesk Help Center (Search) API| API to search for knowledge base articles or community posts.| https://developer.zendesk.com/rest_api/docs/help_center/search


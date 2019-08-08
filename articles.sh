#!/bin/bash
 
# Purpose of the script:
# At the time of writing, Zendesk doesn't have a feature to alert individuals if there are newly created & updated articles.
 
# To address:
# This script will check recently created Zendesk articles via API.
# If there are entries found, an email will be sent to the defined recipients with the link of the article.
 
# A simple script written by Arnel Galorio
 
 
RECIPIENTS="$1"
 
curl "https://itrs.zendesk.com/api/v2/help_center/articles/search.json?created_at=`date +%Y-%m-%d -d 'today'`&query=%22%22&sort_by=created_at&sort_order=asc&page=1&per_page=100" -s | jq --raw-output '.results[] | "\(.created_at | fromdateiso8601 | strftime("%Y-%m-%d %H:%M:%S GMT -")) \(.html_url)"' > /tmp/created_articles.txt
 
curl "https://itrs.zendesk.com/api/v2/help_center/articles/search.json?updated_at=`date +%Y-%m-%d -d 'today'`&query=%22%22&sort_by=updated_at&sort_order=asc&page=1&per_page=100" -s | jq --raw-output '.results[] | "\(.updated_at | fromdateiso8601 | strftime("%Y-%m-%d %H:%M:%S GMT -")) \(.html_url)"' > /tmp/updated_articles.txt
 
echo -e "Newly created articles:\n(date/time is based on created_at)" > /tmp/send_articles.txt
cat /tmp/created_articles.txt >> /tmp/send_articles.txt
echo -e "\nRecently updated articles:\n(date/time is based on updated_at)" >> /tmp/send_articles.txt
cat /tmp/updated_articles.txt >> /tmp/send_articles.txt
 
 
if [ `cat /tmp/*ted_articles.txt | wc -l` != 0 ] && [ `grep 'https://support.itrsgroup.com/hc/en-us/articles/' /tmp/*ted_articles.txt | wc -l` != 0 ]; then
        cat /tmp/send_articles.txt | mail -s "Zendesk Guide: Recently created and updated articles" -r 'Zendesk Article Alert<sandbox@pugo.mnl.itrsgroup.com>' "`cat $RECIPIENTS`"
fi

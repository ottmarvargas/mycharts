#!/bin/bash

charturl=$1
if [ -d "/home/ibmdemo/mycharts/notification-chart" ] 
then
    helm package notification-chart/
fi
helm package trader-chart/
helm package trader-chart/charts/portfolio-chart/
helm package trader-chart/charts/portfolio-chart/charts/stockquote-chart
helm package trader-chart/charts/portfolio-chart/charts/loyaltylevel-chart
mv -f *.tgz docs
helm repo index docs --url $charturl

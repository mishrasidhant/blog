+++ 
draft = true
date = {{ .Date }}
unique_id = "{{ now.UnixNano }}"
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
description = ""
slug = ""
authors = []
tags = []
categories = []
externalLink = ""
series = []
+++
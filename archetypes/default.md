+++
date = '{{ .Date }}'
draft = true
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
unique_id = "{{ now.UnixNano }}"
+++

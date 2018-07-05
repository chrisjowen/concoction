# Concoction


IF/Trigger/Ingredient


Triggers really have several parts:

- How is the data retrieved i.e. polling/webhook and auth to use
- How to validated/filter the results retrieved will cause the trigger (conditional triggers?)
- How to validated/filter the results retrieved will cause the trigger (conditional triggers?)


Notes:

- Start with defining one for JIRA. And write all parts. 
- Then go with genericing



Polling:
------
1. How to get data (Auth/Keys/Etc) 
3. How to process it (Recieving module/script)
4. Where to publish to
5. When to get it

WebHook
-------
1. Where to post
2. How to process it
3. Where to publish to

Needed:
-------
- A Fetcher 
- A Processor
- A Publisher
- A Scheduler

Processor should have a context + data. Context is the everything!!! Think plug baby!!

Action
-------
1. How to retrieve from published
2. How to process 
3. What service to call

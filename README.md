# fisheries

deploy a NOAA stock synthesis model to Posit Connect

The original example is posted on https://github.com/edavidaja/fisheries


## How to deploy, in reality

- cloned the repo, installed just and npm
- setup the connect credentials: in the terminal [install rsconnect-python](https://docs.posit.co/connect/user/connecting-cli/#command-line-interface-with-rsconnect-python) and use it to add your Connect server creds locally and a nickname for your server (assume here we used the nickname nmfsconnect)
- ran `just setup` (but had to run it line by line, because npm was not being
found). This added the ss3 executable and the stock synthesis files. 
- ran `just manifest` to update the manifest file.
- ran `just deploy nmfsconnect` line in the terminal (where `nmfsconnect` is the server nickname).

The api is then setup and ready to use!

## How to use the API
- Click on buttons directly in the connect interface
- Use as a normal RESTFUL API.

## What are these files?
- plumber.R contains the R code to make the API
- the ss, ss_summary.sso, starter.ss, wtatage.ss, control.ss, and data.ss
are files that are needed for the api
- the justfile contains instructions that can be run to do common tasks (like deploy)
- renv and renv.lock I think are related to using `renv`. Not sure if they
are essential or not.

## theoretical how to deploy

In theory, 

- install [just](https://just.systems/man/en/chapter_1.html)

```bash
just setup           # install ss, copy an example from github
just run             # run ss on that example
just deploy positconnect # deploy ss api using manifest
```

However, we had to do some additional things.

# What is the use case for this?

One use case is that we currently cannot deploy shiny apps that run exes
to posit connect. Instead, what we can do is change the app so that it 
calls the api to run SS3, and run results are then transfered back. This
means that shiny apps similar to this could be deployed as web apps instead of
only used locally.
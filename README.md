# Bootstrap React-Native

Script built to make React-Native development easier. Based on https://github.com/App2Sales/a2s-cli

# How to use

Clone: 

```Shell
git clone https://github.com/kcotias/rn-starter
``` 

run the script: 

```Shell
bash /<path_to_script>/rn-starter/reactNativeBootstrap.sh <option> <NAME>
``` 

|Props|Description|Required|
|---------|---------|---------|
|option|Available options to choose: <br/> init - Starts a new project <br/> screen - creates a new screen  <br/> component - creates a new component | true| 
|name| Name of the project, screen, or component to be created | true|

# Alias

To make even easier here are some alias to use

```Shell
alias rnInit='bash {YOUR_DIRECTORY/rn-starter.sh init $*'
alias rnComponent='bash {YOUR_DIRECTORY/rn-starter.sh component $*'
alias rnScreen='bash {YOUR_DIRECTORY/rn-starter.sh screen $*'
```

********* This project was idealized and first executed by my current company (Nov/2018) --> github.com/app2sales <--, all thanks and credits goes for app2sales and our team. **************************

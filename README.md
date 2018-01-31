# docker-utils

## Install

### For Linux/macOS

```
alias {{ short command name }}="{{ path to .sh file }} {{ container name }}"
```

For example:


alias lc="~/docker-exec-project.sh laravel"


### For Windows

```
doskey {{ short command name }}={{ path to .bat file }} {{ container name }} $*
```

For example:


doskey lc=C:\Users\egorvakh\Desktop\docker-exec-project.bat laravel $*

## Usage:


```
lc pwd
```

# myshellscripts
The shell scripts I write for fun and personal use.

## Featured Scripts:

### IPV6 Connector for mac users at Tsinghua.

To start ipv6 service for your mac, open the terminal, enter the directory holding the scripts, and input:

```
sh/ipv6 start
```

or:

```
sh/ipv6 stop
```

to stop ipv6 service.

## Usage

### Adding executive rights
You may need to add executive rights to the script files by:

```
chmod +x sh/*
```

### Add shortcuts

To make shortcuts for this scripts, you may add alias of this scripts in the ~/.zshrc or ~/.bash_profile.

Or simply add the following line to your ~/.zshrc or ~/.bash_profile and restart your terminal.

```
export PATH="DIR_OF_THE_SH_FILES:$PATH"
```

Here the ```DIR_OF_THE_SH_FILES``` represents the directory where you have puts these sccript files. For me, it is ```~/MyScripts/sh```


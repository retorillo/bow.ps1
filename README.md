# Run Linux(BoW) commands on Windows PowerShell

Linux (BoW/Bash on Ubuntu on Windows) `bash -c` aliases 
and Windows-BoW path conversion for Windows PowerShell.

For example, if want to run `bash -c vim` to edit PowerShell configuration
file `$PROFILE`, you must build long path of BoW. :fearful:

```
PS> bash -c "vim /mnt/c/Users/$env:USERNAME/Documents/..."
```

Aliases and path-conversion provided by this script might be able to free you
from bothersome work. :innocent:

```
PS> vim $PROFILE
```

## Installation

```
PS> type ./bow.ps1 >> $PROFILE
PS> powershell
```

## Unexpected side effects of path conversion

Now, path conversion logic is **very cheap**.
In general case, it seems to work fine, but please pay attention when running
important command.

## License

Distributed under the MIT license.
Copyright (C) 2016 Retorillo

# Guide for installing mikrokosmos
# First Solution
## go to $HOME/.cabal/bin
## look for mikrokosmos
## if there is a mikrokosmos file
### open $HOME/.profile (or $HOME/.bash\_profile)
### add PATH="$HOME/.cabal/bin:$PATH"
# Second Solution
## go to .local/[share|bin]
### create it if not exists
## Download mikrokosmos 
### in terminal: "git clone https://github.com/mroman42/mikrokosmos.git"
### ar trebui sa ai un director mikrokosmos in ~/.local/[share|bin]
## Instalearea
### cd mikrokosmos
### cd source
### ghc Main.hs -o mikrokosmos
### vim ~/.[profile|bash\_profile]
### add: PATH="$HOME/.local/[share|bin]/mikrokosmos/source:$PATH"


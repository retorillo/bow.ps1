function convertToUbuntuPath([string]$path) {
  $drive = [regex]'^([a-zA-Z]):'
  $path = $drive.replace($path, {
    param($m)
    return '/mnt/' + $m.groups[1].value.tolower();
  })
  return $path.replace('\', '/')
}
function buildUbuntuCommand([string]$command, [object[]]$commandargs) {
  return [string]::join(' ', $(
    $s = [regex]'\s'
    echo $command
    $commandargs | % {
      $p = convertToUbuntuPath $_
      if ($s.isMatch($p)) {
        $p = $s.replace($p, '\$0')
      }
      echo $p
    }
  ));
}
function startUbuntuCommand($command, $commandargs) {
  bash -c "$(buildUbuntuCommand $command $commandargs)"
}

function start_vim() { startUbuntuCommand 'vim' $args }
set-alias vim start_vim
function start_grep() { startUbuntuCommand 'grep' $args }
set-alias grep start_grep
function start_ssh() { startUbuntuCommand 'ssh' $args }
set-alias ssh start_ssh
function start_git() { startUbuntuCommand 'git' $args }
set-alias git start_git

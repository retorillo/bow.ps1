function convertToUbuntuPath([string]$path) {
  return ([regex]'^([a-zA-Z]):').replace($path, {
    param($m)
    return '/mnt/' + $m.groups[1].value.tolower();
  }).replace('\', '/')
}
function buildUbuntuCommand([string]$command, [object[]]$commandargs) {
  return [string]::join(' ', $(
    $s = [regex]'[\s()]'
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
function get_title() { return $host.ui.rawui.windowtitle; }
function set_title($value) { $host.ui.rawui.windowtitle = $value; }

function start_x($command, $arguments) {
 $t = get_title
 set_title ($command + ' (bash)')
 startUbuntuCommand $command $arguments 
 set_title $t
}
function start_vim() { start_x 'vim' $args }
set-alias vim start_vim
function start_grep() { start_x 'grep' $args }
set-alias grep start_grep
function start_ssh() { start_x 'ssh' $args }
set-alias ssh start_ssh
function start_scp() { start_x 'scp' $args }
set-alias scp start_scp
function start_git() { start_x 'git' $args }
set-alias git start_git
function start_bc() { start_x 'bc' $args }
set-alias bc start_bc

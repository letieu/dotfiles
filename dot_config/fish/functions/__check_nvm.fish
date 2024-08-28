function __check_nvm --on-variable PWD --description 'Change node version base on .nvmrc'
  status --is-command-substitution; and return

  if test -e .nvmrc
    nvm use
  end
end

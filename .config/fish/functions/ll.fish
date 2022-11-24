function ll --wraps=ls --wraps='ls -hog' --wraps='ls -ahog' --description 'alias ll ls -ahog'
  ls -ahog $argv; 
end

  # mostly from https://github.com/nficano/dotfiles/blob/master/misc/bootstrap#L152
  echo "Setting preferred default file associations ..."

  duti -s com.microsoft.VSCode .c all
  duti -s com.microsoft.VSCode .cpp all
  duti -s com.microsoft.VSCode .cs all
  duti -s com.microsoft.VSCode .css all
  duti -s com.microsoft.VSCode .go all
  duti -s com.microsoft.VSCode .java all
  duti -s com.microsoft.VSCode .js all
  duti -s com.microsoft.VSCode .sass all
  duti -s com.microsoft.VSCode .scss all
  duti -s com.microsoft.VSCode .less all
  duti -s com.microsoft.VSCode .vue all
  duti -s com.microsoft.VSCode .cfg all
  duti -s com.microsoft.VSCode .json all
  duti -s com.microsoft.VSCode .jsx all
  duti -s com.microsoft.VSCode .lua all
  duti -s com.microsoft.VSCode .md all
  duti -s com.microsoft.VSCode .php all
  duti -s com.microsoft.VSCode .pl all
  duti -s com.microsoft.VSCode .py all
  duti -s com.microsoft.VSCode .rb all
  duti -s com.microsoft.VSCode .rs all
  duti -s com.microsoft.VSCode .sh all
  duti -s com.microsoft.VSCode .swift all
  duti -s com.microsoft.VSCode .txt all
  duti -s com.microsoft.VSCode .conf all
  duti -s com.microsoft.VSCode .yaml all
  duti -s com.microsoft.VSCode .yml all

  duti -s com.microsoft.VSCode public.json all
  duti -s com.microsoft.VSCode public.plain-text all
  duti -s com.microsoft.VSCode public.python-script all
  duti -s com.microsoft.VSCode public.shell-script all
  duti -s com.microsoft.VSCode public.source-code all
  duti -s com.microsoft.VSCode public.text all
  duti -s com.microsoft.VSCode public.unix-executable all

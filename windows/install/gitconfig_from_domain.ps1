$searcher = [adsisearcher]"(samaccountname=$env:USERNAME)"
$mail = $searcher.FindOne().Properties.mail
$displayname = $searcher.FindOne().Properties.displayname

# wird aus der Domäne gelesen
git config --global user.name "$displayname"
git config --global user.email "$mail"
# zur Sicherheit
git config --global --unset http.proxy
# schönere Farben
git config --global color.ui true
# Tags werden automatisch mit gepusht
git config --global push.followTags true
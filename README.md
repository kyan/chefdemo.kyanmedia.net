# Build

This app is for testing Chef builds. You can commision a box using the command below:

`knife bootstrap chefdemo.kyanmedia.net -x root -r 'role[chefdemo-kyanmedia-net]' -N 'chefdemo.kyanmedia.net'`

# Deploy

`bundle exec cap staging deploy:setup`
`bundle exec cap production deploy:setup`
`bundle exec cap staging deploy:migrations`
`bundle exec cap production deploy:migrations`

# View

visit http://chefdemo.kyanmedia.net

and you should see a web page with some messages.
# ruby_practice
ruby language practice

## Ruby irb tool installation:
There is somthing wrong with installation of ruby-irb on Manjaro Linux.
We have to install from https://github.com/ruby/irb on your machine.
```
$ git clone https://github.com/ruby/irb.git
$ echo "gem 'irb'" >> irb/Gemfile
$ gem install irb
$ echo "PATH=~/.gem/ruby/2.6.0/bin:$PATH" >> ~/.bashrc
$ source  ~/.bashrc
$ irb
irb(main):001:0>
```


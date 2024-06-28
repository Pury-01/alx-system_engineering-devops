# This project is on configuration management 
# It exploits the Puppet tool to: 
	1. create a file
	2. install flask 
	3. create a manifest that kills a process named killmenow

# Usage
Install puppet
	$apt-get install -y ruby=1:2.7+1 --allow-downgrades
	$ apt-get install -y ruby-augeas
	$ apt-get install -y ruby-shadow
	$ apt-get install -y puppet

Install puppet-lint
	$gem install puppet-lint

Run
puppet apply file.pp
puppet-lint file.pp 

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

System Requirements:

Operating System: Linux
RVM version: 1.29.12
Ruby version 2.7.1
Rails version 7.0.2.3
Database: MariaDB

How To Run:

Step1.  Install Dependencies
sudo apt update
sudo apt install -y curl gnupg2 dirmngr git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

Step2. Install Node.js
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs

Step3. Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm


Step4. Install Ruby
rvm install 2.7.1
rvm use 2.7.1
gem install bundler

Step5. Install Rails
gem install rails
rails -v

Step6. Install MariaDB Database
sudo apt install -y mariadb-server mariadb-client
sudo apt install -y libmariadb-dev
gem install mysql2
sudo mysql -u root -p

Create a database user for your application.
CREATE USER 'tinyurl'@'localhost' IDENTIFIED BY 'tinyurl';
GRANT ALL PRIVILEGES ON *.* TO 'tinyurl'@'localhost';
exit


Step7. Download the code from github repository
git clone https://github.com/jamsheedkhalid/tinyurl.git

Step8. Configure Database in config/database.yml file

Step9. Update gems using the command bundle install

Step10. Run database migrations using rake db:migrate

step11. Configure email in config/environment/development.rb

Step12. Run local server using rails server


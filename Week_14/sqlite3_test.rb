#!/usr/local/bin/ruby
# Name: Your Name
# File: sqlite3_test.rb
# Desc: Proof of concept for sqlite3 gem; requires installing the sqlite3 gem on Hills as a regular user; creates salted, hashed passwords using digest and securerandom.
$:.unshift File.dirname(__FILE__)
ENV['GEM_HOME']='/students/cbastian/mygems'
require 'rubygems'
require 'sqlite3'
require 'digest'
require 'securerandom'

$db = SQLite3::Database.new("dbfile")

create_users_table_sql =  <<SQL
CREATE TABLE users (
  id integer primary key,
  name varchar(15) not null,
  email varchar(18) not null unique,
  hashed_password varchar(64) not null,
  password_salt varchar(32) not null)
SQL

begin
  $db.execute("DROP TABLE users")
rescue Exception => e
  puts e.message
  puts "Recreating the USERS table"
end

$db.execute(create_users_table_sql)
users = [
  %w(homer homer@homer.com topsecret1),
  %w(marge marge@marge.com topsecret2),
  %w(bart bart@bart.com topsecret3),
  %w(lisa lisa@lisa.com, topsecret4),
  %w(slh slh@slh.com, topsecret5),
  %w(snowball snowball@snowbal.com, topsecret6)
]

$db.execute('BEGIN')

user.each do |user|
  password_salt = SecureRandom.base64(32)
  user[2] = Digest::SHA2.hexdigest(user[2] + password_salt)
  begin
     $db.execute("INSERT INTO users (id,name,email,hashed_password, password_salt) values (null,?,?,?,?)", user << password_salt)
  rescue SQLite3::ConstraintException => e
    puts
    puts "#" * 60
    puts "ERROR: " +  user[1] + " is already in the database."
    puts "Rolling back to the initial state of the database."
    puts "#" * 60
    $db.execute('ROLLBACK')
    exit
   end
 end
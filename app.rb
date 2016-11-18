#!/usr/bin/env ruby
require 'sinatra'
require 'rerun'
require_relative 'lib/champion'
require_relative 'lib/team'

enable :sessions

helpers do
  def init
    session['friendly_team'] ||= Team.new("Your Team")
    session['enemy_team'] ||= Team.new("Enemy Team")
    # session['friendly_team'] = Team.new
  end
end

before do
  init
end

get '/' do
  erb :roster, :locals => { :friendly_team => session['friendly_team'], :enemy_team => session['enemy_team'] }
end

post '/add-friendly-champ' do
  friendly_team = session['friendly_team']
  champ = params['friendly-champ-1']

  friendly_team.add_by_name(champ)

  session['friendly_team'] = friendly_team

  redirect to('/')
end

get '/reset' do
  session.clear
  redirect to('/')
end

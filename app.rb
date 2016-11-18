#!/usr/bin/env ruby
require 'sinatra'
require 'rerun'
require_relative 'lib/champion'
require_relative 'lib/team'

enable :sessions

helpers do
  def init
    session['friendly_team'] ||= Team.new("Your Team", "friendly_team")
    session['enemy_team'] ||= Team.new("Enemy Team", "enemy_team")
    # session['friendly_team'] = Team.new
  end
end

before do
  init
end

get '/' do
  erb :roster, :locals => { :friendly_team => session['friendly_team'], :enemy_team => session['enemy_team'] }
end

post '/add-champ' do
  team_name = params['team-name']
  if team_name == "Your Team"
    team_descriptor = 'friendly_team'
  elsif team_name == "Enemy Team"
    team_descriptor = 'enemy_team'
  else
    raise ArgumentError "Invalid team"
  end
  team = session[team_descriptor]
  champ = params['champ-name']

  team.add_by_name(champ)

  session[team_descriptor] = team

  redirect to('/')
end

get '/reset' do
  session.clear
  redirect to('/')
end

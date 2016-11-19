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
  def name_to_descriptor(team_name)
    if team_name == "Your Team"
      'friendly_team'
    elsif team_name == "Enemy Team"
      'enemy_team'
    else
      raise ArgumentError "Invalid team"
    end
  end
  def other_team_descriptor(team_name)
    if team_name == "Your Team"
      'enemy_team'
    elsif team_name == "Enemy Team"
      'friendly_team'
    else
      raise ArgumentError "Invalid team"
    end
  end
end

before do
  init
end

get '/' do
  erb :roster, :locals => { :friendly_team => session['friendly_team'], :enemy_team => session['enemy_team'] }
end

get '/add-champ' do
  team_name = params['team-name']
  team_descriptor = name_to_descriptor(team_name)
  team = session[team_descriptor]
  champ = params['champ-name']

  team.add_by_name(champ)

  session[team_descriptor] = team

  redirect to('/')
end

get '/counterpick-champ' do
  team_name = params['team-name']
  team_descriptor = other_team_descriptor(team_name)
  team = session[team_descriptor]
  champ = params['champ-name']

  team.add_by_name(champ)

  session[team_descriptor] = team

  redirect to('/')
end

get '/remove' do
  team_name = params['team-name']
  team_descriptor = name_to_descriptor(team_name)
  team = session[team_descriptor]
  index = params['index']

  team.remove_by_index(index)

  session[team_descriptor] = team

  redirect to('/')
end

get '/reset' do
  session.clear
  redirect to('/')
end
